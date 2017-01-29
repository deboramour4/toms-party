class Level1 extends Input {
  PImage background;
  PImage mDo, mDoHappy;
  Button btn_map, btn_level1, btn_level2, btn_level3;
  Asset rock1, rock2, arbo1, arbo2, arbo3;

  PImage btn1Off, lock;

  int page = 0;

  Level1() {
    background = loadImage("bg/level1.png");
    btn_map = new Button("button/map-up.png", "button/map-down.png", 128/2+(16), height-(134/2)-16);
    btn_level1 = new Button("button/btn1On.png", "button/btn1On.png", 250, 250);
    btn_level2 = new Button("button/btn1On.png", "button/btn1On.png", 500, 250);
    btn_level3 = new Button("button/btn1On.png", "button/btn1On.png", 750, 250);

    rock1 = new Asset("asset/rock1.png", "asset/rock1Over.png", 210, 235);
    rock2 = new Asset("asset/rock2.png", "asset/rock2Over.png", 744, 155);
    arbo1 = new Asset("asset/arbo1.png", "asset/arbo1Over.png", 460, 174);
    arbo2 = new Asset("asset/arbo2.png", "asset/arbo2Over.png", 817, 344);
    arbo3 = new Asset("asset/arbo3.png", "asset/arbo3Over.png", 493, 433);


    page = 0;
  }


  void show() {
    if (page == 0) {
      image(background, width/2, height/2);
      fill(0);

      if (insideButton(btn_level1) || insideButton(btn_level2) || insideButton(btn_level3) || insideButton(btn_map))
        isInside = true;
      else
        isInside = false;
    }

    if (page == 1) {
      image(background, width/2, height/2);
      //image(mDo, width/2, 380);
      rock1.run();
      rock2.run();
      arbo1.run();
      arbo2.run();
      arbo3.run();

      if ( insideButton(btn_map) || rock1.run() || rock2.run() ||arbo1.run() || arbo2.run() || arbo3.run())
        isInside = true;
      else
        isInside = false;
    }
  }

  void events() {
    if (page == 0) {
      if (btn_level1.execute())
        page = 1;

      if (btn_level2.execute())
        PAGE = 6;

      if (btn_level3.execute())
        PAGE = 7;

      if (btn_map.execute()) {
        page = 0;
        PAGE = 3 ;
      }
    }

    if (page == 1) {
      if (btn_map.execute()) {
        page = 0;
        PAGE = 3 ;
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

    //if(click(asset
  }
}