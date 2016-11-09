class Menu extends Input { //nome da tela
  private PImage background;
  private PImage btn_start;

  Menu() {
    background = loadImage("menu.png");
    btn_start = loadImage("btn-start.png");
  }

  void show() {
    image(background, width/2, height/2);
  }

  void events() {
    //PRESS PLAY
    if (clickRadial(btn_start,500, 400)) {
      image(btn_start, 500, 400);
      PAGE = 2;
    }
  }
}