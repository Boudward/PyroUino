/**
 * Buttons.  
 */

import processing.serial.*;

Serial myPort; 
boolean firstContact = false; 

color currentColor = 200;

Button[] buttons = new Button[30];

void setup() {
  size(640, 360);
  background(currentColor);
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  String portName = "/dev/ttyUSB0"; //Serial.list()[0];
  myPort = new Serial(this, portName, 9600);

  for (int i =0; i<3; i++) {
    for (int j =0; j<10; j++) {
      buttons[i*10+j] = new Button (100 + j*50, 100 + i*50, 30, 30, byte(i*10 +j+1));
    }
  }
}

void draw() {
  for (int i =0; i<30; i++) {
    buttons[i].update();
    buttons[i].display();
  }
}


void serialEvent(Serial myPort) {
  // read a byte from the serial port:
  int inByte = myPort.read();

  if (firstContact == false) {
    if (inByte == 'A') {
      myPort.clear();          // clear the serial port buffer
      firstContact = true;     // you've had first contact from the microcontroller
      myPort.write('A');       // ask for more
    }
  } else {
    println("Recu :  " + int(inByte));
  }
}