<<<<<<< HEAD:tomsParty.pde
import beads.*;

Map map;
Menu menu;
Party party;
Phase1Page1 phase1;
=======
Map map; //2
Menu menu; //1
Party party; //3
Level1 level1; //4
>>>>>>> a0e34c5d188e3543d1037499d559e788a5f2b090:tomsParty.pde

int PAGE =1;

void setup() {
  size(1000, 563);   //Dimensões proporcionais às de smartphones em geral
  imageMode(CENTER);
  map = new Map();
  menu = new Menu();
  party = new Party();
<<<<<<< HEAD:tomsParty.pde
  phase1 = new Phase1Page1();
=======
  level1 = new Level1();
>>>>>>> a0e34c5d188e3543d1037499d559e788a5f2b090:tomsParty.pde
}

void draw() {
  switch(PAGE) {
  case 1:
    menu.show();
    menu.events();
    break;

  case 2:
    map.show();
    map.events();
    break;

  case 3:
    party.show();
    party.events();
    break;
<<<<<<< HEAD:tomsParty.pde
    
  case 4:
    phase1.show();
    phase1.events();
=======

  case 4:
    level1.show();
    level1.events();
>>>>>>> a0e34c5d188e3543d1037499d559e788a5f2b090:tomsParty.pde
    break;
  }
}