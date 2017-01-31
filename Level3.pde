class Level3 extends Input {
  private PImage background;
  private PImage monsterC, light ;
  private Button btn_map, next_level;
  private float[] posX = {150, 260, 380, 510, 620, 740, 870};
  private float[] posY = {125, 275, 420};
  private int place=0;
  private float x, y, distanceX, distanceY;
  private int page, a = 0;
  private boolean choose = false;
  Sound cNote;
  Sound wrong;

  Level3() {
    background = loadImage("bg/level3.png");
    monsterC = loadImage("dó0.png");
    light = loadImage("asset/light.png");
    btn_map = new Button("button/map-up.png", "button/map-down.png", 128/2+(16), height-(134/2)-16); 
    next_level = new Button("button/right-up.png", "button/right-down.png", width/2, height/2);
    
    //sound
    cNote = new Sound("C note.wav", -10, false);
    wrong = new Sound("wrong.wav", -10, false);

    page=0;
  }

  void show() {
<<<<<<< HEAD
    //intro
    if (page == 0) {
      image(background, width/2, height/2);
      if (insideButton(btn_map)) {
=======
    println(distanceX);
      background(255);
      image(background, width/2, height/2);
      image(monsterC, 149, 395);
      player.show(1,500,300,2,true);
      
    if (insideButton(btn_map)) {
>>>>>>> fe5d3c5a09c13cd4e5884a3e27ca1a717d0bc001
        isInside = true;
      } else
        isInside = false;

      player.y = 200;

      player.moveRight(100, 2);

<<<<<<< HEAD
      if (mousePressed && !player.moving) {
        player.show(0, player.x, player.y, 3); //witch animation, positon x, position y, velocity;
      } else if (player.moving) {
        player.show(3, player.x, player.y, 3); //witch animation, positon x, position y, velocity;
      } else { 
        player.show(6, player.x, player.y, 3);
      }
=======
    if (mousePressed && !player.moving) {
      player.show(0, player.x, player.y, 3,true); //witch animation, positon x, position y, velocity;
    } else if (player.moving) {
      player.show(3, player.x, player.y, 3,true); //witch animation, positon x, position y, velocity;
    } else { 
      player.show(6, player.x, player.y, 3,true);
>>>>>>> fe5d3c5a09c13cd4e5884a3e27ca1a717d0bc001
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
    //intro
    if (page ==0) {
      //Come back to the map
      if (btn_map.execute())
        PAGE = 4 ;
        
        
    }

    //gameplay
    if (page ==1) {
      //Come back to the map
      if (btn_map.execute())
        PAGE = 4 ;

      //click in the lawn
      for (int b = 0; b < 3; b++) { 
        if (a<7 && click(posX[a], posY[b], 105, 150) ) {
          if (place == b) {
            println("b : "+b+" | place : "+place+" | ACHOU | linha: "+a);
            //player.moveRight(105, 3);
            cNote.playSound();
            choose = false;
            a++;
          } else{
            wrong.playSound();
            println("b : "+b+" | place : "+place+" | ERRADO | linha: "+a);
          }
        } else if(a>6){
          congrats();
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
  
  void congrats() {
    fill(0, 150);
    rect(250, 100, 500, 400);
    if (next_level.execute()) {
      //ZERA OQ TIVER DE SER ZERADO AQUI
      choose=false;
      a=0;
      page=1;
      player.x = -10;
      PAGE = 4;
    }
  }
}