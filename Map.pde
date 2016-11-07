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
    if (click(btn_party,379, 352)) {
      PAGE = 3;
    }
    
    //DRAG BUTTON
    drag(btn_party, 500,100);
    
  }
}