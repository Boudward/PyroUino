import processing.serial.*;

class Connexion {


  Serial myPort; 
  boolean firstContact = false; 
  

  Connexion(Serial port){
    myPort = port;
  }
  
    void Connecter(byte inByte){ //renvoi vrai si connection établie sinon faux
 
   if (inByte == 'A') {
    myPort.clear();          // clear the serial port buffer
    firstContact = true;     // you've had first contact from the microcontroller
    myPort.write('A');
    }

  }
  
  void Envoyer(byte Message){
    myPort.write(Message);
  }
  
  int Recevoir(){
    int valLu=  myPort.read();
    if(!firstContact){
      Connecter(byte(valLu));
    }
    return valLu;
  }
  
}