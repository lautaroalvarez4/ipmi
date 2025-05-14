int pantalla = 0;
int contador = 0;
int framesPorPantalla = 300;

// Imágenes
PImage imgInicio, imgTripulante, imgImpostor, imgEmergencia;

// Animación pantalla 0
float imgX = -640;
float imgDestinoX = 0;
float textY0 = 600;
float textY0Destino = 400;

// Pantalla 1:
float zoom = 0.1;
float textY1 = 600;
float textY1Destino = 400;

// Pantalla 2: 
float imgY2 = -480;
float textY2 = 600;
float textY2Destino = 400;

// Pantalla 3: 
float textY3 = 600;
float textY3Destino = 380;
float circuloTamaño = 50;

// Botón reinicio
int botonX = 220;
int botonY = 420;
int botonAncho = 200;
int botonAlto = 40;

void setup() {
  size(640, 480);

  imgInicio = loadImage("inicio.jpg");
  imgTripulante = loadImage("tripulante.jpg");
  imgImpostor = loadImage("impostor.jpg");
  imgEmergencia = loadImage("emergencia.jpg");
}

void draw() {
  background(0);

  contador++;

  if (contador > framesPorPantalla && pantalla < 3) {
    pantalla = pantalla + 1;
    contador = 0;
    resetAnimaciones();
  }

  if (pantalla == 0) {
    pantallaInicio();
  }

  if (pantalla == 1) {
    pantallaTripulante();
  }

  if (pantalla == 2) {
    pantallaImpostor();
  }

  if (pantalla == 3) {
    pantallaFinal();
  }
}

// Pantalla 0 
void pantallaInicio() {
  if (imgX < imgDestinoX) imgX += 10;
  if (textY0 > textY0Destino) textY0 -= 2;

  imageMode(CORNER);
  image(imgInicio, imgX, 0, width, height);

  fill(255);
  textAlign(CENTER);
  textSize(26);
  text("Among us es un juego de adivnar quien es el impostor", width / 2, textY0);
  textSize(18);
  text("¡Encuentra al impostor antes de que te elimine!", width / 2, textY0 + 30);
}

// Pantalla 1 
void pantallaTripulante() {
  if (zoom < 1.0) zoom += 0.02;
  if (textY1 > textY1Destino) textY1 -= 2;

  float ancho = width * zoom;
  float alto = height * zoom;
  float x = (width - ancho) / 2;
  float y = (height - alto) / 2;

  imageMode(CORNER);
  image(imgTripulante, x, y, ancho, alto);

  fill(255);
  textAlign(CENTER);
  textSize(26);
  text("Los tripulantes deben completar tareas", width / 2, textY1);
  textSize(18);
  text("Y reportar cadáveres para descubrir al impostor.", width / 2, textY1 + 30);
}

// Pantalla 2 
void pantallaImpostor() {
  if (imgY2 < 0) imgY2 += 6;
  if (textY2 > textY2Destino) textY2 -= 2;

  imageMode(CORNER);
  image(imgImpostor, 0, imgY2, width, height);

  fill(255);
  textAlign(CENTER);
  textSize(26);
  text("El impostor debe sabotear y eliminar", width / 2, textY2);
  textSize(18);
  text("Sin ser descubierto por la tripulación.", width / 2, textY2 + 30);
}

// Pantalla 3 
void pantallaFinal() {
  imageMode(CORNER);
  image(imgEmergencia, 0, 0, width, height);

  noFill();
  stroke(255, 0, 0);
  strokeWeight(3);
  ellipse(width / 2, height / 2 + 60, circuloTamaño, circuloTamaño);
  circuloTamaño += 2;
  if (circuloTamaño > 200) circuloTamaño = 50;

  if (textY3 > textY3Destino) textY3 -= 2;

  fill(255);
  textAlign(CENTER);
  textSize(24);
  text("¡Reunión de emergencia!", width / 2, textY3);
  textSize(16);
  text("Discute con los demás y vota al posible impostor.", width / 2, textY3 + 30);

  // Botón
  fill(50, 150, 255);
  noStroke();
  rectMode(CORNER);
  rect(botonX, botonY, botonAncho, botonAlto, 10);

  fill(255);
  textAlign(CENTER, CENTER);
  textSize(18);
  text("Reiniciar presentación", botonX + botonAncho / 2, botonY + botonAlto / 2);
}

// Reiniciar animaciones
void resetAnimaciones() {
  imgX = -640;
  textY0 = 600;

  zoom = 0.1;
  textY1 = 600;

  imgY2 = -480;
  textY2 = 600;

  textY3 = 600;
  circuloTamaño = 50;
}

// Botón para reiniciar
void mousePressed() {
  if (pantalla == 3) {
    if (mouseX > botonX && mouseX < botonX + botonAncho &&
        mouseY > botonY && mouseY < botonY + botonAlto) {
      pantalla = 0;
      contador = 0;
      resetAnimaciones();
    }
  }
}
