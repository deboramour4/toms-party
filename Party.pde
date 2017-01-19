class Party extends Input {
  private PImage background;
  private PImage btn_right_up, btn_right_down;

  Party() {
    background = loadImage("party.png");
    btn_right_up = loadImage("right-up.png");
    btn_right_down = loadImage("right-down.png");
  }

  void show() {
    image(background, width/2, height/2);
    image(btn_right_up,945,500);
  }

  void events() {
    //PRESS NEXT
    if (inside(btn_right_up, 945, 500))
      image(btn_right_down, 945, 500);
      
    //PRESS BACK
    if (clickRadial(btn_right_up, 918, 484)) {
      PAGE = 3;
      delay(400);
    }
  }
}