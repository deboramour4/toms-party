class Level2 extends Input {
  private PImage background;
  private PImage monsterC;
  private PImage btn_map;
  private PImage play_note1, play_note2, play_note3;

  Level2() {
    background = loadImage("level2.png");
    monsterC = loadImage("monster-C.png");
    play_note1 = loadImage("play-note1.png");
    play_note2 = loadImage("play-note2.png");
    play_note3 = loadImage("play-note3.png");
    btn_map = loadImage("btn-map.png");
  }

  void show() {
    image(background, width/2, height/2);
    image(monsterC, 149, 395);
    image(play_note1, 222, 420);
    image(play_note2, 223, 326);
    image(play_note3, 222, 514);
    
    //buton map
    image(btn_map, 69, 502);
  }

  void events() {
    if (clickRadial(btn_map, 69, 502))
      PAGE = 3 ;
  }
}