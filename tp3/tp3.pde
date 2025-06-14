PImage referencia;

int numCuadrados = 30;
float escala = 0.9;
float deformacion = 0.0;

void setup() {
  size(800, 400);
  referencia = loadImage("referencia.jpg");
  rectMode(CENTER);
  noFill();
}

void draw() {
  background(255);

  {
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
    strokeWeight(8);
    rect(0, 0, s, s);
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
