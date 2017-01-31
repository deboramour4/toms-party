class Level3 extends Input {
  private PImage background;
  private PImage monsterC, light ;
  private Button btn_map;
  private float[] posX = {150, 260, 380, 510, 620, 740, 870};
  private float[] posY = {125, 275, 420};
  private int place=0;
  private float x, y, distanceX, distanceY;
  private int page, a = 0;
  private boolean choose = false;

  Level3() {
    background = loadImage("bg/level3.png");
    monsterC = loadImage("dó0.png");
    light = loadImage("asset/light.png");
    btn_map = new Button("button/map-up.png", "button/map-down.png", 128/2+(16), height-(134/2)-16);  
    page=1;
  }

  void show() {
    //intro
    if (page == 0) {
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

    //gameplay
    if (page ==1) {
      image(background, width/2, height/2);
      if (insideButton(btn_map)) {
        isInside = true;
      } else
        isInside = false;

      chooseLawn();
      player.y = 200;

      if (mousePressed && !player.moving) {
        player.show(0, player.x, player.y, 3); //witch animation, positon x, position y, velocity;
      } else if (player.moving) {
        player.show(3, player.x, player.y, 3); //witch animation, positon x, position y, velocity;
      } else { 
        player.show(6, player.x, player.y, 3);
      }
    }
  }
  void events() {
    if (page ==0) {
      //Come back to the map
      if (btn_map.execute())
        PAGE = 4 ;
    }


    if (page ==1) {
      //Come back to the map
      if (btn_map.execute())
        PAGE = 4 ;

      //click in the lawn
      for (int b = 0; b < 3; b++) { 
        if (click(posX[a], posY[b], 105, 150)) {
          if (place == b) {
            println("b : "+b+" | place : "+place+" | ACHOU");
            //player.moveRight(105, 3);
            choose = false;
            a++;
          } else
            println("b : "+b+" | place : "+place+" | ERRADO");
        }
      }
    }
  }

  void chooseLawn() {
    if (!choose) {
      place = int(random(3));
      choose = true;
      println(place);
    }
  }
}