class Phase1Page1 {
  PImage background;
  PImage mDo, mDoHappy;
  PImage btn1Off, btn2Off, btn3Off, btn1On, btn2On, btn3On ;

  int[] buttons = new int[3];

  float time = 0.0;

  boolean valido = false;
  boolean primeira = false;
  boolean correct = false;

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


  Phase1Page1() {
    background = loadImage("tela1.png");
    //monster
    mDo = loadImage("dó.png");
    mDoHappy = loadImage("dó2.png");

    //buttons
    randomPosition(buttons);


    btn1Off = loadImage("btn1Off.png");
    btn2Off = loadImage("btn2Off.png");
    btn3Off = loadImage("btn3Off.png");
    btn1On = loadImage("btn1On.png");
    btn2On = loadImage("btn2On.png");
    btn3On = loadImage("btn3On.png");

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
  }

  void events() {

    //monster interaction
    if (mousePressed && mouseX>430 && mouseX<570 && mouseY>410 && mouseY<540) {
      image(mDoHappy, width/2, 470);
    } else {
      image(mDo, width/2, 470);
    }

    if (correct) {
      if (millis() > time + 1000.0) {
        randomPosition(buttons);
        correct = false;
      }
      buttonPosition(buttons);
    }else{
      buttonPosition(buttons);
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
    int i = 0;
    int pos = 0;
    for (i = 0; i<b.length; i++) {
      pos = (i+1)*250;
      switch (b[i]) {
      case 1:
        if (mousePressed && mouseX>pos-75 && mouseX<pos+75 && mouseY>36 && mouseY<186) {
          image(btn1On, pos, 111);
          correct = true;
          time = millis();
          
          sp2.setToEnd();

          gainValue.setValue(0.2);
          sp1.setToLoopStart();
          sp1.start(); // play the audio file
        } else {
          image(btn1Off, pos, 111);
        }
        break;
      case 2:
        if (mousePressed && mouseX>pos-75 && mouseX<pos+75 && mouseY>36 && mouseY<186) {
          image(btn2On, pos, 111);

          //sp1.setToEnd();

          gainValue.setValue(0.2);
          sp2.setToLoopStart();
          sp2.start(); // play the audio file
        } else {
          image(btn2Off, pos, 111);
        }
        break;
      case 3:
        if (mousePressed && mouseX>pos-75 && mouseX<pos+75 && mouseY>36 && mouseY<186) {
          image(btn3On, pos, 111);

          //sp1.setToEnd();

          gainValue.setValue(0.2);
          sp2.setToLoopStart();
          sp2.start(); // play the audio file
        } else {
          image(btn3Off, pos, 111);
        }
        break;
      }
    }
  }
}