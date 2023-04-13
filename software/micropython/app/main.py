import os
from machine import SPI, Pin
from .i2c import OTI2C
import time
from .drivers import sdcard
# from .bmx160 import bmx160_driver as bmx160
from .dps368 import dps368_driver as dps368


def mnt():
    spi = SPI(1, baudrate=10000000, polarity=0, phase=0, sck=Pin(18), mosi=Pin(23), miso=Pin(19))
    sd = sdcard.SDCard(spi, Pin(5))
    os.mount(sd, "/sd")


def list():
    files = os.listdir("/sd")
    print(files)

i2c = OTI2C()
print(i2c.scan())

sd_detect = Pin(25, Pin.IN, Pin.PULL_UP)
sd_card_available_string = "SD Card Available" if sd_detect.value() == 0 else "SD Card NOT Available"
print(sd_card_available_string)

#if is_sd_card_available:
print("mnt")
mnt()
print("list")
list()

log = open("/sd/log.csv", "w")
log.write("was für eine absolut beschissene scheisse das alles ist")


dps = dps368.DPS(i2c)
time.sleep(0.1)

count = 0
pressure = 0
while(count < 10):
    pressure = dps.measurePressureOnce()
    log.write(str(pressure) + "\n")
    print("pressure:", pressure)
    count+=1
    time.sleep(1)

log.close()


# bmx = bmx160.BMX160(i2c)
# # conservative warm-up time
time.sleep(0.1)
# #
# print("gyroscope:", bmx.gyro)
# print("accelerometer:", bmx.accel)
# print("magnetometer:", bmx.mag)

