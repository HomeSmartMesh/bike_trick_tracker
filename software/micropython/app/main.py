import os
from machine import I2C, SPI, Pin
from .drivers import sdcard


def mnt():
    sd = sdcard.SDCard(SPI(0), Pin("P22", mode=Pin.OUT))
    os.mount(sd, "/sd")


def list():
    files = os.listdir("/sd")
    print(files)

#from .bmx160 import bmx160_driver as bmx160

i2c = I2C(0, scl=Pin(45), sda=Pin(47))
print(i2c.scan())

sd_detect = Pin(9, Pin.IN, Pin.PULL_UP)
sd_card_available_string = "SD Card Available" if sd_detect.value() == 0 else "SD Card NOT Available"
print(sd_card_available_string)

#if is_sd_card_available:
print("mnt")
mnt()
print("list")
list()

# bmx = bmx160.BMX160_I2C(i2c)
# # conservative warm-up time
# time.sleep(0.1)
#
# print("gyroscope:", bmx.gyro)
# print("accelerometer:", bmx.accel)
# print("magnetometer:", bmx.mag)

