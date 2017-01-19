class Menu extends Input { //nome da tela
  private PImage background;
  private PImage btn_play_up, btn_play_down, btn_help_up, btn_help_down;
  Menu() {
    background = loadImage("menu.png");
    btn_play_up = loadImage("play-up.png");
    btn_play_down = loadImage("play-down.png");
    btn_help_up= loadImage("help-up.png");
    btn_help_down = loadImage("help-down.png");
  }

  void show() {
    image(background, width/2, height/2);
    image(btn_play_up, 500, 400);
    image(btn_help_up, 61, 507);
  }  


  void events() {
    //INSIDE THE HELP
    if (inside(btn_help_up, 61, 507))
      image(btn_help_down, 61, 507);

    //INSIDE PLAY
    if (inside(btn_play_up, 500, 400))
      image(btn_play_down, 500, 400);

    //PRESS PLAY
    if (clickRadial(btn_play_up, 500, 400)) {
      delay(400);
      PAGE = 2;
    }
  }

  // ---- efeitos

  void fadeIn() {
  }
}