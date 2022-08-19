import gpio.pwm as gpio
import gpio
import gpio.adc show Adc
import .buzzer

LED ::= 2

DUTY_MIN ::= 0.0
DUTY_MAX ::= 1.0
CHANGE_RATE ::= 0.01  // The amount of change every 5ms.

main:
  //buzzer := Buzzer 26
  //buzzer.play "c1-=d1-=e1-=f1-=g1-=a1-=b1"

  task:: fade
  task:: read_bat
  
fade:
  led := gpio.Pin LED --output
  while true:
    print "blink"
    led.set 1
    sleep --ms=500
    led.set 0
    sleep --ms=500

read_bat:
  adc := Adc (gpio.Pin 35)
  batsens := ?
  while true:
    bat_percentage := mapFromTo adc.get 1.8 3.1 0.0 100.0
    /*if bat_percentage < 0:
      bat_percentage = 0
    else if bat_percentage > 100:
      bat_percentage = 100*/
      
    print "Battery: $(%.2f bat_percentage)%"
    sleep --ms=5000
    
mapFromTo x/float in_from/float in_to/float out_from/float out_to/float:
  slope := (out_to - out_from) / (in_to - in_from)
  y := out_from + slope * (x - in_from)
  print "x: $x slope: $slope y: $y%"
  return y

