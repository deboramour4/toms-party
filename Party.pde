class Party extends Input {
  private PImage background;
  private PImage btn_right_up, btn_right_down;

  Party() {
    background = loadImage("bg/party.png");
    btn_right_up = loadImage("button/right-up.png");
    btn_right_down = loadImage("button/right-down.png");
  }

  void show() {
    image(background, width/2, height/2);
    image(btn_right_up, 945, 500);
  }

  void events() {
    //PRESS NEXT
    if (clickButton(btn_right_up, btn_right_down, 945, 500)) {
      PAGE = 3;
      delay(400);
    }
  }
}