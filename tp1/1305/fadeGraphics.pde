//Modifica alfa de un pgrafic
void fadeGraphics(PGraphics pantalla, int fadeAmount) {
  pantalla.beginDraw();
  pantalla.loadPixels();

  // iterate over pixels
  for (int i =0; i<pantalla.pixels.length; i++) {

    // get alpha value
    int alpha = (pantalla.pixels[i] >> 24) & 0xFF ;

    // reduce alpha value
    alpha = max(0, alpha-fadeAmount);

    // assign color with new alpha-value
    pantalla.pixels[i] = alpha<<24 | (pantalla.pixels[i]) & 0xFFFFFF ;
  }

  pantalla.updatePixels();
  pantalla.endDraw();
}
