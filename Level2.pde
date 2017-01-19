class Level2 extends Input {
  private PImage background;
  private PImage monsterC;
  private PImage btn_map_up, btn_map_down;
  private PImage play_note1, play_note2, play_note3;
  private float[] positions = {326, 420, 514};
  private float i=0;
  private boolean PLAY = true, comingEnd = false;
  private float x, y, distanceX, distanceY;

  Level2() {
    background = loadImage("level2.png");
    monsterC = loadImage("monster-C.png");
    play_note1 = loadImage("play-note1.png");
    play_note2 = loadImage("play-note2.png");
    play_note3 = loadImage("play-note3.png");
    btn_map_up = loadImage("map-up.png"); 
    btn_map_down = loadImage("map-down.png");  
    x= 0;
    y=698;
  }

  void show() {

    //buton map
    image(btn_map_up, 69, 502);

    println(distanceX);
    //if (!PLAY) {
    //  coming(x, y, 750, 698);
    //  //image(background, width/2, height/2); 
    //  image(monsterC, x+(i*distanceX), y+(i*distanceY));
    //  if (comingEnd) {
    //    PLAY = true;
    //  }
    //}
    if (PLAY) {
      background(255);
      image(background, width/2, height/2);
      image(monsterC, 149, 395);
      //image(play_note1, 222, 420);
      //image(play_note2, 223, 326);
      //image(play_note3, 222, 514);

      //buton map
      image(btn_map_up, 69, 502);
    }
  }

  void events() {
    if (inside(btn_map_up, 69, 502))
      image(btn_map_down, 69, 502);


    //Come back to the map
    if (clickRadial(btn_map_up, 69, 502))
      PAGE = 3 ;
    delay(400);
  }

  void choosePosition() {
    float pos;
    pos = int(random(2));
  }

  void coming(float x1, float y1, float x2, float y2) {
    distanceX = x2-x1;
    distanceY = y2-y1;
    if (i <=1) { 
      i = i + 0.03; // Velocity
    }

    if (i >=1) {
      comingEnd = true; //end of the animation
      i=0;
    }
  }
}