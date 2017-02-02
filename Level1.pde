class Level1 extends Input {
  PImage background;
  PImage mDo, mDoHappy;
  Button btn_map, btn_level1, btn_level2, btn_level3, next_level;
  Animation a_rock1, a_rock2, a_arbo1, a_arbo2, a_arbo3;
  Asset rock1, rock2, arbo1, arbo2, arbo3;

  Asset[] assets = new Asset[5];
  int cont = 0; 
  boolean time = true;
  float instant;
  boolean choose = false;
  boolean starting = false;
  boolean ending = false;
  boolean correct = false;

  int i=0;

  PImage btn1Off, lock;

  int page = 0;

  float inicio = millis();
  float intervalo = 2000;
  int y = -1;

  //sound
  Sound cNote;
  Sound wrong;

  Level1() {
    background = loadImage("bg/level1.png");
    btn_map = new Button("button/map-up.png", "button/map-down.png", 128/2+(16), height-(134/2)-16);
    next_level = new Button("button/right-up.png", "button/right-down.png", width/2, height/2); 

    assets[0] = new Asset("asset/rock1.png", "asset/rock1Over.png", 210, 235);
    assets[1] = new Asset("asset/arbo1.png", "asset/arbo1Over.png", 460, 174);
    assets[2] = new Asset("asset/rock2.png", "asset/rock2Over.png", 744, 155);
    assets[3] = new Asset("asset/arbo2.png", "asset/arbo2Over.png", 817, 344);
    assets[4] = new Asset("asset/arbo3.png", "asset/arbo3Over.png", 493, 433);

    cNote = new Sound("C note.wav", -10, false);
    wrong = new Sound("wrong.wav", -10, false);

    page = 0;
  }


  void show() {

    //intro
    if (page == 0) {
      image(background, width/2, height/2);
      chooseArbor();
      
      //Zé----------------------
      for (int i=0; i<=4; i++) {
        if (i==y)
          assets[i].run2();
        else 
        assets[i].run3();
      }
      if (millis()>inicio+intervalo) {
        if (y<4){
          //  wrong.playSound();
          //else if (y<4 && assets[y].choosen == true)
          cNote.playSound(); 
          println(assets[y+1].choosen);
        }
        y++;
        inicio = millis();
      }
      if (y==5)
        page=1;
      //Zé----------------------
    }

    //gameplay
    if (page == 1 || page ==2) {
      image(background, width/2, height/2);
      if (insideButton(btn_map)) {
        isInside = true;
        //player.show(5, rock1.x, rock1.y-100, 5,false) ;
      } else
        isInside = false;

      assets[0].run();
      assets[1].run();
      assets[2].run();
      assets[3].run();
      assets[4].run();

      if (page ==2) {
        congrats();
      }
    }
  }

  void events() {

    //intro
    if (page == 0) {
      if (btn_map.execute()) {
        sMap.playSound();
        page = 0;
        PAGE = 4 ;
      }
    }

    //gameplay
    if (page == 1) {

      if (btn_map.execute()) {
        sMap.playSound();
        page = 0;
        PAGE = 4 ;
      }

      for (int i =0; i<5; i++) {
        if (clickRadial(assets[i].asset, assets[i].x, assets[i].y) && assets[i].choosen == true) {
          cNote.playSound();
          page = 2;
          //PAGE = 7;
        } else if (clickRadial(assets[i].asset, assets[i].x, assets[i].y) && assets[i].choosen == false) {
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
      int i = int(random(5));
      assets[i].choose();
      choose = true;
      // println(i);
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
      delay(400);
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
  void run2() {
    image(assetOver, x, y);
  }
  void run3() {
    image(asset, x, y);
  }


  void choose() {
    this.choosen = true;
  }
}