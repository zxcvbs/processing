class Fractal {
  float size_;
  int level;
  int angulo;
  int divisor;
  int textureIndex;

  float[] absoluteX;
  float[] absoluteY;

  PImage texturaLinea;
  PGraphics pantalla;

  Fractal(PGraphics pantalla_) {
    textureIndex = int(random(1, 8));
    this.setImage(textureIndex);
    angulo=45;
    pantalla=pantalla_;
    absoluteX = new float[FRACTALS_LEVEL];
    absoluteY = new float[FRACTALS_LEVEL];
  }

  void setImage(int index) {
    texturaLinea = loadImage("images/linea_shipibo"+index+".png");  // toma textura ver metodo
  }

  void nextTexture() {
    textureIndex++;
    if (textureIndex >= 17) textureIndex = 0;
    this.setImage(textureIndex);
  }

  void previousTexture() {
    textureIndex--;
    if (textureIndex <= 1) textureIndex = 17;
    this.setImage(textureIndex);
  }

  int getTextureIndex() {
    return this.textureIndex;
  }

  void drawFractal(int size_, int level) {
    int angle = int(map(anguloOSC, 1, 300, 1, 180)); //canvas CANVAS_HEIGHT height iba

    if (level > 0) {
      pantalla.pushStyle();
      pantalla.strokeWeight(0);
      pantalla.stroke(0, 255, 0);
      pantalla.beginShape();
      pantalla.texture(texturaLinea);
      pantalla.vertex(-5, 0, 0, 0);
      pantalla.vertex(5, 0, 20, 0);
      pantalla.vertex(5, -size_/fractalHeight, 20, 500);
      pantalla.vertex(-5, -size_/fractalHeight, 0, 500);
      pantalla.endShape(CLOSE);
      pantalla.popStyle();

      absoluteX[level-1] = pantalla.modelX(0, 0, 0);
      absoluteY[level-1] = pantalla.modelY(0, 0, 0);
  
      pantalla.translate(0, -size_/fractalHeight);
      pantalla.rotate(radians(angle));
      this.drawFractal(size_/fractalHeightModifier, level-1);
      pantalla.rotate(radians(-2*angle));
      this.drawFractal(size_/fractalHeightModifier, level-1);
      pantalla.rotate(radians(angle));
      pantalla.translate(0, size_/fractalHeight);
    }
  }

  float getXByIndex(int index) {
    return absoluteX[index];
  } 

  float getYByIndex(int index) {
    return absoluteY[index];
  }  

}
