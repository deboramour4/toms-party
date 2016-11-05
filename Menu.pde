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
    if (click(434, 333, 130, 130)) {
      image(btn_start, 500, 399);
      PAGE = 2;
    }
  }
}