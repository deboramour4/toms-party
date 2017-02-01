class Sound {
  AudioPlayer sound;
  String file;
  Boolean onLoop = false;
  int nLoop=0;
  int time;
  Gain gain = new Gain(0.f);

  //Constructor for a background sound
  Sound(String fileName, float gainValue, Boolean loop) {
    file = fileName;
    onLoop = loop;
    sound = minim.loadFile(file);
    sound.setGain(gainValue);
  }

  void playLoop() {
    sound.play();
    if (onLoop) {
      if (millis()-time>sound.length()) {
        sound.rewind();
        time=millis();
      }
    }
  }

  void playSound() {
    sound.play();
    sound.rewind();
  }

  void stopSound() {
    //sound.mute();
    sound.pause();
  }

  void volume(float vol) {
    sound.setGain(vol);
  }
}