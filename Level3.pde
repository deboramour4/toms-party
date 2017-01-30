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
    btn_map = new Button("button/map-up.png", "button/map-down.png", 128/2+(16), height-(134/2)-16);
  }

  void show() {
    background(255);
    image(background, width/2, height/2);
    if (insideButton(btn_map)) {
        isInside = true;
      } else
        isInside = false;

    player.y = 200;

    player.moveRight(100, 2);

    if (mousePressed && !player.moving) {
      player.show(0, player.x, player.y, 3); //witch animation, positon x, position y, velocity;
    } else if (player.moving) {
      player.show(3, player.x, player.y, 3); //witch animation, positon x, position y, velocity;
    } else { 
      player.show(6, player.x, player.y, 3);
    }
  }

  void events() {
    //Come back to the map
    if (btn_map.execute())
      PAGE = 4 ;
  }
}