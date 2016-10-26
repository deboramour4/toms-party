class Map {
  PImage background;
  PImage btn_party;

  Map() {
    background = loadImage("map.png");
    btn_party = loadImage("btn-party.png");
  }

  void show() {
    image(background, width/2, height/2);
  }

  void events() {
    //PRESS PARTY
    if (mousePressed && mouseX>311 && mouseX<437 && mouseY>285 && mouseY<420) {
      image(btn_party, 379, 352);
      if (frameRate % 60 <= 40)
        PAGE = 3;
    }
  }
}