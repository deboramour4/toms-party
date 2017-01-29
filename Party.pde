class Party extends Input {
  private PImage background;
  Button btn_right;

  Party() {
    background = loadImage("bg/party.png");
    btn_right = new Button("button/right-up.png", "button/right-down.png", 945, 500);
  }

  void show() {
    image(background, width/2, height/2);
    if (insideButton(btn_right))
      isInside = true;
    else
      isInside = false;
}

void events() {
  //PRESS NEXT
  if (btn_right.execute()) {
    PAGE = 3;
    delay(400);
  }
}
}