class Level2 extends Input {
  PImage background;
  PImage mDo, mDoHappy;
  PImage btn1Off, btn2Off, btn3Off, btn1On, btn2On, btn3On ;
  Button btn_map;
  PImage bar0, bar1, bar2, bar3, bar4, bar5;

  int[] buttons = new int[3];
  int cont = 0;

  float time = 0.0;

  boolean valido = false;
  boolean starting = false;
  boolean ending = false;
  boolean correct = false;


  float x2 = 0.0;       
  float y2 = 0.0;

  Sound cNote;
  Sound wrong;


  Level2() {
    delay(1000);
    background = loadImage("bg/level2.png");
    
    starting = true;
    
    //buttons
    randomPosition(buttons);

    btn_map = new Button("button/map-up.png", "button/map-down.png", 128/2+(16), height-(134/2)-16);

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

    //sound
    cNote = new Sound("C note.wav", -10, false);
    wrong = new Sound("wrong.wav", -10, false);
  }
  //
  void show() {
    image(background, width/2, height/2);
    if (insideButton(btn_map) )
      isInside = true;
    else
      isInside = false;

    //if (correct)
    //  player.show(2, 500, 290, 3); //witch animation, positon x, position y, velocity;
    //else
    //  player.show(4, 500, 290, 3); //witch animation, positon x, position y, velocity;


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

  void events() {
    //Come back to the map
    if (btn_map.execute())
      PAGE = 4 ;

    player.moveRight(500, 2);
    
    //Conditions and actions for player
    if (mousePressed && !player.moving) {
      player.show(4, 500, 290, 3,false); //witch animation, positon x, position y, velocity;
    } else if (player.moving) {
      player.show(3, player.x, 290, 3,true); //witch animation, positon x, position y, velocity;
    } else if (correct && !player.moving) {
      player.show(2, 500, 290, 3,false);
    } else { 
      player.show(0, player.x, 290, 3, true);
    }

    if (correct && cont<5) {
      if (millis() > time + 1300.0) {
        cont++;
        randomPosition(buttons);
        correct = false;
      }
      buttonPosition(buttons);
    } else if (!correct) {
      buttonPosition(buttons);
    } else {
      cont = 0;
      ending = true;
      //PAGE = 4;
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
      //println(b[i]);
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
        if (mousePressed && mouseX>pos-75 && mouseX<pos+75 && mouseY>36 && mouseY<186 && !correct) {
          image(btn1On, pos, 111);
          correct = true;
          time = millis();
          cNote.playSound();

          //sp2.setToEnd();

          //gainValue.setValue(0.2);
          //sp1.setToLoopStart();
          //sp1.start(); // play the audio file
        } else if (!correct) {
          image(btn1Off, pos, 111);
        }
        inside(btn1Off, pos, 111);
        // println(pos);
        break;
      case 2:
        if (mousePressed && mouseX>pos-75 && mouseX<pos+75 && mouseY>36 && mouseY<186) {
          image(btn2On, pos, 111);
          wrong.playSound();
          //sp1.setToEnd();

          //gainValue.setValue(0.2);
          //sp2.setToLoopStart();
          //sp2.start(); // play the audio file
        } else if (!correct) {
          image(btn2Off, pos, 111);
        }
        inside(btn2Off, pos, 111);
        break;
      case 3:
        if (mousePressed && mouseX>pos-75 && mouseX<pos+75 && mouseY>36 && mouseY<186 && !correct) {
          image(btn3On, pos, 111);
          wrong.playSound();
          //sp1.setToEnd();

          //gainValue.setValue(0.2);
          //sp2.setToLoopStart();
          //sp2.start(); // play the audio file
        } else if (!correct) {
          image(btn3Off, pos, 111);
        }
        inside(btn3Off, pos, 111);
        break;
      }
    }
  }
}