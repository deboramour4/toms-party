class Level3 extends Input {
  private PImage background;
  private PImage monsterC;
  Button btn_map;
  private PImage play_note1, play_note2, play_note3;
  private float[] positions = {326, 420, 514};
  private float i=0;
  private float x, y, distanceX, distanceY;

  Level3() {
    background = loadImage("bg/level3.png");
    monsterC = loadImage("dó0.png");
    play_note1 = loadImage("play-note1.png");
    play_note2 = loadImage("play-note2.png");
    play_note3 = loadImage("play-note3.png");
    btn_map = new Button("button/map-up.png","button/map-down.png",128/2+(16), height-(134/2)-16);    
  }

  void show() {
    println(distanceX);
      background(255);
      image(background, width/2, height/2);
      player.show(1,500,300,5);
  }

  void events() {
    //Come back to the map
    if (btn_map.execute())
      PAGE = 4 ;
    
  }

}