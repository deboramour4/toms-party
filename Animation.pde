class Animation {
  PImage[] images;
  int imageCount;
  int frame;
  int duration;
  
  //Set the prefix of the images, its number and the extencion
  Animation(String imagePrefix, int count, String extention) {
    imageCount = count;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into four digits
      String filename = imagePrefix + nf(i, 1) + extention;
      images[i] = loadImage(filename);
    }
  }

  void display(float xpos, float ypos, int duration) {
    if (frameCount % duration == 0) {
      frame = (frame+1) % imageCount;
    }
    image(images[frame], xpos, ypos);
  }

  int getWidth() {
    return images[0].width;
  }
}