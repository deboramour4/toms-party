class Level1 extends Input {
  PImage background;
  PImage mDo, mDoHappy;
  Button btn_map, btn_level1, btn_level2, btn_level3, next_level;
  Animation a_rock1, a_rock2, a_arbo1, a_arbo2, a_arbo3;
  Asset rock1, rock2, arbo1, arbo2, arbo3;

  Asset[] assets = new Asset[3];
  int cont = 0; 
  float time = 0.0;
  boolean choose = false;
  boolean starting = false;
  boolean ending = false;
  boolean correct = false;

  PImage btn1Off, lock;

  int page = 0;

  //sound
  Sound cNote;
  Sound wrong;

  Level1() {
    background = loadImage("bg/level1.png");
    btn_map = new Button("button/map-up.png", "button/map-down.png", 128/2+(16), height-(134/2)-16);
    next_level = new Button("button/right-up.png", "button/right-down.png", width/2, height/2);

    rock1 = new Asset("asset/rock1.png", "asset/rock1Over.png", 210, 235);
    rock2 = new Asset("asset/rock2.png", "asset/rock2Over.png", 744, 155);
    assets[0] = new Asset("asset/arbo1.png", "asset/arbo1Over.png", 460, 174);
    assets[1] = new Asset("asset/arbo2.png", "asset/arbo2Over.png", 817, 344);
    assets[2] = new Asset("asset/arbo3.png", "asset/arbo3Over.png", 493, 433);

    cNote = new Sound("C note.wav", -10, false);
    wrong = new Sound("wrong.wav", -10, false);

    //a_rock1 =new Animation("animation/ass (", 40, ").png", 2);
    //a_rock2 =new Animation("animation/idle/do_idle (", 40, ").png", 2);
    //a_arbo1=new Animation("animation/arbo1/moita1_", 13, ".png", 2);
    //a_arbo2=new Animation("animation/idle/do_idle (", 40, ").png", 2);
    //a_arbo3 =new Animation("animation/idle/do_idle (", 40, ").png", 2);

    page = 1;
  }


  void show() {
    //intro
    if (page == 0) {
      image(background, width/2, height/2);
      //if ( insideButton(btn_map) || rock1.run() || rock2.run() ||arbo1.run() || arbo2.run() || arbo3.run()) {
      //  isInside = true;
      //} else
      //  isInside = false;

      // a_rock1.display2(210, 235,1);
      //a_rock2.display2(744, 155,1);
      a_arbo1.display(460, 174, 2);
      //a_arbo2.display2(817, 344,1);
      //a_arbo3.display2(493, 433,1);
    }

    //gameplay
    if (page == 1 || page ==2) {
      image(background, width/2, height/2);
      if (insideButton(btn_map)) {
        isInside = true;
        player.show(5, rock1.x, rock1.y-100, 5) ;
      } else
        isInside = false;

      chooseArbor();

      rock1.run();
      rock2.run();
      assets[0].run();
      assets[1].run();
      assets[2].run();

      if (page ==2) {
        congrats();
      }
    }
  }

  void events() {

    //intro
    if (page == 0) {
    }

    //gameplay
    if (page == 1) {

      if (btn_map.execute()) {
        page = 1;
        PAGE = 4 ;
      }

      for (int i =0; i<3; i++) {
        if (click(assets[i].asset, assets[i].x, assets[i].y) && assets[i].choosen == true) {
          cNote.playSound();
          page = 2;
          //PAGE = 7;
        } else if (click(assets[i].asset, assets[i].x, assets[i].y) && assets[i].choosen == false) {
          wrong.playSound();
          //player.show(4, 500, 300, 3);
        }
      }
    }
  }

  void intro() {
  }

  void chooseArbor() {
    if (!choose) {
      int i = int(random(3));
      assets[i].choose();
      choose = true;
      println(i);
    }
  }

  void congrats() {
    fill(0, 150);
    rect(250, 100, 500, 400);
    if (next_level.execute()) {
      choose = false;
      for (int i =0; i<3; i++) 
        assets[i].choosen = false;
      page=1;
      PAGE = 7;
    }
  }
}

class Asset extends Input {
  private PImage asset;
  private PImage assetOver;
  private float x, y;
  private boolean choosen;

  Asset(String asset, String assetOver, float x, float y ) {
    this.asset = loadImage(asset);
    this.assetOver = loadImage(assetOver);
    this.x = x;
    this.y = y;
    this.choosen = false;
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

  void choose() {
    this.choosen = true;
  }
}