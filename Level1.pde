class Level1 extends Input {
  PImage background;
  PImage mDo, mDoHappy;
  PImage btn_map_up, btn_map_down;
  Asset rock1, rock2, arbo1,arbo2, arbo3;

  PImage btn1Off, lock;

  int page = 0;

  Level1() {

    delay(1000);
    background = loadImage("bg/level1.png");
    
    player = new Moves(500, 400,2);
    player.animations[0] = new Animation("dó",1,".png");
    player.animations[1] = new Animation("sprite", 4, ".png");
    //player
    

    //buttons
    randomPosition(buttons);
  
    

    btn1Off = loadImage("button/btn1Off.png");
    btn2Off = loadImage("button/btn2Off.png");
    btn3Off = loadImage("button/btn3Off.png");
    btn1On = loadImage("button/btn1On.png");
    btn2On = loadImage("button/btn2On.png");
    btn3On = loadImage("button/btn3On.png");

    //sound
    ac = new AudioContext(); 
    cNoteFile = sketchPath("") +"data/C note.wav";
    wrongFile = sketchPath("") +"data/wrong.wav";
    eNoteFile = sketchPath("") +"data/E note.wav";
    try {
      sp1 = new SamplePlayer(ac, new Sample(cNoteFile));
      sp2 = new SamplePlayer(ac, new Sample(wrongFile));
    }
    catch(Exception e) {
      println("Exception while attempting to load sample!");
      e.printStackTrace(); // print description of the error
      exit(); // and exit the program
    }
    sp1.setKillOnEnd(false);
    sp2.setKillOnEnd(false);

    background = loadImage("bg/level1.png");
    btn_map_up = loadImage("button/map-up.png");
    btn_map_down = loadImage("button/map-down.png");
    btn1Off = loadImage("button/btn1Off.png");
    lock = loadImage("lock.png");

    mDo = loadImage("dó0.png");
    mDoHappy = loadImage("dó2.png");

    rock1 = new Asset("asset/rock1.png","asset/rock1Over.png", 210,235);
    rock2 = new Asset("asset/rock2.png","asset/rock2Over.png", 744,155);
    arbo1 = new Asset("asset/arbo1.png","asset/arbo1Over.png", 460,174);
    arbo2 = new Asset("asset/arbo2.png","asset/arbo2Over.png", 817,344);
    arbo3 = new Asset("asset/arbo3.png","asset/arbo3Over.png", 493,433);



    page = 0;
  }


  void show() {
    if (page == 0) {
      image(background, width/2, height/2);
      image(btn_map_up, 69, 502);
      fill(0);
      image(btn1Off, 250, 250);
      image(btn1Off, 500, 250);
      image(btn1Off, 750, 250);

      textSize(72);
      text(1, 220, 270);
      text(2, 480, 270);
      text(3, 730, 270);
      textSize(10);

      image(lock, 500, 250);
      image(lock, 750, 250);
    } else 

    if (page == 1) {
      image(background, width/2, height/2);
      image(btn_map_up, 69, 502);
      //image(mDo, width/2, 380);
      
      rock1.run();
      rock2.run();
      arbo1.run();
      arbo2.run();
      arbo3.run();
    }
  }

  void events() {
    if (page == 0) {
      if (click(btn1Off, 250, 250))
        page = 1;

      if (click(btn1Off, 500, 250))
        PAGE = 6;

      if (click(btn1Off, 750, 250))
        PAGE = 7;

      if (clickButton(btn_map_up, btn_map_down, 69, 502)) {
        page = 0;
        PAGE = 3 ;
      }
    }

    if (page == 1) {
      if (clickButton(btn_map_up, btn_map_down, 69, 502)) {
        page = 0;
        PAGE = 3 ;
      }

      //monster interaction
      if (click(mDo, width/2, 380)) {
        image(mDoHappy, width/2, 380);
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
  
  void run(){
    if(inside(asset, x,y)){
      image(assetOver,x,y);
    } else {
      image(asset,x,y);
    }
    
    //if(click(asset
  }
}