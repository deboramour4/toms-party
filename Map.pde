class Map extends Input {
  private PImage background;
  Button btn_party, btn_help, btn_doHouse, btn_menu;
  boolean play_click;

  Map() {
    background = loadImage("bg/map.png");
    btn_party = new Button("button/btn-party.png", "button/btn-party.png", 381, 349 );
    btn_help = new Button("button/help-up.png", "button/help-down.png", width-(128/2)-16, 134/2+(16));
    btn_doHouse = new Button("button/help-up.png", "button/help-down.png", 638, 461 );
    sParty = new Sound("music/tom-house.mp3", +30, false);
    cHouse = new Sound("music/doHouse.mp3", +30, false);
    sMap = new Sound("music/map-voz.mp3", +30, false);
  }

  void show() {
    image(background, width/2, height/2);
    
    if (insideButton(btn_party) || insideButton(btn_help) || insideButton(btn_doHouse))
      isInside = true;
    else
      isInside = false;
  }

  void events() {
    //RETURN TO MENU
    if (btn_help.execute()) {
      sMap.stopSound();
      PAGE = 1;
      delay(200);
    }

    //PRESS PARTY
    if (btn_party.execute()) {
      sMap.stopSound();
      sParty.playSound();
      PAGE = 3;
      delay(200);
    }

    //PRESS DO'S HOUSE
    if (btn_doHouse.execute()) {
      sMap.stopSound();
      cHouse.playSound();
      PAGE = 5;
      delay(200);
    }
  }
}