class Level2 extends Input {
  PImage background;
  PImage mDo, mDoHappy;
  PImage btn1Off, btn2Off, btn3Off, btn1On, btn2On, btn3On ;
  Button btn_map, next_level;
  PImage bar0, bar1, bar2, bar3, bar4, bar5;

  int[] buttons = new int[3];
  int cont = 0, y = -1, posX;

  float time = 0.0, inicio;

  boolean valido = false;
  boolean starting = false;
  boolean ending = false;
  boolean correct = false;
  boolean wrong1, wrong2;
  float time1, time2;

  int page;

  float x2 = 0.0;       
  float y2 = 0.0;

  Moves balloon1, balloon2, balloon3;
  Moves[] balloons;

  Sound cNote;
  Sound agudo, grave;


  Level2() {
    delay(1000);
    background = loadImage("bg/level2.png");

    starting = true;

    //buttons
    randomPosition(buttons);

    btn_map = new Button("button/map-up.png", "button/map-down.png", 128/2+(16), height-(134/2)-16);
    next_level = new Button("button/right-up.png", "button/right-down.png", width/2, height/2);

    btn1Off = loadImage("button/btn1Off.png");
    btn2Off = loadImage("button/btn2Off.png");
    btn3Off = loadImage("button/btn3Off.png");
    btn1On = loadImage("button/btn1On.png");
    btn2On = loadImage("button/btn2On.png");
    btn3On = loadImage("button/btn3On.png");

    bar0 = loadImage("asset/bar-0.png");
    bar1 = loadImage("asset/bar-1.png");
    bar2 = loadImage("asset/bar-2.png");
    bar3 = loadImage("asset/bar-3.png");
    bar4 = loadImage("asset/bar-4.png");
    bar5 = loadImage("asset/bar-5.png");


    balloon1 = new Moves(3);
    balloon1.animations[0] = new Animation("asset/balloon", 1, ".png", 2);
    balloon1.animations[1] = new Animation("animation/balloon/corneta (", 25, ").png", 2);
    balloon1.animations[2] = new Animation("asset/balloon-over", 1, ".png", 2);

    balloon2 = new Moves(3);
    balloon2.animations[0] = new Animation("asset/balloon", 1, ".png", 2);
    balloon2.animations[1] = new Animation("animation/balloon/corneta (", 25, ").png", 2);
    balloon2.animations[2] = new Animation("asset/balloon-over", 1, ".png", 2);

    balloon3 = new Moves(3);
    balloon3.animations[0] = new Animation("asset/balloon", 1, ".png", 2);
    balloon3.animations[1] = new Animation("animation/balloon/corneta (", 25, ").png", 2);
    balloon3.animations[2] = new Animation("asset/balloon-over", 1, ".png", 2);

    balloons = new Moves[3];
    balloons[0] = balloon1;
    balloons[1] = balloon2;
    balloons[2] = balloon3;

    //sound
    cNote = new Sound("music/dó.mp3", +10, false);
    agudo = new Sound("music/agudo.mp3", +10, false);
    grave = new Sound("music/grave.mp3", +10, false);

    page = 0;
  }
  //
  void show() {
    //intro
    if (page ==0) {
      image(background, width/2, height/2);
      if (insideButton(btn_map) )
        isInside = true;
      else
        isInside = false;

      //C coming
      player.moveRight(500, 4);
      if (player.moving) {
        player.show(3, player.x, 290, 3, true); //witch animation, positon x, position y, velocity;
      } else { 
        player.show(6, player.x, 290, 3, true);
      }

      //Play by itself ------------------------------------
      if (!player.moving) {
        for (int i=0; i<=2; i++) {
          posX = (i+1)*250;
          if (i==y)
            balloons[i].show(1, posX, 95, 2, true);  
          else 
          balloons[i].show(0, posX, 111, 2, false);
        }
        if (millis()>inicio+1500.0) {
          if (y<2 && buttons[y+1] == 1)
            cNote.playSound();
          else if (y<2 && buttons[y+1] == 2)
            agudo.playSound();
          else if (y<2 &&  buttons[y+1] == 3)
            grave.playSound();       
          y++;
          inicio = millis();
        }
        if (y==3)
          page=1;
      } else {
        balloons[0].show(0, 250, 111, 2, false);
        balloons[1].show(0, 500, 111, 2, false);
        balloons[2].show(0, 750, 111, 2, false);
      }
      //--------------------------------------------------
      switch(cont) {
      case 0:
        image(bar0, 950, 280);
        break;

      case 1:
        image(bar1, 950, 280);
        break;

      case 2:
        image(bar2, 950, 280);
        break;

      case 3:
        image(bar3, 950, 280);
        break;

      case 4:
        image(bar4, 950, 280);
        break;

      case 5:
        image(bar5, 950, 280);
        break;
      }
    }

    //gameplay
    if (page == 1) {
      image(background, width/2, height/2);
      if (insideButton(btn_map) )
        isInside = true;
      else
        isInside = false;

      switch(cont) {
      case 0:
        image(bar0, 950, 280);
        break;

      case 1:
        image(bar1, 950, 280);
        break;

      case 2:
        image(bar2, 950, 280);
        break;

      case 3:
        image(bar3, 950, 280);
        break;

      case 4:
        image(bar4, 950, 280);
        break;

      case 5:
        image(bar5, 950, 280);
        break;
      }
    }
  }

  void events() {
    //intro
    if (page ==0) {
      //Come back to the map
      if (btn_map.execute()) {
        sMap.playSound();
        correct = false;
        y=-1;
        page=0;
        PAGE = 4 ;
      }
    }

    if (page ==1) {
      //Come back to the map
      if (btn_map.execute()) {
        sMap.playSound();
        correct = false;
        y=-1;
        page=0;
        PAGE = 4 ;
      }


      //Conditions and actions for player
      if (player.moving) {
        player.show(3, player.x, 290, 3, true); //witch animation, positon x, position y, velocity;
      } else if (correct && !player.moving) {
        player.show(2, 500, 290, 3, false);
        if (player.animations[2].animRunning == false)
          player.animations[2].frame = 0;
      } else if (wrong1  || wrong2) {
        player.show(4, 500, 290, 3, false);
        if (player.animations[4].animRunning == false)
          player.animations[4].frame = 0;
      } else { 
        player.show(0, player.x, 290, 3, true);
      }

      if (correct && cont<5) {
        if (millis() > time + 1500.0) {
          cont++;
          randomPosition(buttons);
          correct = false;
          y=-1;
          page=0;
          delay(1000);
        }
        buttonPosition(buttons);
      } else if (!correct) {
        buttonPosition(buttons);
      } else {
        congrats();
        ending = true;
        //PAGE = 4;
      }


      if (wrong1 && millis() > time1 + 1000.0) {
        wrong1 = false;
      }

      if (wrong2 && millis() > time2 + 1000.0) {
        wrong2 = false;
      }
    }
  }

  void randomPosition(int[] b) {
    for (int i = 0; i < b.length; i++) {
      do {
        buttons[i] = int(random(1, 4));
        valido = true;
        for (int j = 0; j < i; j++)
          if (b[i] == buttons[j])
            valido = false;
      } while (valido == false);
    }
  }

  void buttonPosition(int[] b) {
    //delay(1000);
    int i = 0;
    int pos = 0;
    for (i = 0; i<b.length; i++) {
      pos = (i+1)*250;
      switch (b[i]) {
      case 1:
        if ( !correct && mousePressed && mouseX>pos-75 && mouseX<pos+75 && mouseY>36 && mouseY<186) {
          correct = true;
          time = millis();
          cNote.playSound();
        } else if (!correct) {
          balloon1.show(0, pos, 111, 2, true);
        }
        if (correct) {
          balloon1.show(1, pos, 95, 2, true);
        } else if (inside(balloon1.animations[0].images[0], pos, 111)) {
          balloon1.show(2, pos, 111, 2, false);
        }
        //inside(btn1Off, pos, 111);
        break;
      case 2:
        if (mousePressed && mouseX>pos-75 && mouseX<pos+75 && mouseY>36 && mouseY<186) {
          wrong1 = true;
          time1 = millis();
          agudo.playSound();
        } else if (!correct && !wrong1) {
          balloon2.show(0, pos, 111, 2, true);
        }
        if (correct) 
          balloon2.show(0, pos, 111, 2, true);

        if (wrong1) {
          balloon2.show(1, pos, 95, 2, true);
          sTry.playSound();
        } else if (inside(balloon1.animations[0].images[0], pos, 111)) {
          balloon2.show(2, pos, 111, 2, false);
        }


        //inside(btn2Off, pos, 111);
        break;
      case 3:
        if (mousePressed && mouseX>pos-75 && mouseX<pos+75 && mouseY>36 && mouseY<186 && !correct) {
          wrong2 = true;
          time2 = millis();
          balloon3.show(1, pos, 95, 2, true);
          grave.playSound();
        } else if (!correct && !wrong2) {
          balloon3.show(0, pos, 111, 2, true);
        }
        if (correct) 
          balloon3.show(0, pos, 111, 2, true);

        if (wrong2) {
          balloon3.show(1, pos, 95, 2, true);
          sTry.playSound();
        } else if (inside(balloon1.animations[0].images[0], pos, 111)) {
          balloon3.show(2, pos, 111, 2, false);
        }
        break;
      }
    }
  }

  void congrats() {
    fill(0, 150);
    rect(250, 100, 500, 400);
    if (next_level.execute()) {
      //ZERA OQ TIVER DE SER ZERADO AQUI
      cont =0;
      page=1;
      player.x = -10;
      PAGE = 8;
    }
  }
}