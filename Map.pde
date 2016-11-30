class Map extends Input {
  private PImage background;
  private PImage btn_party;

  Map() {
    background = loadImage("map.png");
    btn_party = loadImage("btn-party.png");
  }

  void show() {
    image(background, width/2, height/2);
  }

  void events() {
    //PRESS PARTY
    if (clickRadial(btn_party,379, 352)) {
      PAGE = 3;
    }
<<<<<<< HEAD
    //PRESS PHASE 1
    if (mousePressed && mouseX>200+15 && mouseX<420-15 && mouseY>70+15 && mouseY<230-15) {
      if (frameCount % 60 <= 40)
        PAGE = 4;
    }
=======
    
    //DRAG BUTTON
    //drag(btn_party, 500,100);;
    
>>>>>>> a0e34c5d188e3543d1037499d559e788a5f2b090
  }
}