class Menu extends Input { //nome da tela
  private PImage background;
  private PImage btn_play_up, btn_play_down, btn_help_up, btn_help_down;
  Menu() {
    background = loadImage("bg/menu.png");
    btn_play_up = loadImage("button/play-up.png");
    btn_play_down = loadImage("button/play-down.png");
    btn_help_up= loadImage("button/help-up.png");
    btn_help_down = loadImage("button/help-down.png");
  }

  void show() {
    image(background, width/2, height/2);
    image(btn_play_up, 500, 400);
    image(btn_help_up, 61, 507);
  }  


  void events() {    
    //PRESS PLAY
    if (clickButton(btn_play_up, btn_play_down, 500, 400)) {
      PAGE = 2;
    }

    //PRESS HELP
    if (clickButton(btn_help_up, btn_help_down, 61, 507)) {
      PAGE = 2;
    }
  }

  // ---- efeitos

  void fadeIn() {
  }
}