import flash
import gpio 
import spi
import host.file

class SDCard:

  csvfile/file.Stream := ?

  constructor --miso/gpio.Pin --mosi/gpio.Pin --clk/gpio.Pin --cs/gpio.Pin --mount_point/string="/sd":
    bus := spi.Bus
      --miso=miso
      --mosi=mosi
      --clock=clk

    sdcard := flash.Mount.sdcard
      --mount_point=mount_point
      --spi_bus=bus
      --cs=cs

    csvfile = file.Stream.for_write "/sd/test"
    csvfile.close
    print "SDCard initialised"

  write line/string filename/string:
    print "write \"$line\" into file: $filename"
    csvfile = file.Stream.for_write filename
    csvfile.write line
    csvfile.close

  openw filename:
    csvfile = file.Stream.for_write filename

  openr filename:
    csvfile = file.Stream.for_read filename

  write line/string:
    csvfile.write line

  read_file filename -> string:
    return (file.read_content filename).to_string

  close:
    csvfile.close
