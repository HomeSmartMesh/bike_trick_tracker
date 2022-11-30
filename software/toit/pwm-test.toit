import gpio.pwm show Pwm
import gpio
import gpio.adc show Adc
import melody show Melody

main:
  buzzer
  // task:: buzzer

  task:: ledfade

ledfade:
  led := gpio.Pin 2 --output
  generator := Pwm --frequency=400
  channel := generator.start led
  duty_percent := 0
  step := 1
  while true:
    channel.set_duty_factor 50/100.0
    sleep --ms=100
    channel.set_duty_factor 0
    sleep --ms=100
    channel.set_duty_factor 50/100.0

buzzer:
  led := gpio.Pin 26 --output
  generator := Pwm --frequency=400
  channel := generator.start led
  duty_percent := 0
  step := 10
  5.repeat:
    channel.set_duty_factor 50/100.0
    sleep --ms=200
    channel.set_duty_factor 0
    sleep --ms=200
    channel.set_duty_factor 50/100.0
  
  generator.close