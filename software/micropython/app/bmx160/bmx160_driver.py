import time
from . import constants
try:
    import struct
except ImportError:
    import ustruct as struct

# from adafruit_bus_device.i2c_device import I2CDevice
from micropython import const
# from adafruit_register.i2c_struct import Struct, UnaryStruct
# from adafruit_register.i2c_bits import ROBits, RWBits
# from adafruit_register.i2c_bit import ROBit, RWBit


# Each goes with a different sensitivity in decreasing order
AccelSensitivity2Gravity_values = [2048, 4086, 8192, 16384]   # accelerometer sensitivity. See Section 1.2, Table 2
GyroSensitivity2DegPerSec_values = [16.4, 32.8, 65.6, 131.2, 262.4]  # Section 1.2, Table 3

g_TO_METERS_PER_SECOND_SQUARED = 1/9.80665 # in m/s^2

AccelSensitivity2Gravity = const(16384)  # accelerometer sensitivity. See Section 1.2, Table 2
GyroSensitivity2DegPerSec = 131.2        # gyroscope sensitivity. See Section 1.2, Table 3

# class _ScaledReadOnlyStruct(Struct):
#     def __init__(self, register_address, struct_format, scale):
#         super(_ScaledReadOnlyStruct, self).__init__(
#             register_address, struct_format)
#         self.scale = scale

#     # NOTE: I think super() may be an allocating operation.
#     def __get__(self, obj, objtype=None):
#         result = super(_ScaledReadOnlyStruct, self).__get__(obj, objtype)
#         return tuple(self.scale * v for v in result)

#     def __set__(self, obj, value):
#         raise NotImplementedError()


# TODO replace _SclaedReadOnlyStruct with Struct in BMX160 so that the
# scale factor can be changed as a function of range mode


class BMX160:
    """
    Driver for the BMX160 accelerometer, magnetometer, gyroscope.

    In the buffer, bytes are allocated as follows:
        - mag 0-5
        - rhall 6-7 (not relevant?)
        - gyro 8-13
        - accel 14-19
        - sensor time 20-22
    """

    # multiplicative constants

    # NOTE THESE FIRST TWO GET SET IN THE INIT SEQUENCE
    ACC_SCALAR = 1/(AccelSensitivity2Gravity * g_TO_METERS_PER_SECOND_SQUARED) # 1 m/s^2 = 0.101971621 g
    GYR_SCALAR = 1/GyroSensitivity2DegPerSec_values[4]
    MAG_SCALAR = 1/16
    TEMP_SCALAR = 0.5**9

    _accel = Struct(constants.BMX160_ACCEL_DATA_ADDR, '<hhh') # this is the default scalar, but it should get reset anyhow in init
    _gyro  = Struct(constants.BMX160_GYRO_DATA_ADDR, '<hhh')
    _mag   = Struct(constants.BMX160_MAG_DATA_ADDR, '<hhh')
    _temp  = Struct(constants.BMX160_TEMP_DATA_ADDR, '<h')


    ### STATUS BITS
    status         = ROBits(8, constants.BMX160_STATUS_ADDR, 0)
    status_acc_pmu = ROBits(2, constants.BMX160_PMU_STATUS_ADDR, 4)
    status_gyr_pmu = ROBits(2, constants.BMX160_PMU_STATUS_ADDR, 2)
    status_mag_pmu = ROBits(2, constants.BMX160_PMU_STATUS_ADDR, 0)
    cmd = RWBits(8, constants.BMX160_COMMAND_REG_ADDR, 0)
    foc = RWBits(8, constants.BMX160_FOC_CONF_ADDR, 0)

    # see ERR_REG in section 2.11.2
    _error_status = ROBits(8, constants.BMX160_ERROR_REG_ADDR, 0)
    error_code    = ROBits(4, constants.BMX160_ERROR_REG_ADDR, 1)
    drop_cmd_err  = ROBit(constants.BMX160_ERROR_REG_ADDR, 6)
    fatal_err     = ROBit(constants.BMX160_ERROR_REG_ADDR, 0)

    # straight from the datasheet. Need to be renamed and better explained
    @property
    def drdy_acc(self): return (self.status >> 7) & 1
    @property
    def drdy_gyr(self): return (self.status >> 6) & 1
    @property
    def drdy_mag(self): return (self.status >> 5) & 1
    @property
    def nvm_rdy(self): return (self.status >> 4) & 1
    @property
    def foc_rdy(self): return (self.status >> 3) & 1
    @property
    def mag_man_op(self): return (self.status >> 2) & 1
    @property
    def gyro_self_test_ok(self): return (self.status >> 1) & 1

    _BUFFER = bytearray(40)
    _smallbuf = bytearray(6)

    _gyro_range = RWBits(8, constants.BMX160_GYRO_RANGE_ADDR, 0)
    _accel_range = RWBits(8, constants.BMX160_ACCEL_RANGE_ADDR, 0)

    # _gyro_bandwidth = NORMAL
    # _gyro_powermode = NORMAL
    _gyro_odr = 25    # Hz

    # _accel_bandwidth = NORMAL
    # _accel_powermode = NORMAL
    _accel_odr = 25  # Hz

    # _mag_bandwidth = NORMAL
    # _mag_powermode = NORMAL
    _mag_odr = 25    # Hz
    _mag_range = 250 # deg/sec


    def __init__(self, i2c):
        self.i2c = i2c
        # soft reset & reboot
        self.cmd = constants.BMX160_SOFT_RESET_CMD
        time.sleep(constants.BMX160_SOFT_RESET_DELAY)
        # Check ID registers.
        ID = self.i2c.read(constants.BMX160_I2C_ADDR, constants.BMX160_CHIP_ID_ADDR)
        if ID != constants.BMX160_CHIP_ID:
            raise RuntimeError('Could not find BMX160, check wiring!')

        # print("status:", format_binary(self.status))
        # set the default settings
        self.init_mag()
        self.init_accel()
        self.init_gyro()
        # print("status:", format_binary(self.status))

    ######################## SENSOR API ########################

    def read_all(self):
        return self.i2c.read(constants.BMX160_I2C_ADDR, constants.BMX160_MAG_DATA_ADDR, 20, self._BUFFER)

    # synonymous
    @property
    def error_status(self):
        return format_binary(self._error_status)
    @property
    def query_error(self):
        return format_binary(self._error_status)

    ### ACTUAL API
    @property
    def gyro(self):
        return tuple(x * self.GYR_SCALAR for x in self._gyro)

    @property
    def accel(self):
        return tuple(x * self.ACC_SCALAR for x in self._accel)

    @property
    def mag(self):
        return tuple(x * self.MAG_SCALAR for x in self._mag)

    @property
    def temperature(self):
        return self._temp[0]*self.TEMP_SCALAR+23
    @property
    def temp(self):
        return self._temp[0]*self.TEMP_SCALAR+23

    @property
    def sensortime(self):
        tbuf = self.i2c.read(constants.BMX160_I2C_ADDR, constants.BMX160_SENSOR_TIME_ADDR, 3, self._smallbuf)
        t0, t1, t2 = tbuf[:3]
        t = (t2 << 16) | (t1 << 8) | t0
        t *= 0.000039 # the time resolution is 39 microseconds
        return t

    ######################## SETTINGS RELATED ########################

    ############## GYROSCOPE SETTINGS  ##############
    # NOTE still missing BW / OSR config, but those are more complicated

    def init_gyro(self):
        # BW doesn't have an interface yet
        self._gyro_bwmode = constants.BMX160_GYRO_BW_NORMAL_MODE
        # These rely on the setters to do their magic.
        self.gyro_range = constants.BMX160_GYRO_RANGE_500_DPS
        # self.GYR_SCALAR = 1
        # self.GYR_SCALAR = 1/GyroSensitivity2DegPerSec_values[1]

        self.gyro_odr = 25
        self.gyro_powermode = constants.BMX160_GYRO_NORMAL_MODE

    @property
    def gyro_range(self):
        return self._gyro_range

    @gyro_range.setter
    def gyro_range(self, rangeconst):
        """
        The input is expected to be the BMX160-constant associated with the range.

        deg/s | bmxconst value | bmxconst_name
        ------------------------------------------------------
        2000  |   0            |  BMX160_GYRO_RANGE_2000_DPS
        1000  |   1            |  BMX160_GYRO_RANGE_1000_DPS
        500   |   2            |  BMX160_GYRO_RANGE_500_DPS
        250   |   3            |  BMX160_GYRO_RANGE_250_DPS
        125   |   4            |  BMX160_GYRO_RANGE_125_DPS

        ex: bmx.gyro_range = BMX160_GYRO_RANGE_500_DPS
        equivalent to: bmx.gyro_range = 2
        """

        if rangeconst in constants.BMX160_GYRO_RANGE_CONSTANTS:
            self._gyro_range = rangeconst
            # read out the value to see if it changed successfully
            rangeconst = self._gyro_range
            val = constants.BMX160_GYRO_RANGE_VALUES[rangeconst]
            self.GYR_SCALAR = (val / 32768.0)
        else:
            pass


    @property
    def gyro_odr(self):
        return self._gyro_odr

    @gyro_odr.setter
    def gyro_odr(self, odr):
        """
        Set the output data rate of the gyroscope. The possible ODRs are 1600, 800, 400, 200, 100,
        50, 25, 12.5, 6.25, 3.12, 1.56, and 0.78 Hz. Note, setting a value between the listed ones
        will round *downwards*.
        """
        res = self.generic_setter(odr, constants.BMX160_GYRO_ODR_VALUES,
                                  constants.BMX160_GYRO_ODR_CONSTANTS,
                                  constants.BMX160_GYRO_CONFIG_ADDR,
                                  "gyroscope odr")
        if res != None:
            self._gyro_odr = res[1]

    @property
    def gyro_powermode(self):
        return self._gyro_powermode

    @gyro_powermode.setter
    def gyro_powermode(self, powermode):
        """
        Set the power mode of the gyroscope. Unlike other setters, this one has to directly take the
        BMX160-const associated with the power mode. The possible modes are:
        `BMX160_GYRO_SUSPEND_MODE`
        `BMX160_GYRO_NORMAL_MODE`
        `BMX160_GYRO_FASTSTARTUP_MODE`
        """
        if powermode not in constants.BMX160_GYRO_MODES:
            print("Unknown gyroscope powermode: " + str(powermode))
            return

        self.i2c.write(constants.BMX160_I2C_ADDR, constants.BMX160_COMMAND_REG_ADDR, powermode)
        if int(self.query_error) == 0:
            self._gyro_powermode = powermode
        else:
            settingswarning("gyroscope power mode")

        # NOTE: this delay is a worst case. If we need repeated switching
        # we can choose the delay on a case-by-case basis.
        time.sleep(constants.BMX160_GYRO_DELAY)


    ############## ACCELEROMETER SETTINGS  ##############

    def init_accel(self):
        # BW doesn't have an interface yet
        # self.write_u8(BMX160_ACCEL_CONFIG_ADDR, BMX160_ACCEL_BW_NORMAL_AVG4)
        # self._accel_bwmode = BMX160_ACCEL_BW_NORMAL_AVG4
        # These rely on the setters to do their magic.
        self.accel_range = constants.BMX160_ACCEL_RANGE_8G
        self.accel_odr = 25
        self.accel_powermode = constants.BMX160_ACCEL_NORMAL_MODE

    @property
    def accel_range(self):
        return self._accel_range

    @accel_range.setter
    def accel_range(self, rangeconst):
        """
        The input is expected to be the BMX160-constant associated with the range.

        deg/s | bmxconst value | bmxconst name
        ------------------------------------------------------
        2     |   3            | BMX160_ACCEL_RANGE_2G
        4     |   5            | BMX160_ACCEL_RANGE_4G
        8     |   8            | BMX160_ACCEL_RANGE_8G
        16    |   12           | BMX160_ACCEL_RANGE_16G

        ex: bmx.accel_range = BMX160_ACCEL_RANGE_4G
        equivalent to: bmx.accel_range = 5
        """

        if rangeconst in constants.BMX160_ACCEL_RANGE_CONSTANTS:
            self._accel_range = rangeconst
            # read out the value to see if it changed successfully
            rangeconst = self._accel_range
            # convert to 0-3 range for indexing
            ind = rangeconst >> 2
            val = constants.BMX160_ACCEL_RANGE_VALUES[ind]
            self.ACC_SCALAR = (val / 32768.0) / g_TO_METERS_PER_SECOND_SQUARED
        else:
            pass

    @property
    def accel_odr(self):
        return self._accel_odr

    @accel_odr.setter
    def accel_odr(self, odr):
        res = self.generic_setter(odr, constants.BMX160_ACCEL_ODR_VALUES,
                                  constants.BMX160_ACCEL_ODR_CONSTANTS,
                                  constants.BMX160_ACCEL_CONFIG_ADDR,
                                  "accelerometer odr")
        if res != None:
            self._accel_odr = res[1]

    @property
    def accel_powermode(self):
        return self._accel_powermode

    @accel_powermode.setter
    def accel_powermode(self, powermode):
        """
        Set the power mode of the accelerometer. Unlike other setters, this one has to directly take the
        BMX160-const associated with the power mode. The possible modes are:
        `BMI160_ACCEL_NORMAL_MODE`
        `BMI160_ACCEL_LOWPOWER_MODE`
        `BMI160_ACCEL_SUSPEND_MODE`
        """
        if powermode not in constants.BMX160_ACCEL_MODES:
            print("Unknown accelerometer power mode: " + str(powermode))
            return

        self.i2c.write(constants.BMX160_I2C_ADDR, constants.BMX160_COMMAND_REG_ADDR, powermode)
        if int(self.query_error) == 0:
            self._accel_powermode = powermode
        else:
            settingswarning("accelerometer power mode")

        # NOTE: this delay is a worst case. If we need repeated switching
        # we can choose the delay on a case-by-case basis.
        time.sleep(constants.BMX160_ACCEL_DELAY)

    ############## MAGENTOMETER SETTINGS  ##############

    def init_mag(self):
        # see pg 25 of: https://ae-bst.resource.bosch.com/media/_tech/media/datasheets/BST-BMX160-DS000.pdf
        self.i2c.write(constants.BMX160_I2C_ADDR, constants.BMX160_COMMAND_REG_ADDR, constants.BMX160_MAG_NORMAL_MODE)
        time.sleep(0.00065) # datasheet says wait for 650microsec
        self.i2c.write(constants.BMX160_I2C_ADDR, constants.BMX160_MAG_IF_0_ADDR, 0x80)
        # put mag into sleep mode
        self.i2c.write(constants.BMX160_I2C_ADDR, constants.BMX160_MAG_IF_3_ADDR, 0x01)
        self.i2c.write(constants.BMX160_I2C_ADDR, constants.BMX160_MAG_IF_2_ADDR, 0x4B)
        # set x-y to regular power preset
        self.i2c.write(constants.BMX160_I2C_ADDR, constants.BMX160_MAG_IF_3_ADDR, 0x04)
        self.i2c.write(constants.BMX160_I2C_ADDR, constants.BMX160_MAG_IF_2_ADDR, 0x51)
        # set z to regular preset
        self.i2c.write(constants.BMX160_I2C_ADDR, constants.BMX160_MAG_IF_3_ADDR, 0x0E)
        self.i2c.write(constants.BMX160_I2C_ADDR, constants.BMX160_MAG_IF_2_ADDR, 0x52)
        # prepare MAG_IF[1-3] for mag_if data mode
        self.i2c.write(constants.BMX160_I2C_ADDR, constants.BMX160_MAG_IF_3_ADDR, 0x02)
        self.i2c.write(constants.BMX160_I2C_ADDR, constants.BMX160_MAG_IF_2_ADDR, 0x4C)
        self.i2c.write(constants.BMX160_I2C_ADDR, constants.BMX160_MAG_IF_1_ADDR, 0x42)
        # Set ODR to 25 Hz
        self.i2c.write(constants.BMX160_I2C_ADDR, constants.BMX160_MAG_ODR_ADDR, constants.BMX160_MAG_ODR_25HZ)
        self.i2c.write(constants.BMX160_I2C_ADDR, constants.BMX160_MAG_IF_0_ADDR, 0x00)
        # put in low power mode.
        self.i2c.write(constants.BMX160_I2C_ADDR, constants.BMX160_COMMAND_REG_ADDR, constants.BMX160_MAG_LOWPOWER_MODE)
        time.sleep(0.1) # takes this long to warm up (empirically)


    ## UTILS:
    def generic_setter(self, desired, possible_values, bmx_constants, config_addr, warning_interp = ""):
        i = find_nearest_valid(desired, possible_values)
        rounded = possible_values[i]
        bmxconst = bmx_constants[i]
        self.i2c.write(constants.BMX160_I2C_ADDR, config_addr, bmxconst)
        e = self.error_code

        if e == constants.BMX160_OK:
            return (i, rounded)
        else:
            settingswarning(warning_interp)


# class BMX160_I2C(BMX160):
#     """Driver for the BMX160 connect over I2C."""

#     def __init__(self, i2c):
#         self.i2c = i2c
#         self.i2c.init(i2c.PERIPHERAL, addr=constants.BMX160_I2C_ADDR)
#         super().__init__()

#     def read_u8(self, address):
#         self._BUFFER[0] = address & 0xFF
#         self.i2c.write_then_readinto(self._BUFFER, self._BUFFER, out_end=1, in_start=1, in_end=2)
#         return self._BUFFER[1]

#     def read_bytes(self, address, count, buf):
#         buf[0] = address & 0xFF
#         self.i2c.write_then_readinto(buf, buf, out_end=1, in_end=count)
#         return buf

#     def write_u8(self, address, val):
#         self._BUFFER[0] = address & 0xFF
#         self._BUFFER[1] = val & 0xFF
#         self.i2c.write(self._BUFFER, end=2, stop=True)


# GENERIC UTILS:

def find_nearest_valid(desired, possible_values):
    # NOTE: assumes `possible_values` is sorted in decreasing order

    # This line finds the first value less than or equal to the desired value and returns its index.
    # If no such value exists (desired is lower than all possible), the line throws a StopIteration
    # Exception. In that case we return -1 as the index to use (i.e. the last/smallest value in the list)
    try:
        return next(filter(lambda x: (desired >= x[1]), enumerate(possible_values)))[0]
    except:
        return -1

def settingswarning(interp = ""):
    if interp != "":
            interp = " --"  + interp + " -- "
    print("BMX160 error occurred during " + interp +
         "setting change. \nSetting not successfully changed and BMX160 may be in error state.")


def format_binary(b):
    return '{:0>8}'.format(bin(b)[2:])