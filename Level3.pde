class Level3 extends Input {
  private PImage background;
  private PImage monsterC, light ;
  private Button btn_map, next_level;
  private float[] posX = {150, 260, 380, 510, 620, 740, 870, 950};
  private float[] posY = {125, 275, 420};
  private int place=0;
  private int x=0, y=-1;
  int b = 0;
  private int page, a = 0;
  private boolean choose = false, play=false, sing = false;      
  private float inicio = millis(), singTime;
  private float intervalo = 3000; //3 segundos
  Sound cNote;
  Sound wrong;

  Level3() {
    background = loadImage("bg/level3.png");
    monsterC = loadImage("dó0.png");
    light = loadImage("asset/light.png");
    btn_map = new Button("button/map-up.png", "button/map-down.png", 128/2+(16), height-(134/2)-16); 
    next_level = new Button("button/right-up.png", "button/right-down.png", width/2, height/2);

    //sound
    cNote = new Sound("music/dó.mp3", -10, false);
    wrong = new Sound("wrong.wav", -10, false);

    page=0;
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

      if (a<8) {
        player.moveRight(posX[a]-105, 2);
      }

      if (!player.moving) 
        player.show(6, player.x, player.y, 3, true); //witch animation, positon x, position y, velocity;
      else 
      player.show(3, player.x, player.y, 3, true); //witch animation, positon x, position y, velocity;

      //Choose the right note
      chooseLawn();


      //PLAY BY ITSELF -----------------------------
      if (!player.moving) { //if it stop moving
        if (x<7 && (millis()>inicio+intervalo || y==-1)) {
          y++;
          inicio = millis();
          play = true;
        } else if (x<7 && y<3) {
          image(light, posX[x], posY[y]);
          if (place == y && play) { 
            cNote.playSound(); 
            play = false;
          } else if (play) {
            wrong.playSound();
            play = false;
          }
        } else {
          page =1;
        }
      }
    }

    //gameplay
    if (page == 1) {
      image(background, width/2, height/2);
      if (insideButton(btn_map)) {
        isInside = true;
      } else
        isInside = false;

      //player.y = 200;

      if (a<8) {
        player.moveRight(posX[a]-105, 3);
        //player.moveUpDown(posY[place], 4);
      }

      if (player.moving) {
        player.show(3, player.x, player.y, 3, false); //witch animation, positon x, position y, velocity;
      } else if (sing) {
        cNote.playSound();
        player.show(1, player.x, player.y, 3, false);
        if(millis() > singTime+2000)
          sing = false;
      } else {
        player.show(0, player.x, player.y, 3, true);
      }
    }
  }


  void events() {
    //intro
    if (page ==0) {
      //Come back to the map
      if (btn_map.execute()) {
        sMap.playSound();
        choose=false;
        a=0;
        x=0;
        y=-1;
        player.x = -10;
        page=0;
        PAGE = 4 ;
      }
    }

    //gameplay
    if (page ==1) {
      //Come back to the map
      if (btn_map.execute() ) {
        sMap.playSound();
        choose=false;
        a=0;
        x=0;
        y=-1;
        player.x = -10;
        page=0;
        PAGE = 4 ;
      }

      //click in the lawn
      for (b = 0; b < 3; b++) { 
        if (a<8 && click(posX[a], posY[b], 105, 150) ) {
          if (place == b) {
            choose = false;
            a++; // next col
            x++; // next col
            player.moveAnywhere(posX[a], posY[0] , 2);
            y =- 1; // back to the 1st row
            page = 0; // play again
          } else {
            wrong.playSound();
          }
        } else if (a>6) {
          player.show(2, player.x, player.y, 3, false);
          congrats();
        }
      }
      
      if (a<8 && !choose) {
        player.moveRight(posX[a]-105, 3);
        //player.moveUpDown(posY[place], 4);
      }
    }
  }

  void chooseLawn() {
    if (!choose) {
      place = int(random(3));
      choose = true;
      println("RIGHT PLACE : "+place);
    }
  }

  void congrats() {
    fill(0, 150);
    rect(250, 100, 500, 400);
    if (next_level.execute()) {
      //ZERA OQ TIVER DE SER ZERADO AQUI
      choose=false;
      a=0;
      x=0;
      y=-1;
      player.x = -10;
      page=0;
      PAGE = 4;
    }
  }
}