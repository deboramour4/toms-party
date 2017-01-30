//------------------------------------------------------------------------
//posições da tela onde devem ficar os botões

//canto superior esquerdo
//x, y = 128/2+(16),134/2+(16);

////canto superior direito
//x , y= width-(128/2)-16, 134/2+(16);

////canto inferior esquerdo
//x ,y = 128/2+(16), height-(134/2)-16;

////canto inferior direito
//x , y = width-(128/2)-16,height-(134/2)-16;

////canto inferior no meio
//x,y = width/2,height-(134/2)-16;
//------------------------------------------------------------------------

//import beads.*;
import ddf.minim.*;
import ddf.minim.ugens.*;

Minim minim;

Menu menu; //1
Credits credits; //2
Party party; //3
Map map; //4
CHouse chouse; //5
Level1 level1; //6
Level2 level2; //7
Level3 level3; //8
PImage mouse, hand;

int PAGE =1;

boolean click = false;
boolean isInside = false;



// ---------------------------- personagem
Moves player;
//-----------------------------

void setup() {
  size(1000, 563);   //Dimensões proporcionais às de smartphones em geral
  imageMode(CENTER);
  mouse = loadImage("cursor.png");
  hand = loadImage("hand.png");
  minim = new Minim(this);
  map = new Map();
  menu = new Menu();
  party = new Party();
  chouse = new CHouse();
  level1 = new Level1();
  level2 = new Level2();
  level3 = new Level3();
  credits = new Credits();

  // personagem
  player = new Moves(6);
  player.animations[0] = new Animation("animation/idle/do_idle (", 40, ").png", 2);
  player.animations[1] = new Animation("animation/sing/do_sing (", 34, ").png", 2);
  player.animations[2] = new Animation("animation/happy/do_happy (", 31, ").png", 2);
  player.animations[3] = new Animation("animation/walk/do_walk (", 30, ").png", 2);
  player.animations[4] = new Animation("animation/sad/do_sad (", 26, ").png", 2);
  player.animations[5] = new Animation("animation/look/do_look (", 24, ").png", 2);

  fill(0);
}

void draw() {

  switch(PAGE) {
  case 1:
    menu.show();
    text("X : "+mouseX+"\nY : "+mouseY, 20, 20);
    menu.events();
    break;

  case 2:
    credits.show();
    text("X : "+mouseX+"\nY : "+mouseY, 20, 20);
    credits.events();
    break;

  case 3:
    party.show();
    text("X : "+mouseX+"\nY : "+mouseY, 20, 20);
    party.events();
    break;

  case 4:
    map.show();
    text("X : "+mouseX+"\nY : "+mouseY, 20, 20);
    map.events();
    break;

  case 5:
    chouse.show();
    text("X : "+mouseX+"\nY : "+mouseY, 20, 20);
    chouse.events();
    break;

  case 6:
    level1.show();
    text("X : "+mouseX+"\nY : "+mouseY, 20, 20);
    level1.events();
    break;

  case 7:
    level2.show();
    text("X : "+mouseX+"\nY : "+mouseY, 20, 20);
    level2.events();
    break;

  case 8:
    level3.show();
    text("X : "+mouseX+"\nY : "+mouseY, 20, 20);
    level3.events();
    break;
  }
  noCursor();
  imageMode(CORNER);
  if (isInside)
    image(hand, mouseX, mouseY);
  else
    image(mouse, mouseX, mouseY);
  imageMode(CENTER);
}