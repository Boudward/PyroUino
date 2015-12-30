/**
 * Pupitre de Tir 
 */



color currentColor = 200;
Connexion conn;
BRect[] bRects ;
BCercle circle1; 

color remplissage[]={200, #FF0000, #0000FF};
int etat=0;

void setup() {
  size(800, 480);
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  
  conn = new Connexion (new Serial(this,"/dev/ttyUSB0",9600));

  bRects = new BRect[30];
  circle1= new BCercle(300, 300, 20, byte(0), conn, byte(1));

  for (int i =0; i<3; i++) {
    for (int j =0; j<10; j++) {
      bRects[i*10+j] = new BRect (100 + j*50, 100 + i*50, 30, 30, byte(i*10 +j+1),conn, byte(0));
    }
  }
}

void draw() {
  background(remplissage[etat]);
    
  for (int i =0; i<30; i++) {
    bRects[i].update();
    bRects[i].display();
  }
  circle1.update();
  circle1.display();
}


void serialEvent(Serial myPort) {
  println("Recu : " + conn.Recevoir());
  
}