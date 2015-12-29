
class Button {
  int x, y, w, h;
  boolean over = false;
  boolean pressed = false;  
  int pressCount = 0;
  byte valeur;
  Serial port = myPort;

  Button(int ix, int iy, int iw, int ih, byte ivaleur) {
    x=ix;
    y=iy;
    w=iw;
    h=ih;
    valeur=ivaleur;
  }


  void update() {
    over();
    pressed();
    if (pressed) {
      port.write(valeur);
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

  boolean overRect(int x, int y, int width, int height) {
    boolean res= false;
    if (mouseX >= x - width*0.5 && mouseX <= x+width*0.5 && 
      mouseY >= y - height*0.5 && mouseY <= y+height*0.5) {
      res = true;
    } 
    return res;
  }



  void over() {
    if ( overRect(x, y, w, h) ) {
      over = true;
    } else {
      over = false;
    }
  }

  void display() {
    fill(currentColor);
    rect(x, y, w, h);
    fill(0);
    text(valeur, x, y);
  }
}