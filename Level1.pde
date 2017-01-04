class Level1 extends Input {
  private PImage background;
  private PImage btn_map;
  private PImage bell1, bell2, bell3, bell1_play, bell2_play, bell3_play;

  Level1() {
    background = loadImage("level1.png");
    btn_map = loadImage("btn-map.png");
    bell1 = loadImage("bell.png");
    bell2 = loadImage("bell.png");
    bell3 = loadImage("bell.png");
    bell1_play = loadImage("bell-play.png");
    bell2_play = loadImage("bell-play.png");
    bell3_play = loadImage("bell-play.png");
  }

  void show() {
    image(background, width/2, height/2);
    rotateIt(bell1, 176, 175, PI);
    //image(bell1, 176, 175);
    rotateIt(bell2, 488, 175, HALF_PI);
    //image(bell2, 488, 175);
    image(bell3, 790, 175);

    //buton map
    image(btn_map, 69, 502);
  }

  void events() {
    //PRESS Bell 1
    if (click(bell1, 176, 175)) 
      rotateIt(bell1_play, 176, 175, PI);

    if (click(bell2, 488, 175)) 
      rotateIt(bell2_play, 488, 175, HALF_PI);

    if (click(bell3, 790, 175)) 
      image(bell3_play, 790, 175);

    if (clickRadial(btn_map, 69, 502))
      PAGE = 3 ;
  }
}