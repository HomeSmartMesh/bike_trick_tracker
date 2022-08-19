from micropython import const

# Chip ID
BMX160_CHIP_ID = const(0xD8)

# Soft reset command
BMX160_SOFT_RESET_CMD      = const(0xb6)
BMX160_SOFT_RESET_DELAY    = 0.001

# Command
BMX160_COMMAND_REG_ADDR    = const(0x7E)

# BMX160 Register map
BMX160_CHIP_ID_ADDR        = const(0x00)
BMX160_ERROR_REG_ADDR      = const(0x02)
BMX160_PMU_STATUS_ADDR     = const(0x03)
BMX160_SENSOR_TIME_ADDR    = const(0x18)
BMX160_MAG_DATA_ADDR       = const(0x04)
BMX160_GYRO_DATA_ADDR      = const(0x0C)
BMX160_ACCEL_DATA_ADDR     = const(0x12)
BMX160_STATUS_ADDR         = const(0x1B)
BMX160_INT_STATUS_ADDR     = const(0x1C)
BMX160_TEMP_DATA_ADDR      = const(0x20)
BMX160_FIFO_LENGTH_ADDR    = const(0x22)
BMX160_FIFO_DATA_ADDR      = const(0x24)
BMX160_ACCEL_CONFIG_ADDR   = const(0x40)
BMX160_ACCEL_RANGE_ADDR    = const(0x41)
BMX160_GYRO_CONFIG_ADDR    = const(0x42)
BMX160_GYRO_RANGE_ADDR     = const(0x43)
BMX160_MAG_ODR_ADDR        = const(0x44)
BMX160_FIFO_DOWN_ADDR      = const(0x45)
BMX160_FIFO_CONFIG_0_ADDR  = const(0x46)
BMX160_FIFO_CONFIG_1_ADDR  = const(0x47)
# BMX160_MAG_IF_0_ADDR       = const(0x4B)
BMX160_MAG_IF_0_ADDR       = const(0x4C)
BMX160_MAG_IF_1_ADDR       = const(0x4D)
BMX160_MAG_IF_2_ADDR       = const(0x4E)
BMX160_MAG_IF_3_ADDR       = const(0x4F)
BMX160_INT_ENABLE_0_ADDR   = const(0x50)
BMX160_INT_ENABLE_1_ADDR   = const(0x51)
BMX160_INT_ENABLE_2_ADDR   = const(0x52)
BMX160_INT_OUT_CTRL_ADDR   = const(0x53)
BMX160_INT_LATCH_ADDR      = const(0x54)
BMX160_INT_MAP_0_ADDR      = const(0x55)
BMX160_INT_MAP_1_ADDR      = const(0x56)
BMX160_INT_MAP_2_ADDR      = const(0x57)
BMX160_INT_DATA_0_ADDR     = const(0x58)
BMX160_INT_DATA_1_ADDR     = const(0x59)
BMX160_INT_LOWHIGH_0_ADDR  = const(0x5A)
BMX160_INT_LOWHIGH_1_ADDR  = const(0x5B)
BMX160_INT_LOWHIGH_2_ADDR  = const(0x5C)
BMX160_INT_LOWHIGH_3_ADDR  = const(0x5D)
BMX160_INT_LOWHIGH_4_ADDR  = const(0x5E)
BMX160_INT_MOTION_0_ADDR   = const(0x5F)
BMX160_INT_MOTION_1_ADDR   = const(0x60)
BMX160_INT_MOTION_2_ADDR   = const(0x61)
BMX160_INT_MOTION_3_ADDR   = const(0x62)
BMX160_INT_TAP_0_ADDR      = const(0x63)
BMX160_INT_TAP_1_ADDR      = const(0x64)
BMX160_INT_ORIENT_0_ADDR   = const(0x65)
BMX160_INT_ORIENT_1_ADDR   = const(0x66)
BMX160_INT_FLAT_0_ADDR     = const(0x67)
BMX160_INT_FLAT_1_ADDR     = const(0x68)
BMX160_FOC_CONF_ADDR       = const(0x69)
BMX160_CONF_ADDR           = const(0x6A)

BMX160_ACCEL_BW_NORMAL_AVG4 = const(0x02)
BMX160_GYRO_BW_NORMAL_MODE  = const(0x02)

BMX160_SELF_TEST_ADDR                = const(0x6D)
# Self test configurations
BMX160_ACCEL_SELF_TEST_CONFIG        = const(0x2C)
BMX160_ACCEL_SELF_TEST_POSITIVE_EN   = const(0x0D)
BMX160_ACCEL_SELF_TEST_NEGATIVE_EN   = const(0x09)
BMX160_ACCEL_SELF_TEST_LIMIT         = const(8192)

# Power mode settings
# Accel power mode
BMX160_ACCEL_NORMAL_MODE             = const(0x11)
BMX160_ACCEL_LOWPOWER_MODE           = const(0x12)
BMX160_ACCEL_SUSPEND_MODE            = const(0x10)

BMX160_ACCEL_MODES = [BMX160_ACCEL_NORMAL_MODE,
                      BMX160_ACCEL_LOWPOWER_MODE,
                      BMX160_ACCEL_SUSPEND_MODE]

# Gyro power mode
BMX160_GYRO_SUSPEND_MODE             = const(0x14)
BMX160_GYRO_NORMAL_MODE              = const(0x15)
BMX160_GYRO_FASTSTARTUP_MODE         = const(0x17)

BMX160_GYRO_MODES = [BMX160_GYRO_SUSPEND_MODE,
                     BMX160_GYRO_NORMAL_MODE,
                     BMX160_GYRO_FASTSTARTUP_MODE]

# Mag power mode
BMX160_MAG_SUSPEND_MODE              = const(0x18)
BMX160_MAG_NORMAL_MODE               = const(0x19)
BMX160_MAG_LOWPOWER_MODE             = const(0x1A)

# Accel Range
BMX160_ACCEL_RANGE_2G                = const(0x03)
BMX160_ACCEL_RANGE_4G                = const(0x05)
BMX160_ACCEL_RANGE_8G                = const(0x08)
BMX160_ACCEL_RANGE_16G               = const(0x0C)

# BMX160_ACCEL_RANGE_CONSTANTS = [BMX160_ACCEL_RANGE_16G,
#                                 BMX160_ACCEL_RANGE_8G,
#                                 BMX160_ACCEL_RANGE_4G,
#                                 BMX160_ACCEL_RANGE_2G]
# BMX160_ACCEL_RANGE_VALUES = [16, 8, 4, 2]
BMX160_ACCEL_RANGE_CONSTANTS = [BMX160_ACCEL_RANGE_2G,
                                BMX160_ACCEL_RANGE_4G,
                                BMX160_ACCEL_RANGE_8G,
                                BMX160_ACCEL_RANGE_16G]
BMX160_ACCEL_RANGE_VALUES = [2, 4, 8, 16]


# Gyro Range
BMX160_GYRO_RANGE_2000_DPS           = const(0x00)
BMX160_GYRO_RANGE_1000_DPS           = const(0x01)
BMX160_GYRO_RANGE_500_DPS            = const(0x02)
BMX160_GYRO_RANGE_250_DPS            = const(0x03)
BMX160_GYRO_RANGE_125_DPS            = const(0x04)

BMX160_GYRO_RANGE_CONSTANTS = [BMX160_GYRO_RANGE_2000_DPS,
                               BMX160_GYRO_RANGE_1000_DPS,
                               BMX160_GYRO_RANGE_500_DPS,
                               BMX160_GYRO_RANGE_250_DPS,
                               BMX160_GYRO_RANGE_125_DPS]
BMX160_GYRO_RANGE_VALUES = [2000, 1000, 500, 250, 125]

# Delay in ms settings
BMX160_ACCEL_DELAY                   = 0.005
BMX160_GYRO_DELAY                    = 0.0081
BMX160_ONE_MS_DELAY                  = 0.001
BMX160_MAG_COM_DELAY                 = 0.001
BMX160_GYRO_SELF_TEST_DELAY          = 0.002
BMX160_ACCEL_SELF_TEST_DELAY         = 0.005

# Output Data Rate settings
# Accel Output data rate
BMX160_ACCEL_ODR_RESERVED            = const(0x00)
BMX160_ACCEL_ODR_0_78HZ              = const(0x01)
BMX160_ACCEL_ODR_1_56HZ              = const(0x02)
BMX160_ACCEL_ODR_3_12HZ              = const(0x03)
BMX160_ACCEL_ODR_6_25HZ              = const(0x04)
BMX160_ACCEL_ODR_12_5HZ              = const(0x05)
BMX160_ACCEL_ODR_25HZ                = const(0x06)
BMX160_ACCEL_ODR_50HZ                = const(0x07)
BMX160_ACCEL_ODR_100HZ               = const(0x08)
BMX160_ACCEL_ODR_200HZ               = const(0x09)
BMX160_ACCEL_ODR_400HZ               = const(0x0A)
BMX160_ACCEL_ODR_800HZ               = const(0x0B)
BMX160_ACCEL_ODR_1600HZ              = const(0x0C)
BMX160_ACCEL_ODR_RESERVED0           = const(0x0D)
BMX160_ACCEL_ODR_RESERVED1           = const(0x0E)
BMX160_ACCEL_ODR_RESERVED2           = const(0x0F)

BMX160_ACCEL_ODR_CONSTANTS = [BMX160_ACCEL_ODR_1600HZ,
                              BMX160_ACCEL_ODR_800HZ,
                              BMX160_ACCEL_ODR_400HZ,
                              BMX160_ACCEL_ODR_200HZ,
                              BMX160_ACCEL_ODR_100HZ,
                              BMX160_ACCEL_ODR_50HZ,
                              BMX160_ACCEL_ODR_25HZ,
                              BMX160_ACCEL_ODR_12_5HZ,
                              BMX160_ACCEL_ODR_6_25HZ,
                              BMX160_ACCEL_ODR_3_12HZ,
                              BMX160_ACCEL_ODR_1_56HZ,
                              BMX160_ACCEL_ODR_0_78HZ]
BMX160_ACCEL_ODR_VALUES = [1600, 800, 400, 200, 100, 50, 25, 12.5, 6.25, 3.12, 1.56, 0.78]

# Gyro Output data rate
BMX160_GYRO_ODR_RESERVED             = const(0x00)
BMX160_GYRO_ODR_25HZ                 = const(0x06)
BMX160_GYRO_ODR_50HZ                 = const(0x07)
BMX160_GYRO_ODR_100HZ                = const(0x08)
BMX160_GYRO_ODR_200HZ                = const(0x09)
BMX160_GYRO_ODR_400HZ                = const(0x0A)
BMX160_GYRO_ODR_800HZ                = const(0x0B)
BMX160_GYRO_ODR_1600HZ               = const(0x0C)
BMX160_GYRO_ODR_3200HZ               = const(0x0D)

BMX160_GYRO_ODR_CONSTANTS = [BMX160_GYRO_ODR_3200HZ,
                             BMX160_GYRO_ODR_1600HZ,
                             BMX160_GYRO_ODR_800HZ,
                             BMX160_GYRO_ODR_400HZ,
                             BMX160_GYRO_ODR_200HZ,
                             BMX160_GYRO_ODR_100HZ,
                             BMX160_GYRO_ODR_50HZ]
BMX160_GYRO_ODR_VALUES = [3200, 1600, 800, 400, 200, 100, 50]

# Auxiliary sensor Output data rate
BMX160_MAG_ODR_RESERVED              = const(0x00)
BMX160_MAG_ODR_0_78HZ                = const(0x01)
BMX160_MAG_ODR_1_56HZ                = const(0x02)
BMX160_MAG_ODR_3_12HZ                = const(0x03)
BMX160_MAG_ODR_6_25HZ                = const(0x04)
BMX160_MAG_ODR_12_5HZ                = const(0x05)
BMX160_MAG_ODR_25HZ                  = const(0x06)
BMX160_MAG_ODR_50HZ                  = const(0x07)
BMX160_MAG_ODR_100HZ                 = const(0x08)
BMX160_MAG_ODR_200HZ                 = const(0x09)
BMX160_MAG_ODR_400HZ                 = const(0x0A)
BMX160_MAG_ODR_800HZ                 = const(0x0B)

# Accel, gyro and aux. sensor length and also their combined length definitions in FIFO
BMX160_FIFO_G_LENGTH                 = const(6)
BMX160_FIFO_A_LENGTH                 = const(6)
BMX160_FIFO_M_LENGTH                 = const(8)
BMX160_FIFO_GA_LENGTH                = const(12)
BMX160_FIFO_MA_LENGTH                = const(14)
BMX160_FIFO_MG_LENGTH                = const(14)
BMX160_FIFO_MGA_LENGTH               = const(20)

# I2C address
BMX160_I2C_ADDR            = const(0x68)
BMX160_I2C_ALT_ADDR        = const(0x69)  # alternate address
# Interface settings
BMX160_SPI_INTF            = const(1)
BMX160_I2C_INTF            = const(0)
BMX160_SPI_RD_MASK         = const(0x80)
BMX160_SPI_WR_MASK         = const(0x7F)

# Error related
BMX160_OK                  = const(0)
BMX160_ERROR               = const(-1)