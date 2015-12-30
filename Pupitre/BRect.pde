
class BRect extends Button{
  int x, y, w, h;

  BRect(int ix, int iy, int iw, int ih, byte ivaleur, Connexion c, byte imode) {
    super(ivaleur, c, imode);
    x=ix;
    y=iy;
    w=iw;
    h=ih;
  }

  void over() {
      over = (mouseX >= x-w*0.5 && mouseX <= x+w*0.5 && mouseY >= y-h*0.5 && mouseY+h*0.5 <= y+h);
  }

  void display() {
    fill(remplissage[etat]);
    rect(x, y, w, h);
    fill(0);
    text(valeur, x, y);
  }
}