class Credits extends Input {
  private PImage background1, background2;
  Button btn_map, btn_right, btn_left;
  private int page;

  Credits() {
    background1 = loadImage("bg/credits1.png");
    background2 = loadImage("bg/credits2.png");
    btn_map = new Button("button/map-up.png", "button/map-down.png", 128/2+(16), height-(134/2)-16);
    btn_right = new Button("button/right-up.png", "button/right-down.png", width-(128/2)-16, height-(134/2)-16);
    btn_left = new Button("button/left-up.png", "button/left-down.png", 128/2+(16), height-(134/2)-16);
    page = 0;
  }

  void show() {
    if (page == 0) {
      image(background1, width/2, height/2);

      if (insideButton(btn_map) || insideButton(btn_right))
        isInside = true;
      else
        isInside = false;
    } else {
      image(background2, width/2, height/2);
      
      if (insideButton(btn_left))
        isInside = true;
      else
        isInside = false;
    }
  }

  void events() {

    if (page ==0) {
      //PRESS TO COME BACK TO THE MAP
      if (btn_map.execute() && page == 0) {
        delay(400);
        PAGE = 1;
      }

      //PRESS TO COME BACK TO THE FIRST PAGE OF THE CREDITS
      if (btn_right.execute() && page == 0) {
        delay(400);
        page = 1;
      }
    }

    if (page ==1) {
      //PRESS TO GO TO THE SECOND PAGE OF THE CREDITS
      if (btn_left.execute() && page == 1) { 
        delay(400);
        page = 0;
      }
    }
  }
}