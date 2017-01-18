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

    if (clickRadial(btn_party, 58, 509)) {
      PAGE = 4;
      delay(400);
    }
  }
}