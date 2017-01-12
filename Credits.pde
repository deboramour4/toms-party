class Credits extends Input {
  private PImage background1, background2;
  private PImage btn_map, btn_right, btn_left;
  private int page = 0;

  Credits() {
    background1 = loadImage("credits1.png");
    background2 = loadImage("credits2.png");
    btn_map = loadImage("btn-map.png");
    btn_right = loadImage("to-right.png");
    btn_left = loadImage("to-left.png");
  }

  void show() {
    if (page == 0) {
      image(background1, width/2, height/2);
      image(btn_map, 76, 493);
      image(btn_right, 929, 477);
    } else {
      image(background2, width/2, height/2);
      image(btn_left, 76, 477);
      //image(btn_right, 929, 477);
    }
  }

  void events() {
    //PRESS Bell 1
    if (clickRadial(btn_map, 76, 493) && page == 0) {
      PAGE = 3;
      delay(400);
    }

    if (clickRadial(btn_left, 76, 477) && page == 1) { 
      page = 0;
      delay(400);
    }
    if (clickRadial(btn_right, 929, 477) && page == 0) {
      page = 1;
      delay(400);
    }
  }
}