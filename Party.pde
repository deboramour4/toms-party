class Party {
  PImage background;
  PImage btn_back;

  Party() {
    background = loadImage("party.png");
    btn_back = loadImage("btn-start.png");
  }

  void show() {
    image(background, width/2, height/2);
  }

  void events() {
    //PRESS BACK
    if (mousePressed && mouseX>918+5 && mouseX<972-5 && mouseY>484+5 && mouseY<538-5) {
      if (frameRate % 60 <= 40)
        PAGE = 2;
    }
  }
}