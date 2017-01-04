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
    //RETURN TO MENU
    if (click(btn_party, 930, 43))
      PAGE = 1;

    //PRESS PHASE 1
    if (clickRadial(btn_party, 381, 349)) {
      if (frameCount % 60 <= 40)
        PAGE = 4;
    }

    if (clickRadial(btn_party, 637, 468))
      PAGE = 6;

    //DRAG BUTTON
    //drag(btn_party, 500,100);;
  }
}