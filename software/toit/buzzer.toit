import gpio.pwm as gpio
import gpio
import .octaves

class Buzzer:

  buzzer_pin := ?
  buzzer := ?
  buzzer_pwm := ?

  constructor pin/int:
    buzzer_pwm = gpio.Pwm --frequency=100
    buzzer_pin = gpio.Pin pin
    buzzer = buzzer_pwm.start buzzer_pin
    buzzer.set_duty_factor 0.5

  play melody/string tempo/int = 100:
    note := ""
    print "melody.size $melody.size"
    print "first letter $melody[0]"
    for i := 0; i < melody.size; i+=2:
      note = melody[i..i+2]
      if note.starts_with "-":
        sleep --ms=(noteLengthToMs 0.25 100.0).to_int
        continue

      print "Note to play: $note"
      freq := octaves[note]
      playNote freq tempo
  
  noteLengthToMs noteLength/float tempo/float -> float:
    notesPerSecond := tempo / 60.0
    wholeNoteMs := 1000 / notesPerSecond
    return (wholeNoteMs * noteLength) / 1000.0

  playNote freq/int length/int:
    
    buzzer = buzzer_pwm.start buzzer_pin
    sleep --ms=length
    buzzer_pwm.close