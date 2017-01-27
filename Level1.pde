class Level1 extends Input{
  Moves player;
  PImage background;
  PImage mDo, mDoHappy;
  PImage btn1Off, btn2Off, btn3Off, btn1On, btn2On, btn3On ;
  PImage btn_map;

  int[] buttons = new int[3];
  int cont = 0;

  float time = 0.0;

  boolean valido = false;
  boolean starting = false;
  boolean ending = false;
  boolean correct = false;

  
  float x2 = 0.0;       
  float y2 = 0.0;

  AudioContext ac;
  // this will hold the path to our audio file
  String cNoteFile;
  String dNoteFile;
  String eNoteFile;
  String wrongFile;

  // the SamplePlayer class will play the audio file
  SamplePlayer sp1;
  SamplePlayer sp2;

  Gain g;
  Glide gainValue;


  Level1() {
    delay(1000);
    background = loadImage("bg/level1.png");
    
    player = new Moves(500, 400,2);
    player.animations[0] = new Animation("dó",1,".png");
    player.animations[1] = new Animation("sprite", 4, ".png");
    //player
    mDoHappy = loadImage("dó2.png");

    //buttons
    randomPosition(buttons);
  
    btn_map = loadImage("button/btn-map.png");

    btn1Off = loadImage("button/btn1Off.png");
    btn2Off = loadImage("button/btn2Off.png");
    btn3Off = loadImage("button/btn3Off.png");
    btn1On = loadImage("button/btn1On.png");
    btn2On = loadImage("button/btn2On.png");
    btn3On = loadImage("button/btn3On.png");

    //sound
    ac = new AudioContext(); 
    cNoteFile = sketchPath("") +"data/C note.wav";
    wrongFile = sketchPath("") +"data/wrong.wav";
    eNoteFile = sketchPath("") +"data/E note.wav";
    try {
      sp1 = new SamplePlayer(ac, new Sample(cNoteFile));
      sp2 = new SamplePlayer(ac, new Sample(wrongFile));
    }
    catch(Exception e) {
      println("Exception while attempting to load sample!");
      e.printStackTrace(); // print description of the error
      exit(); // and exit the program
    }
    sp1.setKillOnEnd(false);
    sp2.setKillOnEnd(false);

    gainValue = new Glide(ac, 0.0, 20);
    g = new Gain(ac, 1, gainValue);
    g.addInput(sp1); // connect the SamplePlayer to the Gain
    g.addInput(sp2);

    ac.out.addInput(g); // connect the Gain to the AudioContext
    ac.start(); // begin audio processing
  }


  void show() {
    image(background, width/2, height/2);
  
  player.show();
    
    //button map
    image(btn_map, 69, 502);
  }

  void events() {
    if (clickRadial(btn_map, 69, 502))
      PAGE = 4 ;
      

    //monster interaction
    if (mousePressed && mouseX>430 && mouseX<570 && mouseY>410 && mouseY<540) {
      image(mDoHappy, width/2, 470);
    } else {
      //image(mDo, width/2, 470);
      player.animManager = 0;
    }

    if (correct && cont<4) {
      //cont++;
      if (millis() > time + 300.0) {
        cont++;
        randomPosition(buttons);
        correct = false;
      }
      buttonPosition(buttons);
    }else if(!correct){
      buttonPosition(buttons);
    }else{
      cont = 0;
      PAGE = 3;
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
      println(b[i]);
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
          
          sp2.setToEnd();

          gainValue.setValue(0.2);
          sp1.setToLoopStart();
          sp1.start(); // play the audio file
        } else if(!correct){
          image(btn1Off, pos, 111);
        }
        inside(btn1Off, pos,111);
        println(pos);
        break;
      case 2:
        if (mousePressed && mouseX>pos-75 && mouseX<pos+75 && mouseY>36 && mouseY<186) {
          image(btn2On, pos, 111);

          //sp1.setToEnd();

          gainValue.setValue(0.2);
          sp2.setToLoopStart();
          sp2.start(); // play the audio file
        } else if(!correct){
          image(btn2Off, pos, 111);
        }
        inside(btn2Off, pos,111);
        break;
      case 3:
        if (mousePressed && mouseX>pos-75 && mouseX<pos+75 && mouseY>36 && mouseY<186 && !correct) {
          image(btn3On, pos, 111);

          //sp1.setToEnd();

          gainValue.setValue(0.2);
          sp2.setToLoopStart();
          sp2.start(); // play the audio file
        } else if(!correct){
          image(btn3Off, pos, 111);
        }
        inside(btn3Off, pos,111);
        break;
      }
    }
  }
}