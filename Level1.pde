class Level1 extends Input {
  PImage background;
  PImage mDo, mDoHappy;
  Button btn_map, btn_level1, btn_level2, btn_level3;
  Asset rock1, rock2, arbo1, arbo2, arbo3;

  PImage btn1Off, lock;

  int page = 0;

  //sound
  Sound cNote;
  Sound wrong;

  Level1() {
    background = loadImage("bg/level1.png");
    btn_map = new Button("button/map-up.png", "button/map-down.png", 128/2+(16), height-(134/2)-16);

    rock1 = new Asset("asset/rock1.png", "asset/rock1Over.png", 210, 235);
    rock2 = new Asset("asset/rock2.png", "asset/rock2Over.png", 744, 155);
    arbo1 = new Asset("asset/arbo1.png", "asset/arbo1Over.png", 460, 174);
    arbo2 = new Asset("asset/arbo2.png", "asset/arbo2Over.png", 817, 344);
    arbo3 = new Asset("asset/arbo3.png", "asset/arbo3Over.png", 493, 433);
    
    page = 1;
  }


  void show() {
    //intro
    if (page == 0) {

    }
  
    //gameplay
    if (page == 1) {
      image(background, width/2, height/2);

      if ( insideButton(btn_map) || rock1.run() || rock2.run() ||arbo1.run() || arbo2.run() || arbo3.run()) {
        isInside = true;
        player.show(5, rock1.x, rock1.y-100, 5) ;
      } else
        isInside = false;

      rock1.run();
      rock2.run();
      arbo1.run();
      arbo2.run();
      arbo3.run();
    }
  }

  void events() {
    //intro
    if (page == 0) {
      
      }
    
    //gameplay
    if (page == 1) {
      if (btn_map.execute()) {
        page = 0;
        PAGE = 4 ;
      }
    }
  }
}

class Asset extends Input {
  private PImage asset;
  private PImage assetOver;
  private float x, y;

  Asset(String asset, String assetOver, float x, float y ) {
    this.asset = loadImage(asset);
    this.assetOver = loadImage(assetOver);
    this.x = x;
    this.y = y;
  }

  boolean run() {
    if (inside(asset, x, y)) {
      image(assetOver, x, y);
      return true;
    } else {
      image(asset, x, y);
      return false;
    }
  }
}