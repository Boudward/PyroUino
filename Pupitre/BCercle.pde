
class BCercle extends Button{
  int x, y, r; 

  BCercle(int ix, int iy, int ir, byte ivaleur, Connexion c, byte imode) {
    super(ivaleur, c, imode);
    x=ix;
    y=iy;
    r=ir;
  }

  void over() {
      over = (Math.pow(Math.pow((mouseX - x),2) + Math.pow((mouseY - y),2),0.5)<= r);
  }

  void display() {
    fill(remplissage[etat]);
    ellipse(x, y, r, r);
    fill(0);
    text(valeur, x, y);
  }
}