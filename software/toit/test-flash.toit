import expect show *
import flash
import gpio
import spi
import host.file
import host.directory show *

main:
  bus := spi.Bus
    --miso=gpio.Pin 19
    --mosi=gpio.Pin 23
    --clock=gpio.Pin 18

  sdcard := flash.Flash.sdcard
    --mount_point="/sd"
    --spi_bus=bus
    --cs=gpio.Pin 5

  print "successfully initialised"
  
  test_content := "some test content"
  filename := "/sd/test3.csv"

  test_out := file.Stream.for_write filename
  test_out.write test_content
  test_out.close

  read_back := (file.read_content filename).to_string
  print read_back

  test_out = file.Stream.for_write filename
  for i := 0; i < 10000; i++:
    test_out.write test_content + "\n"

  test_out.close

  test_in := file.Stream.for_read filename
  length := file.size filename
  try:
    byte_array := test_in.read
    print byte_array.to_string
  finally:
    test_in.close

