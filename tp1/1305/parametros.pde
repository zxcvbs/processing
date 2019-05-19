class ParametrosOsc {
  PApplet app;
  OscP5 oscP5;
  NetAddress myRemoteLocation;
  int coordX;
  int coordY;

  ParametrosOsc(PApplet app) {


  oscP5 = new OscP5(app, 5505);
  myRemoteLocation = new NetAddress("127.0.0.1", 12000);
  oscP5.plug(this, "parametrosCamara", "/valoresCirculo");

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


  
  
 
  
}



void keyPressed() { 

  composicion.onKeyPressUpdateFractalTexture(key);

  if (key == 'a'|| key == 'A') {
    cantidadFractales=cantidadFractales+2;
    normalizeFractalValues();
  }

  if (key == 'd'|| key == 'D') {
    cantidadFractales=cantidadFractales-2;
    normalizeFractalValues();
  }

  if (key == CODED) {
    if (keyCode == LEFT) {
      fractalHeight=fractalHeight+1;
      normalizeFractalValues();
    }
    if (keyCode == RIGHT) {
      fractalHeight=fractalHeight-1;
      normalizeFractalValues();
    }

    if (keyCode == UP) {
      fractalHeightModifier=fractalHeightModifier-1;
      normalizeFractalValues();
    }
    if (keyCode == DOWN) {
      fractalHeightModifier=fractalHeightModifier+1;
      normalizeFractalValues();
    }
  }
}

//mantiene los valores dentro de un rango
void normalizeFractalValues() {
  if (fractalHeight <=1) fractalHeight =1;
  if (fractalHeightModifier <= 1) fractalHeightModifier = 1;
  if (cantidadFractales <= 2) cantidadFractales = 2;
};
