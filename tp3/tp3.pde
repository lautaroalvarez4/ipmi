// https://www.youtube.com/watch?v=kxXKh6MpaZc
PImage referencia;
          
int numCuadrados = 30;   
float escala = 0.9;       
float deformacion = 0.0;  

void setup() {
  size(800, 400);
  referencia = loadImage("referencia.jpg"); 
  rectMode(CENTER);
}

void draw() {
  background(255);

 
  if (referencia != null) {
    image(referencia, 0, 0, width / 2, height);
  }


  pushMatrix();
  translate(3 * width / 4, height / 2);
  drawTunel(numCuadrados, escala + deformacion);
  popMatrix();
}


void drawTunel(int cantidad, float factor) {
  float size = height; 

  for (int i = 0; i < cantidad; i++) {
    float s = getEscala(size, factor, i);
    stroke(i % 2 == 0 ? 0 : 255);
    strokeWeight(10);

   
    for (int lado = 0; lado < 4; lado++) {
      float x1, y1, x2, y2;
      if (lado == 0) { 
        x1 = -s / 2; y1 = -s / 2;
        x2 = s / 2;  y2 = -s / 2;
      } else if (lado == 1) { 
        x1 = s / 2;  y1 = -s / 2;
        x2 = s / 2;  y2 = s / 2;
      } else if (lado == 2) { 
        x1 = s / 2;  y1 = s / 2;
        x2 = -s / 2; y2 = s / 2;
      } else { 
        x1 = -s / 2; y1 = s / 2;
        x2 = -s / 2; y2 = -s / 2;
      }
      line(x1, y1, x2, y2);
    }
  }
}


float getEscala(float base, float factor, int index) {
  return base * pow(factor, index);
}


void keyPressed() {
  if (key == 'd' || key == 'D') {
    numCuadrados++;
  } else if (key == 'f' || key == 'F') {
    numCuadrados = max(5, numCuadrados - 1);
  } else if (key == 'r' || key == 'R') {
    resetValores();
  }
}


void mouseMoved() {

  deformacion = map(mouseX, width / 2, width, -0.1, 0.1);
}

void resetValores() {
  numCuadrados = 30;
  escala = 0.9;
  deformacion = 0.0;
}
