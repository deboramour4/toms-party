class Sound {
  AudioContext ac;
  // this will hold the path to our audio file
  String sampleName;

  // the SamplePlayer class will play the audio file
  SamplePlayer sp1;

  Gain g;
  Glide gainValue;

  //constructor
  Sound() {
    ac = new AudioContext(); 
    sampleName = sketchPath("") +"data/C note.wav";
    try {
      sp1 = new SamplePlayer(ac, new Sample(sampleName));
    }
    catch(Exception e) {
      println("Exception while attempting to load sample!");
      e.printStackTrace(); // print description of the error
      exit(); // and exit the program
    }
    sp1.setKillOnEnd(false);

    gainValue = new Glide(ac, 0.0, 20);
    g = new Gain(ac, 1, gainValue);
    g.addInput(sp1); // connect the SamplePlayer to the Gain
    ac.out.addInput(g); // connect the Gain to the AudioContext
    ac.start(); // begin audio processing
  }
}