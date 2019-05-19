

class Fondo {
  PApplet app;
  Movie movie = null;
  float backup; 
  PGraphics pantalla;



  Fondo(PApplet papp) {
    app = papp;
    backup=0;
    setMovie("fondo.mp4");
    pantalla  = createGraphics(width, height, P2D);

  }

  void setMovie(String fname) {
    movie = new Movie(app, fname);
    movie.frameRate(10);
    movie.loop();
    movie.pause();
  }



  void moviePosition(float parametro) {

    parametro=map(parametro, 0, width, 0.1, movie.duration()-0.1);
    if (frameCount%20==0) {

      if (backup!=parametro) { 
        movie.jump(parametro);
        backup=parametro;
      }
    }
  }

  void renderMovie(float parametro) {
   
    movie.read();

    movie.play();
    pantalla.beginDraw();
    pantalla.image(movie, 0, 0, width, height);
    pantalla.endDraw();
    image(pantalla,0,0);
    moviePosition(parametro);
    //filter(THRESHOLD,0.1);
  }
}
