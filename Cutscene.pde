class Cutscene{
  Animation scene1;
  
  Cutscene(){
    scene1 = new Animation("animation/Cutscene/Cutscene1 (",112,").png",3);
  }
  
  void show (){
    scene1.display2(width/2,height/2,5);
  }
  
  void events (){
    if(scene1.frame >= scene1.imageCount){
      PAGE = 4;
    }
  }
}