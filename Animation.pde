class Animation {
  PImage[] images;
  int imageCount;
  int frame = 0;
  int duration;
  boolean animRunning = false;

  //Set the prefix of the images, its number and the extencion
  Animation(String imagePrefix, int count, String extention, int zeros) {
    imageCount = count;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into four digits
      String filename = imagePrefix + nf(i, zeros) + extention;
      images[i] = loadImage(filename);
    }
  }

  void display(float xpos, float ypos, float duration) {
    if (frameCount % duration == 0) {
      frame = (frame+1) % imageCount;
    }
    image(images[frame], xpos, ypos);
  }

  void display2(float xpos, float ypos, float duration) {
    animRunning = true;
    if ( frame<imageCount-1) {
      animRunning = true;
      if ( frameCount % duration == 0 ) {
        frame = (frame+1);
        println("frame:"+frame+", imageCount:"+imageCount);
      }
    } else {
      animRunning = false;
    }

    println("animação" + animRunning);
    image(images[frame], xpos, ypos);
  }

  int getWidth() {
    return images[0].width;
  }
}