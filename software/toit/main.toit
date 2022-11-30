import gpio.pwm show Pwm
import gpio
import gpio.adc show Adc
import .sdcard show SDCard
import device
import i2c
import toit_dps368 as dps368
import toit_dps368.config as cfg
import bmx160 as bmx160
import melody show Melody
import monitor

LED ::= 2

DUTY_MIN ::= 0.0
DUTY_MAX ::= 1.0
CHANGE_RATE ::= 0.01  // The amount of change every 5ms.

SHORT_PRESS_TIME ::= 500
DOUBLE_TAP_TIME ::= 600
LONG_PRESS_TIME ::= 1200

BOOT_COUNT_KEY ::= "bootcount"
bootcount := 0

STATE_BOOTED  ::= 0
STATE_RUNNING ::= 1
STATE_STOPPED ::= 2
state := 0

sdcard := ?
dps := ?
bmx := ?

melody := Melody 26
latch := monitor.Latch

main:
  task:: play_melody "c5g5e6c6d6g6"
  task:: button

  bootCount

  bus := i2c.Bus
    --sda=gpio.Pin 21
    --scl=gpio.Pin 22

  task:: show_state
  // task:: read_bat
  //task:: collect_sensor_data bus
  // task:: dps bus
  // task:: bmx bus

  sdcard = SDCard 
    --miso=gpio.Pin 19
    --mosi=gpio.Pin 23
    --clk=gpio.Pin 18
    --cs=gpio.Pin 5

  init_dps368 bus
  init_bmx160 bus

  task:: start_data_collection

start_data_collection:
  latch.get //wait for the button press
  
  melody.play "g4b4d4g5"
  filename := "/sd/data-$(bootcount).csv"
  sdcard.openw filename
  sdcard.write "timestamp,press,magnx,magny,magnz,gyrox,gyroy,gyroz,accelx,accely,accelz\n"
  // sdcard.write "timestamp,magnx,magny,magnz,gyrox,gyroy,gyroz,accelx,accely,accelz\n"
  state = STATE_RUNNING
  print "collection running..."
  while true: 
    sdcard.write collect_sensor_data
    sleep --ms=10
    if state == STATE_STOPPED:
      print "collection stopped"
      melody.play "e6c6e6c6"  
      break

  print "session closed"
  sdcard.close

play_melody notes/string:
  melody.play notes

bootCount:
  store := device.FlashStore
  bootcount = store.get BOOT_COUNT_KEY
  if not bootcount:
    bootcount = 0 
  print "BootCount: $bootcount"
  store.set BOOT_COUNT_KEY bootcount+=1

collect_sensor_data -> string:
  pressure := dps.pressure
  magdata := bmx.get_all_data
  
  return "$(Time.now.ms_since_epoch),$(%.2f dps.pressure),$(%.2f magdata.mx),$(%.2f magdata.my),$(%.2f magdata.mz),$(%.2f magdata.gx),$(%.2f magdata.gy),$(%.2f magdata.gz),$(%.2f magdata.ax),$(%.2f magdata.ay),$(%.2f magdata.az)\n"
  // return "$(Time.now.ms_since_epoch),$(%.2f magdata.mx),$(%.2f magdata.my),$(%.2f magdata.mz),$(%.2f magdata.gx),$(%.2f magdata.gy),$(%.2f magdata.gz),$(%.2f magdata.ax),$(%.2f magdata.ay),$(%.2f magdata.az)\n"
  
init_dps368 bus/i2c.Bus:
  device := bus.device dps368.I2C_ADDRESS_DEFAULT
  dps = dps368.DPS368 device
  dps.init cfg.MEASURE_RATE.TIMES_4 cfg.OVERSAMPLING_RATE.TIMES_64 cfg.MEASURE_RATE.TIMES_4 cfg.OVERSAMPLING_RATE.TIMES_1

  sleep --ms=100 
  dps.measureContinousPressureAndTemperature

  print "ProductId:  $dps.productId"
  print "Config: $dps.measure_config"
  zero := dps.pressure

init_bmx160 bus/i2c.Bus:
  device := bus.device bmx160.I2C_ADDRESS
  bmx = bmx160.BMX160 device
  
show_state:
  led := gpio.Pin 2 --output
  generator := Pwm --frequency=300
  channel := generator.start led
  duty_percent := 0
  step := 10
  while true:
    if state == STATE_RUNNING:
      channel.set_duty_factor duty_percent/100.0
      duty_percent += step
      if duty_percent == 0 or duty_percent == 100:
        step = -step
      sleep --ms=10
    else:
      channel.set_duty_factor 0.3
      sleep --ms=1000

read_bat:
  adc := Adc (gpio.Pin 35)
  bat_percentage := 0
  while true:
    value := 0
    5.repeat: value += (mapFromTo adc.get 1.8 3.1 0.0 100.0); sleep --ms=2000
    bat_percentage = value/5
    print "Battery: $(%.2f bat_percentage)%"
    
mapFromTo x/float in_from/float in_to/float out_from/float out_to/float:
  slope := (out_to - out_from) / (in_to - in_from)
  y := out_from + slope * (x - in_from)
  print "x: $x slope: $slope y: $y%"
  return y

button:
  btn := gpio.Pin 4 --input
  pressed_millis := 0
  released_millis := 0
  double_first := 0
  while true:
    btn.wait_for 0 //pressed
    pressed_millis = Time.now.ms_since_epoch
    btn.wait_for 1
    released_millis = Time.now.ms_since_epoch

    if (released_millis - pressed_millis < SHORT_PRESS_TIME):
      on_btn_press
    else if released_millis - pressed_millis > LONG_PRESS_TIME:
      on_btn_long_press

on_btn_press:
  print "Button Press"
  if state == STATE_BOOTED:
    latch.set 1
  else if state == STATE_RUNNING:
    state = STATE_STOPPED

on_btn_long_press:
  print "Button long Press"
  