class Map extends Input {
  private PImage background;
  private PImage btn_party, btn_help_up, btn_help_down;
  boolean help_click, play_click;

  Map() {
    background = loadImage("map.png");
    btn_party = loadImage("btn-party.png");
    btn_help_up= loadImage("help-up.png");
    btn_help_down = loadImage("help-down.png");
    help_click = false;
    play_click = false;
  }

  void show() {
    image(background, width/2, height/2);
    image(btn_help_up, 61, 507);
  }

  void events() {
    //INSIDE THE HELP
    if (inside(btn_help_up, 61, 507))
      image(btn_help_down, 61, 507);
  
  //RETURN TO MENU
  if (click(btn_party, 930, 43)) {
    PAGE = 1;
    delay(400);
  }

  //PRESS PHASE 1 (alan)
  if (clickRadial(btn_party, 381, 349)) {
    if (frameCount % 60 <= 40) {
      PAGE = 5;
      delay(400);
    }
  }

  //LEVEL 2 (débora)
  if (clickRadial(btn_party, 637, 468)) {
    PAGE = 6;
    delay(400);
  }

  // CREDITS & HELP
  if (clickRadial(btn_help_up, 61, 507)) {
    PAGE = 4;
    delay(400);
  }
}
}