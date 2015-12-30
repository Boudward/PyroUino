
abstract class Button {
  boolean over = false;
  boolean pressed = false;  
  int pressCount = 0;
  byte valeur;
  Connexion conn;

  byte mode=0;

 
  Button(byte ivaleur, Connexion c, byte imode) {
    valeur=ivaleur;
    conn=c;
    mode=imode;
  }
  
  abstract void over();
  abstract void display();
  
  void update() {
    over();
    pressed();
    if (pressed && mode==0) {
      conn.Envoyer(valeur);
    }
    if (pressed && mode==1) {
      etat++;
      if(etat>2){etat=0;}
    }
  }

  void pressed() {
    if (over && mousePressed) {
      pressCount += 1;
    } else {
      pressed = false;
      pressCount = 0;
    }

    if (pressCount == 1) {
      pressed = true;
    } 
    if (pressCount > 1) {
      pressed = false;
    }
  }

}