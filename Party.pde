class Party extends Input {
  private PImage background;
  private PImage btn_back;

  Party() {
    background = loadImage("party.png");
    btn_back = loadImage("btn-start.png");
  }

  void show() {
    image(background, width/2, height/2);
  }

  void events() {
    //PRESS BACK
    if (click(918, 484, 54, 54)) {
      PAGE = 2;
    }
  }
}