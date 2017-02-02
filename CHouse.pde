class CHouse extends Input {
  PImage background;
  Button btn_map, btn_level1, btn_level2, btn_level3;

  CHouse() {
    background = loadImage("bg/cHouse.png");
    btn_map = new Button("button/map-up.png", "button/map-down.png", 128/2+(16), height-(134/2)-16);
    btn_level1 = new Button("button/lv1.png", "button/lv1-over.png", 275, 250);
    btn_level2 = new Button("button/lv2.png", "button/lv2-over.png", 525, 250);
    btn_level3 = new Button("button/lv3.png", "button/lv3-over.png", 775, 250);
  }

  void show() {
    image(background, width/2, height/2);
    fill(0);

    if (insideButton(btn_level1) || insideButton(btn_level2) || insideButton(btn_level3) || insideButton(btn_map))
      isInside = true;
    else
      isInside = false;
  }

  void events() {
      if (btn_level1.execute2()){
        cHouse.stopSound();
        menu_music.stopSound();
        PAGE = 6;
      }

      if (btn_level2.execute2()){
        cHouse.stopSound();
        menu_music.stopSound();
        PAGE = 7;
      }

      if (btn_level3.execute2()){
        cHouse.stopSound();
        menu_music.stopSound();
        PAGE = 8;
      }

      if (btn_map.execute()) {
        cHouse.stopSound();
        menu_music.playSound();
        sMap.playSound();
        PAGE = 4 ;
      }
  }
}