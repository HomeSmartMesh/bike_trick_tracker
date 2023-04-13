#include <Dps368.h>
#include <DFRobot_BMX160.h>
#include "SD.h"
#include "SPI.h"
#include <Preferences.h>

#define BUFF_SIZE 1000

const int BUZZER_PIN = 26;
const int BUZZER_CHANNEL = 0; 
const int LED_PIN = 2;
const int BTN_PIN = 4;

Dps368 Dps368PressureSensor = Dps368();
DFRobot_BMX160 bmx160;

String line = "";
char dataStr[100] = "";
char buffer[7];
char buff[BUFF_SIZE];
// Length is used as offset for the buffer
int length = 0;
File logfile;
Preferences preferences;
unsigned int counter;

void setup() {
  Serial.begin(115200);
  while (!Serial);

  Serial.println("Set BootCounter");
  preferences.begin("bootcounter", false);
  counter = preferences.getUInt("counter", 0);
  counter++;
  Serial.print("BootCounter:");
  Serial.println(counter);
  preferences.putUInt("counter", counter);
  preferences.end();

  initSDCard();
  createNewLogFile();

  pinMode(LED_PIN, OUTPUT);
  digitalWrite(LED_PIN, HIGH);
  
  Dps368PressureSensor.begin(Wire, 0x77);

  if (bmx160.begin() != true){
    while(1);
  }

  //playStartMelody();
  Serial.println("Init complete!");
}

void playStartMelody(){
  //1-up -- E G E C D G
  ledcAttachPin(BUZZER_PIN, BUZZER_CHANNEL);
  ledcWriteNote(BUZZER_CHANNEL, NOTE_E, 5);
  delay(100);
  ledcWriteNote(BUZZER_CHANNEL, NOTE_G, 5);
  delay(100);
  ledcWriteNote(BUZZER_CHANNEL, NOTE_E, 6);
  delay(100);
  ledcWriteNote(BUZZER_CHANNEL, NOTE_C, 6);
  delay(100);
  ledcWriteNote(BUZZER_CHANNEL, NOTE_D, 6);
  delay(100);
  ledcWriteNote(BUZZER_CHANNEL, NOTE_G, 6);
  delay(100);
  ledcDetachPin(BUZZER_PIN);
}

void readDps368(){
  float temperature;
  float pressure;
  uint8_t oversampling = 7;
  int16_t ret;

  ret = Dps368PressureSensor.measureTempOnce(temperature, oversampling);
  if (isValidReturnCode(ret)) {
    Serial.print("Temperature: ");
    Serial.print(temperature);
    Serial.println("°C");
    line.concat(temperature);line.concat(";");
  }

  //Pressure measurement behaves like temperature measurement
  //ret = Dps368PressureSensor.measurePressureOnce(pressure);
  ret = Dps368PressureSensor.measurePressureOnce(pressure, oversampling);
  if (isValidReturnCode(ret)){
    Serial.print("Pressure: ");
    Serial.print(pressure);
    Serial.println(" Pascal");
    line.concat(pressure);line.concat(";");
  }
}

bool isValidReturnCode(int ret){
  if (ret != 0){
    Serial.print("FAIL! ret = ");
    Serial.println(ret);
    return false;
  }
  return true;
}

void readBmx160(){
  sBmx160SensorData_t Omagn, Ogyro, Oaccel;

  /* Get a new sensor event */
  bmx160.getAllData(&Omagn, &Ogyro, &Oaccel);

  /* Display the magnetometer results (magn is magnetometer in uTesla) */
  //Serial.print("M ");
  Serial.print("Xm: "); Serial.print(Omagn.x); Serial.print(",  ");
  Serial.print("Ym: "); Serial.print(Omagn.y); Serial.print(",  ");
  Serial.print("Zm: "); Serial.print(Omagn.z); Serial.print(",  ");
  line.concat(Omagn.x);line.concat(";");
  line.concat(Omagn.y);line.concat(";");
  line.concat(Omagn.z);line.concat(";");
  //Serial.println("uT");

  /* Display the gyroscope results (gyroscope data is in g) */
  //Serial.print("G ");
  Serial.print("Xg: "); Serial.print(Ogyro.x); Serial.print(",  ");
  Serial.print("Yg: "); Serial.print(Ogyro.y); Serial.print(",  ");
  Serial.print("Zg: "); Serial.print(Ogyro.z); Serial.print(",  ");
  line.concat(Ogyro.x);line.concat(";");
  line.concat(Ogyro.y);line.concat(";");
  line.concat(Ogyro.z);line.concat(";");
  //Serial.println("g");
  
  /* Display the accelerometer results (accelerometer data is in m/s^2) */
  //Serial.print("A ");
  Serial.print("Xa: "); Serial.print(Oaccel.x); Serial.print(",  ");
  Serial.print("Ya: "); Serial.print(Oaccel.y); Serial.print(",  ");
  Serial.print("Za: "); Serial.print(Oaccel.z); Serial.print(",  ");
  line.concat(Oaccel.x);line.concat(";");
  line.concat(Oaccel.y);line.concat(";");
  line.concat(Oaccel.z);
  //Serial.println("m/s^2");

}

void initSDCard(){
    if(!SD.begin()){
        Serial.println("Card Mount Failed");
        return;
    }
    uint8_t cardType = SD.cardType();

    if(cardType == CARD_NONE){
        Serial.println("No SD card attached");
        return;
    }

    Serial.print("SD Card Type: ");
    if(cardType == CARD_MMC){
        Serial.println("MMC");
    } else if(cardType == CARD_SD){
        Serial.println("SDSC");
    } else if(cardType == CARD_SDHC){
        Serial.println("SDHC");
    } else {
        Serial.println("UNKNOWN");
    }

    uint64_t cardSize = SD.cardSize() / (1024 * 1024);
    Serial.printf("SD Card Size: %lluMB\n", cardSize);
}

void createNewLogFile(){
  char filename[] = "/LOGGER000.csv";
  logfile = SD.open(filename, FILE_WRITE); 

  //File file = SD.open("/ttlog.csv", FILE_WRITE);
  if(!logfile){
      Serial.println("Failed to open file for writing");
      return;
  }

  Serial.print("Logging to: ");
  Serial.println(filename);
  logfile.println("ficken");
  logfile.println("ficken");
  logfile.println("ficken");
  logfile.println("ficken");
  logfile.println("ficken");

  //logfile.close();

  
  if(logfile.print("ficken")){
      Serial.println("File written");
  } else {
      Serial.println("Write failed");
  }
}


/* returns length of string written to buffer and 0 on success else -1 */
//int toString(float value, char* buff,/*out*/ int* bytes_written) {
//  int min_width = 4;
//  int num_digits_after_decimal = 2;
//  if (length + min_width + num_digits_after_decimal >= BUFF_SIZE) {
//    return -1;
//  }
//  
//  dtostrf(value, min_width , num_digits_after_decimal , buff);
//  *bytes_written = strlen(buffer);
//  return 0;
//}
//
//void* append_csv_column(float value) {
//  // append value to buffer
//  int bytes_written = 0;
//  int ret = toString(value, buff[length], &bytes_written);
//  if (ret != 0) {
//    // buffer full, we might flush the buffer here
//    // write all the data where it belongs.. and refresh the buffer
//    Serial.println("something went wrong");
//    while(0);
//  }
//  length += bytes_written;
//  // here we add the csv separator
//  buff[length++] = ';';
//  buff[length++] = '/0';
//}
//
//void *clear_buff() {
//  memset(buff, 0, BUFF_SIZE);
//  length = 0;
//}

void loop() {
  readDps368();
  readBmx160();

//  Serial.println(line);
//  logfile.print(line);
  logfile.close();
  //line = "";
  
  delay(10000);
}
