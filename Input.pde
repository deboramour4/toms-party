//this class will recieve all kind of users input, and handle it.
//the intention is make the it easier to use in the principal classes.

class Input{
   private float x; //position x of the element
   private float y; //position y of the element
   private float w; //width the element
   private float h; //height of the element
   
   Input(){
     x = 0;
     y = 0;
     w = 0;
     h = 0;
   }
   
   //this function returns true if the mouse was clicked in a determinated local of the screen
   // and false if not.
   boolean click(float x, float y, float w, float h){
     if(mousePressed && mouseX>x && mouseX<x+w && mouseY>y && mouseY<y+h){
       return true;
     } else {
       return false;
     }
   }
   
   //this function returns true if the mouse was inside a determinated local of the screen
   // and false if not.
   boolean inside(float x, float y, float w, float h){
     if(mouseX>x && mouseX<x+w && mouseY>y && mouseY<y+h){
       return true;
     } else {
       return false;
     }
   }
   
   //this function returns true while the mouse is being dragged across the screen
   //and false if not.
   /*boolean drag(float x, float y, float w, float h){
     if(mousePressed && mouseX>x && mouseX<x+w && mouseY>y && mouseY<y+h){
       return true;
     } else {
       return false;
     }
   }*/
}