class Cutscene extends Input {
  Animation scene1;
  float inicio;
  Button btn_right;

  Cutscene() {
    scene1 = new Animation("animation/Cutscene/Cutscene1 (", 112, ").png", 3);
    btn_right = new Button("button/right-up.png", "button/right-down.png", width-(128/2)-16, height-(134/2)-16);
    inicio = millis();
  }

  void show () {
    scene1.display2(width/2, height/2, 5);
    
    if (btn_right.execute()) {
      sCutscene.stopSound();
      sMap.playSound();
      PAGE = 4;
    }
    
    if (insideButton(btn_right))
      isInside = true;
    else
      isInside = false;
      
   println("inicio: "+inicio+" | milis: "+millis());
  }

  void events () {
    if (scene1.animRunning == false) {
      sCutscene.stopSound();
      sMap.playSound();
      PAGE = 4;
    }

    
  }
}