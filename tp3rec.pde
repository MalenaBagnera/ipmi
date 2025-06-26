//https://youtu.be/7gL-u1ujbQ4
// VARIABLES
PImage obra ;
int px, py ;
color color1, color2, color3, color4 ;
float amt = 0 ;
float amt2 = 0 ;
boolean cambiarColor = false ;
boolean cambiarAVerde ;
float t1 = 133, t2 = 133, t3 = 133;
float t4 = 133, t5 = 133, t6 = 133;
float t7 = 133, t8 = 133, t9 = 133;
float t1Original, t2Original, t3Original;
float t4Original, t5Original, t6Original;
float t7Original, t8Original, t9Original;
boolean mostrarBoton = false ;

// FUNCIONES 
float generarNuevoTam() {
  return random(40, 150);
}

boolean estaSobreFigura(float x, float y, float t) {
  return dist(mouseX, mouseY, x, y) < t / 2;
}

void figura(float x, float y, float t) {
  color actual = lerpColor(color3, color4, amt2);
  color actual2 = lerpColor(color1, color2, amt2);
  fill(actual2);
  rect(x - t/2, y - t/2, t, t);
  boolean mouseEncima = estaSobreFigura(x, y, t);
  pushMatrix();
  translate(x, y);
  if (mouseEncima) {
    rotate(radians(mouseX));
  }
  fill(actual);
  ellipse(0, 0, t, t);
  popMatrix();
}

void figura2(float x, float y, float t) {
  color actual = lerpColor(color1, color2, amt);
  color actual1 = lerpColor(color3, color4, amt);
  fill(actual1);
  rect(x - t/2, y - t/2, 133, 133);
  fill(actual);
  circle(x, y, t);
}

void reiniciar() {
  t1 = t1Original;
  t2 = t2Original;
  t3 = t3Original;
  t4 = t4Original;
  t5 = t5Original;
  t6 = t6Original;
  t7 = t7Original;
  t8 = t8Original;
  t9 = t9Original;
  amt = 0;
  amt2 = 0;
  cambiarColor = false;
  cambiarAVerde = false;
}

void setup() {
  size(800, 400);
  background(0);
  obra = loadImage("obra.jpg");
  obra.resize(400, 400);
  color1 = color(40, 0, 200);
  color2 = color(135, 206, 235);
  color3 = color(0);
  color4 = color(255, 105, 180);

  t1Original = t1;
  t2Original = t2;
  t3Original = t3;
  t4Original = t4;
  t5Original = t5;
  t6Original = t6;
  t7Original = t7;
  t8Original = t8;
  t9Original = t9;
}

void draw() {
  background(0);
  image(obra, px, py);

  int contador = 0;
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      float x = 465 + i * 133.5;
      float y = 66 + j * 133.5;
      float tActual = 133;
      
      // Asigno tamaño correspondiente
      if (contador == 0) tActual = t1;
      if (contador == 1) tActual = t2;
      if (contador == 2) tActual = t3;
      if (contador == 3) tActual = t4;
      if (contador == 4) tActual = t5;
      if (contador == 5) tActual = t6;
      if (contador == 6) tActual = t7;
      if (contador == 7) tActual = t8;
      if (contador == 8) tActual = t9;

      if ((i + j) % 2 == 0) {
        figura(x, y, tActual);
      } else {
        figura2(x, y, tActual);
      }
      contador++;
    }
  }
  
//   Transiciones de color
  if (cambiarColor && amt < 1) {  //   
    amt += 0.02;
  } else if (!cambiarColor && amt > 0) {
    amt -= 0.02;
  }

  if (cambiarAVerde && amt2 < 1) {
    amt2 += 0.02;
  } else if (!cambiarAVerde && amt2 > 0) {
    amt2 -= 0.02;
  }

  if (mostrarBoton) {
    fill(255);
    rect(650, 20, 95, 30);
    fill(0);
    textSize(16);
    text("Reiniciar", 668, 40);
  }
}

void keyPressed() {
  if (key == ' ') {
    mostrarBoton = !mostrarBoton;
  }

  if (key == 'a' || key == 'A') {
    cambiarColor = !cambiarColor;
  }

  if (key == 'b' || key == 'B') {
    cambiarAVerde = !cambiarAVerde;
  }

  if (key == 'c' || key == 'C') {
    int contador = 0;
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        float x = 465 + i * 133.5;
        float y = 66 + j * 133.5;
        float tActual = 133;

        if (contador == 0) tActual = t1;
        if (contador == 1) tActual = t2;
        if (contador == 2) tActual = t3;
        if (contador == 3) tActual = t4;
        if (contador == 4) tActual = t5;
        if (contador == 5) tActual = t6;
        if (contador == 6) tActual = t7;
        if (contador == 7) tActual = t8;
        if (contador == 8) tActual = t9;

        if (estaSobreFigura(x, y, tActual)) {
          float nuevoTam = generarNuevoTam();
          if (contador == 0) t1 = nuevoTam;
          if (contador == 1) t2 = nuevoTam;
          if (contador == 2) t3 = nuevoTam;
          if (contador == 3) t4 = nuevoTam;
          if (contador == 4) t5 = nuevoTam;
          if (contador == 5) t6 = nuevoTam;
          if (contador == 6) t7 = nuevoTam;
          if (contador == 7) t8 = nuevoTam;
          if (contador == 8) t9 = nuevoTam;
        }

        contador++;
      }
    }
  }
}

void mousePressed() {
  if (mostrarBoton && mouseX >= 650 && mouseX <= 770 && mouseY >= 20 && mouseY <= 50) {
    reiniciar();
  }
}
