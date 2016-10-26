class Menu { //nome da tela
  PImage background;
  PImage btn_start;

  Menu() {
    background = loadImage("menu.png");
    btn_start = loadImage("btn-start.png");
  }

  void show() {
    image(background, width/2, height/2);
  }

  void events() {
    //PRESS PLAY
    if (mousePressed && mouseX>434+15 && mouseX<566-15 && mouseY>333+15 && mouseY<466-15) {
      image(btn_start, 500, 399);
      if (frameCount % 60 <= 40)
        PAGE = 2;
    }
  }
}