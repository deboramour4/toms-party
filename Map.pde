class Map extends Input {
  private PImage background;
  private PImage btn_party, btn_help_up, btn_help_down;
  boolean help_click, play_click;

  Map() {
    background = loadImage("bg/map.png");
    btn_party = loadImage("button/btn-party.png");
    btn_help_up= loadImage("button/help-up.png");
    btn_help_down = loadImage("button/help-down.png");
    help_click = false;
    play_click = false;
  }

  void show() {
    image(background, width/2, height/2);
    image(btn_help_up, 61, 507);
  }

  void events() {
    //RETURN TO MENU
    if (click(btn_party, 930, 43)) {
      PAGE = 1;
      delay(200);
    }

    //PRESS PARTY
    if (clickRadial(btn_party, 381, 349)) {
        PAGE = 2;
        delay(200);
    }

    //PRESS DO'S HOUSE
    if (clickRadial(btn_party, 637, 468)) {
      PAGE = 5;
      delay(400);
    }

    // CREDITS & HELP
    if (clickRadial(btn_help_up, 61, 507)) {
      PAGE = 4;
      delay(400);
    }
  }
}