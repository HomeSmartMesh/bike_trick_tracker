const int BUZZER_PIN = 26;
const int BUZZER_CHANNEL = 0; 

void setup() {
  // ledcAttachPin(uint8_t pin, uint8_t channel);
  ledcAttachPin(BUZZER_PIN, BUZZER_CHANNEL);
}

void loop() {
  ledcWriteNote(BUZZER_CHANNEL, NOTE_C, 4);
  delay(200);
  ledcWriteNote(BUZZER_CHANNEL, NOTE_D, 4);
  delay(200);
  ledcWriteNote(BUZZER_CHANNEL, NOTE_E, 4);
  delay(200);
  ledcWriteNote(BUZZER_CHANNEL, NOTE_F, 4);
  delay(200);
  ledcWriteNote(BUZZER_CHANNEL, NOTE_G, 4);
  delay(200);
  ledcWriteNote(BUZZER_CHANNEL, NOTE_A, 4);
  delay(200);
  ledcWriteNote(BUZZER_CHANNEL, NOTE_B, 4);
  delay(200);
}
