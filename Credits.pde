class Credits extends Input {
  private PImage background1, background2;
  private PImage btn_map_up,btn_map_down, btn_right_up, btn_left_up, btn_right_down, btn_left_down;
  private int page;

  Credits() {
    background1 = loadImage("credits1.png");
    background2 = loadImage("credits2.png");
    btn_map_up = loadImage("map-up.png");
    btn_map_down = loadImage("map-down.png");
    btn_right_up = loadImage("right-up.png");
    btn_left_up = loadImage("left-up.png");
    btn_right_down = loadImage("right-down.png");
    btn_left_down = loadImage("left-down.png");
    page = 0;
  }

  void show() {
    if (page == 0) {
      image(background1, width/2, height/2);
      image(btn_map_up, 76, 490);
      image(btn_right_up, 929, 490);
      
      if(inside(btn_right_up,929,490))
        image(btn_right_down,929,490);
      if(inside(btn_map_up,76,490))
        image(btn_map_down,76,490);
        
    } else {
      image(background2, width/2, height/2);
      image(btn_left_up, 76, 490);
      
      if(inside(btn_left_up,76,490))
        image(btn_left_down,76,490);
    }
  }

  void events() {
    //PRESS TO COME BACK TO THE MAP
    if (clickRadial(btn_map_up, 76, 493) && page == 0) {
      PAGE = 3;
      delay(400);
    }

    //PRESS TO GO TO THE SECOND PAGE OF THE CREDITS
    if (clickRadial(btn_left_up, 76, 490) && page == 1) { 
      image(btn_left_down, 76, 490);
      delay(400);
      page = 0;
    }

    //PRESS TO COME BACK TO THE FIRST PAGE OF THE CREDITS
    if (clickRadial(btn_right_up, 929, 490) && page == 0) {
      page = 1;
      delay(400);
    }
  }
}