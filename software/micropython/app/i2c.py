from machine import I2C, Pin

class OTI2C():

  def __init__(self) -> None:
    scl = Pin(22, Pin.OUT)  # 22
    sda = Pin(21, Pin.OUT)  # 21
    self.i2c = I2C(scl=scl, sda=sda)

  def read(self, address, bank, bytes=1):
    i2c_reading = int.from_bytes(self.i2c.readfrom_mem(address, bank, bytes), 'big')
    # print("i2c read address: {} bank: {} value: {}".format(hex(address), hex(bank), i2c_reading))
    return i2c_reading

  def write(self, address, bank, value):
    # print("i2c write address: {} bank: {} value: {}".format(hex(address), hex(bank), value))
    self.i2c.writeto_mem(address, bank, bytes([value]))

  def scan(self):
    return self.i2c.scan()