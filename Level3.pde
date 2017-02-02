class Level3 extends Input {
  private PImage background;
  private PImage monsterC, light ;
  private Button btn_map, next_level;
  private float[] posX = {150, 260, 380, 510, 620, 740, 870, 950};
  private float[] posY = {125, 275, 420};
  private int place=0;
  int b = 0;
  private int x=0, y=-1, id=0;
  private int page, a = 0;
  private boolean choose = false, play=false, sing = false, wrong1= true, wrong2 = false, valido=false;      
  private float inicio = millis(), singTime;
  private float intervalo = 3000; //3 segundos
  Sound cNote;
  Sound grave, parecida;

  int[] button;

  Level3() {
    background = loadImage("bg/level3.png");
    monsterC = loadImage("dó0.png");
    light = loadImage("asset/light.png");
    btn_map = new Button("button/map-up.png", "button/map-down.png", 128/2+(16), height-(134/2)-16); 
    next_level = new Button("button/right-up.png", "button/right-down.png", width/2, height/2);

    //sound
    cNote = new Sound("music/dó.mp3", +10, false);

    //erro[0] = new Sound("music/agudo.mp3", +10, false); //agudo
    grave = new Sound("music/grave.mp3", +10, false); // grave
    parecida = new Sound("music/erro.mp3", +10, false); ///parecido

    button = new int[3];
    page=0;
  }

  void show() {
    println(button[0]+" "+button[1]+" "+button[2]);
    //intro
    if (page == 0) {
      image(background, width/2, height/2);
      if (insideButton(btn_map)) {
        isInside = true;
      } else
        isInside = false;

      player.y = 200;

      if (a<8) {
        //player.moveRight(posX[a]-105, 2);
        player.moveAnywhere(posX[a]-105, posY[place], 3);
      }

      if (!player.moving) 
        player.show(6, player.x, player.y, 3, true); //witch animation, positon x, position y, velocity;
      else 
      player.show(3, player.x, player.y, 3, true); //witch animation, positon x, position y, velocity;

      //Choose the right note
      if (!choose) {
        chooseLawn(button);
        choose = true;
      }

      //PLAY BY ITSELF -----------------------------
      if (!player.moving) { //if it stop moving
        if (x<7 && (millis()>inicio+intervalo || y==-1)) {
          y++;
          inicio = millis();
          play = true;
        } else if (x<7 && y<3) {
          image(light, posX[x], posY[y]);
          if (button[y] == 1 && play) { 
            cNote.playSound(); 
            play = false;
          } 
          if (button[y] == 2 && play) {
            parecida.playSound();
          }
          if (button[y] == 3 && play) {
            grave.playSound();
          }
          play = false;
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
        if (millis() > singTime+2000)
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
          if (button[b] == 1) {
            choose = false;
            a++; // next col
            x++; // next col
            player.moveAnywhere(posX[a], posY[0] , 2);
            y =-1; // back to the 1st row
            id=0;
            page = 0; // play again
          }  
          if (button[b] == 2) { 
            parecida.playSound();
          }
          if (button[b] == 3) {
            grave.playSound();
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

  void chooseLawn(int[] b) {
    for (int i = 0; i < b.length; i++) {
      do {
        button[i] = int(random(1, 4));
        valido = true;
        for (int j = 0; j < i; j++)
          if (b[i] == button[j])
            valido = false;
      } while (valido == false);
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