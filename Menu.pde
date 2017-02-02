class Menu extends Input { //nome da tela
  private PImage background;
  Button btn_play, btn_help;
  boolean help_click;
 
  Menu() {
    background = loadImage("bg/menu.png");
    btn_play = new Button("button/play-up.png", "button/play-down.png", width/2, height-(134/2)-16-50);
    btn_help= new Button("button/help-up.png", "button/help-down.png", width-(128/2)-16, 134/2+(16));
    help_click = false;
    menu_music = new Sound("music/menu.mp3", 0, true);
  }

  void show() {
    menu_music.playLoop();
    image(background, width/2, height/2);

    if (insideButton(btn_play) || insideButton(btn_help))
      isInside = true;
    else
      isInside = false;
  }  


  void events() {   
    //PRESS PLAY
    if (btn_play.execute()) {
      menu_music.volume(-10);
      sCutscene.playSound();
      PAGE = 9;
    }

    //PRESS HELP
    if (btn_help.execute()) {
      PAGE = 2;
    }

  }

  // ---- efeitos

  void fadeIn() {
  }
}