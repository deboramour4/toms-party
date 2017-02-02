class Map extends Input {
  private PImage background;
  Button btn_party, btn_help, btn_cHouse,btn_dHouse,btn_eHouse, btn_menu;
  boolean play_click;

  Map() {
    background = loadImage("bg/map.png");
    btn_party = new Button("button/party-on.png", "button/party-over.png", 448, 460 );
    btn_menu = new Button("button/home-up.png", "button/home-down.png", width-(128/2)-16, 134/2+(16));
    
    btn_cHouse = new Button("button/cHouse-on.png", "button/cHouse-over.png",140, 230 );
    btn_dHouse = new Button("button/dHouse-off.png", "button/dHouse-over.png", 460, 120 );
    btn_eHouse = new Button("button/eHouse-off.png", "button/eHouse-over.png", 747, 230 );
    
    sParty = new Sound("music/tom-house.mp3", +30, false);
    cHouse = new Sound("music/doHouse.mp3", +30, false);
    sMap = new Sound("music/map-voz.mp3", +30, false);
  }

  void show() {
    image(background, width/2, height/2);
    
    if (insideButton(btn_party) || insideButton(btn_menu) || insideButton(btn_cHouse))
      isInside = true;
    else
      isInside = false;
      
      btn_dHouse.execute();
      btn_eHouse.execute();
  }

  void events() {
    //RETURN TO MENU
    if (btn_menu.execute()) {
      sMap.stopSound();
      PAGE = 1;
      delay(200);
    }

    //PRESS PARTY
    if (btn_party.execute2()) {
      sMap.stopSound();
      sParty.playSound();
      PAGE = 3;
      delay(200);
    }

    //PRESS DO'S HOUSE
    if (btn_cHouse.execute2()) {
      sMap.stopSound();
      cHouse.playSound();
      PAGE = 5;
      delay(200);
    }
  }
}