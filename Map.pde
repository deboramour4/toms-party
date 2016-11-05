class Map extends Input {
  private PImage background;
  private PImage btn_party;

  Map() {
    background = loadImage("map.png");
    btn_party = loadImage("btn-party.png");
  }

  void show() {
    image(background, width/2, height/2);
  }

  void events() {
    //PRESS PARTY
    if (click(311, 285, 130, 130)) {
      image(btn_party, 379, 352);
      PAGE = 3;
    }
  }
}