

int opacidad = 0 ;
int text2 = 460; 
int text3 = -100 ; 
int opacidadTexto = 0 ; 
int posTexto5 = -200 ;
int escena = -1; // Escena -1: pantalla de inicio
int tiempoInicio = 0;

PImage pantalla1; 
PImage pantalla2;
PImage pantalla3; 
PImage pantalla4;
PImage pantalla5;

PFont fuenteNueva;

String texto = "\n Geometry Dash es un videojuego de plataformas rítmico \n desarrollado por Robert Topala," + "lanzado por primera vez en 2013 \n para dispositivos móviles y PC.";
String texto2 = "\n El juego es conocido por sus niveles con dificultad progresiva, \n su estilo visual geométrico" + " y su sincronización de cada nivel con \n música electrónica.";
String texto3 = "\n Consiste en controlar la acción de una figura que avanza \n automáticamente, evitando obstáculos saltando o interactuando \n con portales que cambian la gravedad,el ritmo o la forma del \n personaje.";
String texto4 = "\n Existen versiones derivadas con niveles específicos, como \n Geometry Dash Lite, Meltdown,SubZero y World, todas gratuitas \n y disponibles en móviles." ;
String texto5 = "\n Uno de sus grandes atractivos es la posibilidad de crear y compartir \n tus propios niveles, lo que ha generado una enorme comunidad \n de jugadores y creadores.";

float textoY; 
float img = 460 ; 
float fondo ; 
float i = 0 ;


boolean moviendo = true ;


void setup (){
 background (0); 
 size (640,480) ; 


 pantalla1= loadImage ("pantalla1.jpg");
 pantalla1.resize (640,480) ;
 
 pantalla2= loadImage ("pantalla2.jpg");
 pantalla2.resize (640,480) ;
 
 pantalla3= loadImage ("pantalla3.jpg");
 pantalla3.resize (640,480) ;
 
 pantalla4= loadImage ("pantalla4.jpg");
 pantalla4.resize (640,480) ;
 
 pantalla5= loadImage ("pantalla5.jpg");
 pantalla5.resize (640,480) ;
 
 fuenteNueva = loadFont ("Bai.vlw");
textFont (fuenteNueva) ; 
 textoY = height; 
 textSize (32); 
 fill (255); 
 
 fondo = height ;


}
void draw ()  {
  
  noTint ();
  if ( escena == -1 )   {
  background (0);   
  tint (255, opacidad ) ; 
  image (pantalla1, 0,0 );
  noTint ();
  
  fill (255);  // color del texto 
  textFont (fuenteNueva);
  text (texto, width/2 - 300, textoY );  // posicion del texto 
  
  if (opacidad < 255) { // transicion de fondo negro a la imagen 
  opacidad += 3; }
  
  if (textoY > 305 ) { // limite 
    textoY-=2 ; }  // velocidad 
    
    
    // boton inicio
    
    fill (75,0,130);  // violeta  
    rect (275,400,90,40) ;
    fill (255) ;
    text ( "Iniciar",292, 426) ;
  }    
  else if ( escena== 0)  {
  
   
   background (180,90,0); 
   image (pantalla2, img, 0) ; 
   if (img > 0 ){
   img -= 3 ; } 

   fill(260,250,0) ; // amarillo
   textFont (fuenteNueva);
   
   if (text2 > 10) {  // limite 
   text2 -=3 ; }  // velocidad 
   
   
   text (texto2, text2, height/22);  // posicion 
  

   
    
    
  } else if  
    (escena == 1 ){
    background (0); 
    tint (255, opacidad ) ; // misma transicion que pantalla1
    image (pantalla3, 0,0 );
    noTint ();
    
  
    fill(57,255,20, opacidadTexto) ; // verde 
    textFont (fuenteNueva);
  
    if (text3 + textWidth (texto3) / 2 < width /2 ) {  // centrar el texto 
    text3 +=1 ; }  
    text (texto3,text3, height/16) ; 
    if (opacidadTexto < 255) {
      opacidadTexto +=3; } 
    
   if (opacidad < 255) { // transicion de fondo negro a la imagen 
    opacidad += 2; }
 
    
    
   
  
  } else if  (  escena == 2) { 
    
    background (260,250,0) ;  // amarillo 
    image ( pantalla4 ,0, fondo) ; 
    if (fondo > 0 ) { 
    fondo -= 6; } 
   
     
    textFont (fuenteNueva);  
    fill ( 260,250 ,0, opacidadTexto) ; 
    text (texto4, 20,150) ;
    if (opacidadTexto < 255) {
      opacidadTexto +=3; } 
    
  
   
    
  }else if  ( escena == 3 ) {
  
    background (0); 
    tint (255, opacidad ) ;
    image (pantalla5, 0, 0 ) ;
    noTint(); 
    if (opacidad < 255) { // transicion de fondo negro a la imagen 
    opacidad += 1; }
    
   
  
   if (moviendo ) {    // movimiento de la imagen 
   i +=3;              // velocidad 
   if ( i> height ){   
   moviendo = false; }  // se frena cuando sale de la pantalla 
   }
   
   if (i < height ) {  // dibujo la imagen solo si sigue en la pantalla
   image( pantalla5, width/2 - pantalla5.width/2, i); }
  
    
   // texto
    
    fill ( 140,255 ,0, opacidadTexto) ; 
    textFont (fuenteNueva);
    if (posTexto5+ textWidth (texto5) / 2 < width /2 ) { // hace que el texto frene una vez que aparece en pantalla
    posTexto5 = posTexto5 + 2; } 
    text (texto5, posTexto5, height/16); 
    if (opacidadTexto < 255) {
      opacidadTexto +=2; } 
    
    
    // boton
    fill(0); 
    rect (535,420,90,40); 
    fill (255, 50, 200); // fucsia 
    text ("Reiniciar" , 540, 445);  }
    
    // Avance automático con frameCount
    
  if (escena >= 0 && escena < 3) {  
    int duracion = 400; 
    if (escena == 1) {
      duracion = 710; 
    }
if (frameCount - tiempoInicio > duracion) {
      escena++;
      tiempoInicio = frameCount;
      
      opacidad=0;     // reinicio variables
      textoY = height;
      img = 460;
      text2 = 460;
      text3 = -100;
      fondo = height;
      posTexto5 = -200;
      i = 0;
      moviendo = true;
      opacidadTexto=0 ;
    
    
  }
  if (frameCount - tiempoInicio > duracion) {
    escena++;
    tiempoInicio = frameCount;
        
  }
  }
   } 

void mouseClicked() {
  if (escena == -1) {
    if (mouseX > 275 && mouseX < 365 && mouseY > 400 && mouseY < 440) {    // coordenadas boton inicio 
      escena = 0;
      tiempoInicio = frameCount;
      opacidad= 0 ;
      textoY= height ;
    }
  }

  if (escena == 3) {
    if (mouseX > 535 && mouseX < 625 && mouseY > 420 && mouseY < 460) {  // coordenadas boton reiniciar 
      escena = -1;
      opacidad = 0;
      tiempoInicio = frameCount;
    
      opacidad=0;  // reinicio variables
      textoY = height;
      img = 460;
      text2 = 460;
      text3 = -100;
      fondo = height;
      posTexto5 = -200;
      i = 0;
      moviendo = true;
      opacidadTexto=0 ;
     
    }
  }
}
