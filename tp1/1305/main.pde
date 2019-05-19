import processing.video.*;
import oscP5.*;
import netP5.*;

//Parametros
int fractalHeight, fractalHeightModifier, cantidadFractales;
int CANVAS_WIDTH;
int CANVAS_HEIGHT;
int FRACTALS_LEVEL;

//parametros osc

float fractalOSC;
float anguloOSC;

PGraphics pantalla;
PGraphics background;

Fondo fondo;  
Composicion composicion;

//osc
ParametrosOsc paramOSC;


void setup() {
  size(1000, 1000, P2D);
  frameRate(100);
  fondo = new Fondo(this);
  FRACTALS_LEVEL = 4;
  CANVAS_WIDTH=width;
  CANVAS_HEIGHT=height;
  fractalHeight=4;
  fractalHeightModifier=2;
  cantidadFractales=1 ;
  pantalla = createGraphics(CANVAS_WIDTH, CANVAS_HEIGHT, P3D);
  background = createGraphics(CANVAS_WIDTH, CANVAS_HEIGHT, P3D);
  normalizeFractalValues();//normaliza valores para dibujar fractales
  composicion = new Composicion(pantalla, background);
  //fondo = new Background();





  fractalOSC=2;
  anguloOSC=1;
paramOSC = new ParametrosOsc(this);

}

void draw() {
  fondo.renderMovie(width-mouseX);
  fadeGraphics(pantalla, 10);
  fadeGraphics(background, 10);

  composicion.render(fractalOSC);
  displayfps();
}

public void parametrosCamara(int prueba, float coordX_, float coordY_) {
  if (prueba==1) {
    float caraY = map(coordY_, 200, 0, 1, 4);
    caraY=constrain(caraY, 1, 4);
    //fractalHeight=int(caraY);
    fractalHeightModifier=int(caraY);
    normalizeFractalValues();
    //float caraY = coordY_;
    float caraX= map(coordX_, 400, 0, 1, 6);
    fractalHeight=int(caraX);
    normalizeFractalValues();
  }

  if (prueba==2) {

    int parametroX= int(map(coordX_, 480, 0, 1, 10));
    //int parametroY= int(map(coordY_, 0, 200, 1, 10));
    fractalOSC= parametroX;
    normalizeFractalValues();

    anguloOSC=coordY_;
    normalizeFractalValues();

    //cantidadFractales=4;
    //       //coordY = int(map(coordY_,0,200,1,20));
    //       //fractalHeight=coordY;
  }
}

void displayfps() {

  text("fps:  "+frameRate, 10, 10 );
}
