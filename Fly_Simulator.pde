int num=20000;
public Fly fly[] = new Fly[num];
int gen=0;
boolean sel=true;
int numKids1=0;
int numKids2=0;
int whsmma=0;
boolean wsm=false;
int whlama=0;
boolean wlm=false;
int resmma=0;
boolean rsm=false;
int relama=0;
boolean rlm=false;
int whsmfe=0;
boolean wsf=false;
int whlafe=0;
boolean wlf=false;
int resmfe=0;
boolean rsf=false;
int relafe=0;
boolean rlf=false;
int whsmto=0;
int whlato=0;
int resmto=0;
int relato=0;
int males=0;
int females=0;
int total=0;
boolean bool[] = new boolean[16];
boolean bool2[] = new boolean[8];
boolean wildDom1=true; //color
boolean wildDom2=true; //size
boolean homoDead1=false; //color
boolean homoDead2=false; //size
boolean inter1=false; //color
boolean inter2=false; //size
boolean sexlink1=true; //color
boolean sexlink2=false; //size

void setup() {
  fullScreen();
  for (int i=0; i<10; i++) {
    bool[i]=true;
  }
  for(int i=10; i<16; i++){
    bool[i]=false;
  }
  for(int i=0; i<8; i++){
    bool2[i]=false;
  }
  textAlign(CENTER, CENTER);
  for (int i=0; i<num; i++) {
    fly[i] = new Fly(true, true, true, true);
  }
  fly[0].wild1=true; //color fly1
  fly[0].wild2=false; //color fly1
  fly[0].wild3=true; //size fly1
  fly[0].wild4=false; //size fly1
  fly[0].male=false;

  fly[1].wild1=true; //color fly2
  fly[1].wild2=false; //color fly2
  fly[1].wild3=true; //size fly2
  fly[1].wild4=false; //size fly2
  fly[1].male=true;
}

void draw() {
  background(0);
  if (sel) {
    selection();
  } else if (gen==0) {
    update();
    cursor(ARROW);
    for (int i=0; i<2; i++) {
      fly[i].move();
      fly[i].show();
      fly[i].upd();
    }
    display();
  } else if (gen==1) {
    update();
    cursor(ARROW);
    for (int i=2; i<numKids1; i++) {
      fly[i].move();
      fly[i].show();
      fly[i].upd();
      //println(fly[i].wild1 + " " + fly[i].wild2 + " " + fly[i].wild3 + " " + fly[i].wild4 + " ");
    }
    display();
  } else {
    update();
    cursor(ARROW);
    for (int i=numKids1; i<numKids2+numKids1; i++) {
      fly[i].move();
      fly[i].show();
      fly[i].upd();
      //println(fly[i].wild1 + " " + fly[i].wild2 + " " + fly[i].wild3 + " " + fly[i].wild4 + " ");
    }
    display();
  }
}

void breed() {
  if (gen==0) {
    numKids1=round(random(9000, 10000));
    for (int i=2; i<numKids1; i++) {
      boolean type[] = new boolean[4];
      int chance = round(random(0, 1));
      if (chance==0) {
        type[0]=fly[0].wild1;
      } else {
        type[0]=fly[0].wild2;
      }
      chance = round(random(0, 1));
      if (chance==0) {
        type[1]=fly[1].wild1;
      } else {
        type[1]=fly[1].wild2;
      }
      chance = round(random(0, 1));
      if (chance==0) {
        type[2]=fly[0].wild3;
      } else {
        type[2]=fly[0].wild4;
      }
      chance = round(random(0, 1));
      if (chance==0) {
        type[3]=fly[1].wild3;
      } else {
        type[3]=fly[1].wild4;
      }
      chance=round(random(0, 1));
      if (chance==0) {
        fly[i].male=true;
        if (sexlink1) {
          type[1]=type[0];
        }
        if (sexlink2) {
          type[3]=type[2];
        }
      } else {
        fly[i].male=false;
      }
      fly[i].setAlleles(type[0], type[1], type[2], type[3]);
    }
  } else if (gen==2) {
    numKids2=round(random(9000, 10000));
    for (int i=numKids1; i<numKids2+numKids1; i++) {
      boolean type[] = new boolean[4];
      int chance = round(random(0, 1));
      if (chance==0) {
        type[0]=fly[2].wild1;
      } else {
        type[0]=fly[2].wild2;
      }
      chance = round(random(0, 1));
      if (chance==0) {
        type[1]=fly[3].wild1;
      } else {
        type[1]=fly[3].wild2;
      }
      chance = round(random(0, 1));
      if (chance==0) {
        type[2]=fly[2].wild3;
      } else {
        type[2]=fly[2].wild4;
      }
      chance = round(random(0, 1));
      if (chance==0) {
        type[3]=fly[3].wild3;
      } else {
        type[3]=fly[3].wild4;
      }
      chance=round(random(0, 1));
      if (chance==0) {
        fly[i].male=true;
        if (sexlink1) {
          type[1]=type[0];
        }
        if (sexlink2) {
          type[3]=type[2];
        }
      } else {
        fly[i].male=false;
      }
      fly[i].setAlleles(type[0], type[1], type[2], type[3]);
    }
  } else {
    gen=2;
  }
}

void display() {
  fill(255, 255, 255, 220);
  rect(width/2-250, height/2-100, 500, 200);
  fill(0);
  textSize(15);
  int offset=20;
  text("Males", width/2-250+10, height/2-100, 150, 30);
  text("White & Small: " + whsmma, width/2-250+10, height/2-100+10+offset, 150, 30);
  text("White & Large: " + whlama, width/2-250+10, height/2-100+40+offset, 150, 30);
  text("Red & Small: " + resmma, width/2-250+10, height/2-100+70+offset, 150, 30);
  text("Red & Large: " + relama, width/2-250+10, height/2-100+100+offset, 150, 30);

  text("Females", width/2-250+170, height/2-100, 150, 30);
  text("White & Small: " + whsmfe, width/2-250+170, height/2-100+10+offset, 150, 30);
  text("White & Large: " + relafe, width/2-250+170, height/2-100+40+offset, 150, 30);
  text("Red & Small: " + resmfe, width/2-250+170, height/2-100+70+offset, 150, 30);
  text("Red & Large: " + relafe, width/2-250+170, height/2-100+100+offset, 150, 30);

  text("Total", width/2-250+340, height/2-100, 150, 30);
  text("White & Small: " + whsmto, width/2-250+340, height/2-100+10+offset, 150, 30);
  text("White & Large: " + whlato, width/2-250+340, height/2-100+40+offset, 150, 30);
  text("Red & Small: " + resmto, width/2-250+340, height/2-100+70+offset, 150, 30);
  text("Red & Large: " + relato, width/2-250+340, height/2-100+100+offset, 150, 30);

  text("Total: " + males, width/2-250+10, height/2+20, 150, 100);
  text("Total: " + females, width/2-250+170, height/2+20, 150, 100);
  text("Total: " + total, width/2-250+340, height/2+20, 150, 100);

  strokeWeight(1);
  stroke(0);
  line(width/2-250+165, height/2-100, width/2-250+165, height/2+100);
  line(width/2-250+335, height/2-100, width/2-250+335, height/2+100);
  line(width/2-250, height/2-100+30, width/2+250, height/2-100+30);
  line(width/2-250, height/2+55, width/2+250, height/2+55);
}

void update() {
  if(whsmma>0){
    bool2[4]=true;
    bool2[5]=false;
    bool2[6]=false;
    bool2[7]=false;
    wsm=true;
  } else {
    wsm=false;
  }
  if(whlama>0){
    bool2[4]=false;
    bool2[5]=true;
    bool2[6]=false;
    bool2[7]=false;
    wlm=true;
  } else {
    wlm=false;
  }
  if(resmma>0){
    bool2[4]=false;
    bool2[5]=false;
    bool2[6]=true;
    bool2[7]=false;
    rsm=true;
  } else {
    rsm=false;
  }
  if(relama>0){
    bool2[4]=false;
    bool2[5]=false;
    bool2[6]=false;
    bool2[7]=true;
    rlm=true;
  } else {
    rlm=false;
  }
  
  if(whsmfe>0){
    bool2[0]=true;
    bool2[1]=false;
    bool2[2]=false;
    bool2[3]=false;
    wsf=true;
  } else {
    wsf=false;
  }
  if(whlafe>0){
    bool2[0]=false;
    bool2[1]=true;
    bool2[2]=false;
    bool2[3]=false;
    wlf=true;
  } else {
    wlf=false;
  }
  if(resmfe>0){
    bool2[0]=false;
    bool2[1]=false;
    bool2[2]=true;
    bool2[3]=false;
    rsf=true;
  } else {
    rsf=false;
  }
  if(relafe>0){
    bool2[0]=false;
    bool2[1]=false;
    bool2[2]=false;
    bool2[3]=true;
    rlf=true;
  } else {
    rlf=false;
  }
  whsmma=0;
  whlama=0;
  resmma=0;
  relama=0;
  whsmfe=0;
  whlafe=0;
  resmfe=0;
  relafe=0;
  whsmto=0;
  whlato=0;
  resmto=0;
  relato=0;
  males=0;
  females=0;
  total=0;
}

void selection() {
  stroke(255);
  strokeWeight(1);
  fill(255);
  if (gen==0) {
    if(bool[14]){
      bool[5]=bool[4];
    }
    if(bool[15]){
      bool[7]=bool[6];
    }
    boolean hand=false;
    int xoff=0;
    int yoff=40;
    fill(255);
    textSize(50);
    text("Mother", 0, 20, width/2, 80);
    textSize(30);
    text("Color", 180+xoff, 90+yoff, 180, 40);
    text("Size", 400+xoff, 90+yoff, 180, 40);
    textSize(25);
    text("Allele 1", 50+xoff, 185+yoff, 100, 30);
    text("Allele 2", 50+xoff, 300+yoff, 100, 30);
    textSize(35);
    text("W", 180+xoff, 160+yoff, 80, 80);
    text("W", 180+xoff, 275+yoff, 80, 80);
    text("R", 280+xoff, 160+yoff, 80, 80);
    text("R", 280+xoff, 275+yoff, 80, 80);
    text("S", 400+xoff, 160+yoff, 80, 80);
    text("S", 400+xoff, 275+yoff, 80, 80);
    text("B", 500+xoff, 160+yoff, 80, 80);
    text("B", 500+xoff, 275+yoff, 80, 80);

    noFill();
    stroke(255);
    strokeWeight(2);
    if (mouseX>180+xoff && mouseX<180+xoff+80 && mouseY>160+yoff && mouseY<160+yoff+80) {
      hand=true;
      if (mousePressed) {
        bool[0]=true;
      }
    }
    if (bool[0]) {
      fill(255, 255, 255, 125);
    } else {
      noFill();
    }
    rect(180+xoff, 160+yoff, 80, 80);
    noFill();
    if (mouseX>180+xoff && mouseX<180+xoff+80 && mouseY>275+yoff && mouseY<275+yoff+80) {
      hand=true;
      if (mousePressed) {
        bool[1]=true;
      }
    }
    if (bool[1]) {
      fill(255, 255, 255, 125);
    } else {
      noFill();
    }
    rect(180+xoff, 275+yoff, 80, 80);
    if (mouseX>280+xoff && mouseX<280+xoff+80 && mouseY>160+yoff && mouseY<160+yoff+80) {
      hand=true;
      if (mousePressed) {
        bool[0]=false;
      }
    }
    if (!bool[0]) {
      fill(255, 255, 255, 125);
    } else {
      noFill();
    }
    rect(280+xoff, 160+yoff, 80, 80);
    if (mouseX>280+xoff && mouseX<280+xoff+80 && mouseY>275+yoff && mouseY<275+yoff+80) {
      hand=true;
      if (mousePressed) {
        bool[1]=false;
      }
    }
    if (!bool[1]) {
      fill(255, 255, 255, 125);
    } else {
      noFill();
    }
    rect(280+xoff, 275+yoff, 80, 80);
    if (mouseX>400+xoff && mouseX<400+xoff+80 && mouseY>160+yoff && mouseY<160+yoff+80) {
      hand=true;
      if (mousePressed) {
        bool[2]=true;
      }
    }
    if (bool[2]) {
      fill(255, 255, 255, 125);
    } else {
      noFill();
    }
    rect(400+xoff, 160+yoff, 80, 80);
    if (mouseX>400+xoff && mouseX<400+xoff+80 && mouseY>275+yoff && mouseY<275+yoff+80) {
      hand=true;
      if (mousePressed) {
        bool[3]=true;
      }
    }
    if (bool[3]) {
      fill(255, 255, 255, 125);
    } else {
      noFill();
    }
    rect(400+xoff, 275+yoff, 80, 80);
    if (mouseX>500+xoff && mouseX<500+xoff+80 && mouseY>160+yoff && mouseY<160+yoff+80) {
      hand=true;
      if (mousePressed) {
        bool[2]=false;
      }
    }
    if (!bool[2]) {
      fill(255, 255, 255, 125);
    } else {
      noFill();
    }
    rect(500+xoff, 160+yoff, 80, 80);
    if (mouseX>500+xoff && mouseX<500+xoff+80 && mouseY>275+yoff && mouseY<275+yoff+80) {
      hand=true;
      if (mousePressed) {
        bool[3]=false;
      }
    }
    if (!bool[3]) {
      fill(255, 255, 255, 125);
    } else {
      noFill();
    }
    rect(500+xoff, 275+yoff, 80, 80);

    xoff=width/2;

    fill(255);
    textSize(50);
    text("Father", width/2, 20, width/2, 80);
    textSize(30);
    text("Color", 180+xoff, 90+yoff, 180, 40);
    text("Size", 400+xoff, 90+yoff, 180, 40);
    textSize(25);
    text("Allele 1", 50+xoff, 185+yoff, 100, 30);
    text("Allele 2", 50+xoff, 300+yoff, 100, 30);
    textSize(35);
    text("W", 180+xoff, 160+yoff, 80, 80);
    text("W", 180+xoff, 275+yoff, 80, 80);
    text("R", 280+xoff, 160+yoff, 80, 80);
    text("R", 280+xoff, 275+yoff, 80, 80);
    text("S", 400+xoff, 160+yoff, 80, 80);
    text("S", 400+xoff, 275+yoff, 80, 80);
    text("B", 500+xoff, 160+yoff, 80, 80);
    text("B", 500+xoff, 275+yoff, 80, 80);

    noFill();
    stroke(255);
    strokeWeight(2);
    if (mouseX>180+xoff && mouseX<180+xoff+80 && mouseY>160+yoff && mouseY<160+yoff+80) {
      hand=true;
      if (mousePressed) {
        bool[4]=true;
      }
    }
    if (bool[4]) {
      fill(255, 255, 255, 125);
    } else {
      noFill();
    }
    rect(180+xoff, 160+yoff, 80, 80);
    noFill();
    if (mouseX>180+xoff && mouseX<180+xoff+80 && mouseY>275+yoff && mouseY<275+yoff+80) {
      hand=true;
      if (mousePressed) {
        bool[5]=true;
      }
    }
    if (bool[5]) {
      fill(255, 255, 255, 125);
    } else {
      noFill();
    }
    rect(180+xoff, 275+yoff, 80, 80);
    if (mouseX>280+xoff && mouseX<280+xoff+80 && mouseY>160+yoff && mouseY<160+yoff+80) {
      hand=true;
      if (mousePressed) {
        bool[4]=false;
      }
    }
    if (!bool[4]) {
      fill(255, 255, 255, 125);
    } else {
      noFill();
    }
    rect(280+xoff, 160+yoff, 80, 80);
    if (mouseX>280+xoff && mouseX<280+xoff+80 && mouseY>275+yoff && mouseY<275+yoff+80) {
      hand=true;
      if (mousePressed) {
        bool[5]=false;
      }
    }
    if (!bool[5]) {
      fill(255, 255, 255, 125);
    } else {
      noFill();
    }
    rect(280+xoff, 275+yoff, 80, 80);
    if (mouseX>400+xoff && mouseX<400+xoff+80 && mouseY>160+yoff && mouseY<160+yoff+80) {
      hand=true;
      if (mousePressed) {
        bool[6]=true;
      }
    }
    if (bool[6]) {
      fill(255, 255, 255, 125);
    } else {
      noFill();
    }
    rect(400+xoff, 160+yoff, 80, 80);
    if (mouseX>400+xoff && mouseX<400+xoff+80 && mouseY>275+yoff && mouseY<275+yoff+80) {
      hand=true;
      if (mousePressed) {
        bool[7]=true;
      }
    }
    if (bool[7]) {
      fill(255, 255, 255, 125);
    } else {
      noFill();
    }
    rect(400+xoff, 275+yoff, 80, 80);
    if (mouseX>500+xoff && mouseX<500+xoff+80 && mouseY>160+yoff && mouseY<160+yoff+80) {
      hand=true;
      if (mousePressed) {
        bool[6]=false;
      }
    }
    if (!bool[6]) {
      fill(255, 255, 255, 125);
    } else {
      noFill();
    }
    rect(500+xoff, 160+yoff, 80, 80);
    if (mouseX>500+xoff && mouseX<500+xoff+80 && mouseY>275+yoff && mouseY<275+yoff+80) {
      hand=true;
      if (mousePressed) {
        bool[7]=false;
      }
    }
    if (!bool[7]) {
      fill(255, 255, 255, 125);
    } else {
      noFill();
    }
    rect(500+xoff, 275+yoff, 80, 80);


    xoff=-50;
    yoff=350;
    fill(255);
    textSize(20);
    text("Color", 50+xoff, 185+yoff, 100, 30);
    text("Size", 50+xoff, 300+yoff, 100, 30);
    textSize(15);
    text("White", 160+xoff, 160+yoff, 80, 80);
    text("Small", 160+xoff, 275+yoff, 80, 80);
    text("Red", 260+xoff, 160+yoff, 80, 80);
    text("Big", 260+xoff, 275+yoff, 80, 80);

    noFill();
    stroke(255);
    strokeWeight(2);
    if (mouseX>160+xoff && mouseX<160+xoff+80 && mouseY>160+yoff && mouseY<160+yoff+80) {
      hand=true;
      if (mousePressed) {
        bool[8]=true;
      }
    }
    if (bool[8]) {
      fill(255, 255, 255, 125);
    } else {
      noFill();
    }
    rect(160+xoff, 160+yoff, 80, 80);
    if (mouseX>160+xoff && mouseX<160+xoff+80 && mouseY>275+yoff && mouseY<275+yoff+80) {
      hand=true;
      if (mousePressed) {
        bool[9]=true;
      }
    }
    if (bool[9]) {
      fill(255, 255, 255, 125);
    } else {
      noFill();
    }
    rect(160+xoff, 275+yoff, 80, 80);
    if (mouseX>260+xoff && mouseX<260+xoff+80 && mouseY>160+yoff && mouseY<160+yoff+80) {
      hand=true;
      if (mousePressed) {
        bool[8]=false;
      }
    }
    if (!bool[8]) {
      fill(255, 255, 255, 125);
    } else {
      noFill();
    }
    rect(260+xoff, 160+yoff, 80, 80);
    if (mouseX>260+xoff && mouseX<260+xoff+80 && mouseY>275+yoff && mouseY<275+yoff+80) {
      hand=true;
      if (mousePressed) {
        bool[9]=false;
      }
    }
    if (!bool[9]) {
      fill(255, 255, 255, 125);
    } else {
      noFill();
    }
    rect(260+xoff, 275+yoff, 80, 80);

    xoff=width/4-45;
    yoff=350;
    fill(255);
    textSize(20);
    text("Color", 50+xoff, 185+yoff, 100, 30);
    text("Size", 50+xoff, 300+yoff, 100, 30);
    textSize(15);
    text("Yes", 160+xoff, 160+yoff, 80, 80);
    text("Yes", 160+xoff, 275+yoff, 80, 80);
    text("No", 260+xoff, 160+yoff, 80, 80);
    text("No", 260+xoff, 275+yoff, 80, 80);

    noFill();
    stroke(255);
    strokeWeight(2);
    if (mouseX>160+xoff && mouseX<160+xoff+80 && mouseY>160+yoff && mouseY<160+yoff+80) {
      hand=true;
      if (mousePressed) {
        bool[10]=true;
      }
    }
    if (bool[10]) {
      fill(255, 255, 255, 125);
    } else {
      noFill();
    }
    rect(160+xoff, 160+yoff, 80, 80);
    if (mouseX>160+xoff && mouseX<160+xoff+80 && mouseY>275+yoff && mouseY<275+yoff+80) {
      hand=true;
      if (mousePressed) {
        bool[11]=true;
      }
    }
    if (bool[11]) {
      fill(255, 255, 255, 125);
    } else {
      noFill();
    }
    rect(160+xoff, 275+yoff, 80, 80);
    if (mouseX>260+xoff && mouseX<260+xoff+80 && mouseY>160+yoff && mouseY<160+yoff+80) {
      hand=true;
      if (mousePressed) {
        bool[10]=false;
      }
    }
    if (!bool[10]) {
      fill(255, 255, 255, 125);
    } else {
      noFill();
    }
    rect(260+xoff, 160+yoff, 80, 80);
    if (mouseX>260+xoff && mouseX<260+xoff+80 && mouseY>275+yoff && mouseY<275+yoff+80) {
      hand=true;
      if (mousePressed) {
        bool[11]=false;
      }
    }
    if (!bool[11]) {
      fill(255, 255, 255, 125);
    } else {
      noFill();
    }
    rect(260+xoff, 275+yoff, 80, 80);

    xoff=width/2-45;
    yoff=350;
    fill(255);
    textSize(20);
    text("Color", 50+xoff, 185+yoff, 100, 30);
    text("Size", 50+xoff, 300+yoff, 100, 30);
    textSize(15);
    text("Yes", 160+xoff, 160+yoff, 80, 80);
    text("Yes", 160+xoff, 275+yoff, 80, 80);
    text("No", 260+xoff, 160+yoff, 80, 80);
    text("No", 260+xoff, 275+yoff, 80, 80);

    noFill();
    stroke(255);
    strokeWeight(2);
    if (mouseX>160+xoff && mouseX<160+xoff+80 && mouseY>160+yoff && mouseY<160+yoff+80) {
      hand=true;
      if (mousePressed) {
        bool[12]=true;
      }
    }
    if (bool[12]) {
      fill(255, 255, 255, 125);
    } else {
      noFill();
    }
    rect(160+xoff, 160+yoff, 80, 80);
    if (mouseX>160+xoff && mouseX<160+xoff+80 && mouseY>275+yoff && mouseY<275+yoff+80) {
      hand=true;
      if (mousePressed) {
        bool[13]=true;
      }
    }
    if (bool[13]) {
      fill(255, 255, 255, 125);
    } else {
      noFill();
    }
    rect(160+xoff, 275+yoff, 80, 80);
    if (mouseX>260+xoff && mouseX<260+xoff+80 && mouseY>160+yoff && mouseY<160+yoff+80) {
      hand=true;
      if (mousePressed) {
        bool[12]=false;
      }
    }
    if (!bool[12]) {
      fill(255, 255, 255, 125);
    } else {
      noFill();
    }
    rect(260+xoff, 160+yoff, 80, 80);
    if (mouseX>260+xoff && mouseX<260+xoff+80 && mouseY>275+yoff && mouseY<275+yoff+80) {
      hand=true;
      if (mousePressed) {
        bool[13]=false;
      }
    }
    if (!bool[13]) {
      fill(255, 255, 255, 125);
    } else {
      noFill();
    }
    rect(260+xoff, 275+yoff, 80, 80);

    xoff=3*width/4-45;
    yoff=350;
    fill(255);
    textSize(20);
    text("Color", 50+xoff, 185+yoff, 100, 30);
    text("Size", 50+xoff, 300+yoff, 100, 30);
    textSize(15);
    text("Yes", 160+xoff, 160+yoff, 80, 80);
    text("Yes", 160+xoff, 275+yoff, 80, 80);
    text("No", 260+xoff, 160+yoff, 80, 80);
    text("No", 260+xoff, 275+yoff, 80, 80);

    noFill();
    stroke(255);
    strokeWeight(2);
    if (mouseX>160+xoff && mouseX<160+xoff+80 && mouseY>160+yoff && mouseY<160+yoff+80) {
      hand=true;
      if (mousePressed) {
        bool[14]=true;
      }
    }
    if (bool[14]) {
      fill(255, 255, 255, 125);
    } else {
      noFill();
    }
    rect(160+xoff, 160+yoff, 80, 80);
    if (mouseX>160+xoff && mouseX<160+xoff+80 && mouseY>275+yoff && mouseY<275+yoff+80) {
      hand=true;
      if (mousePressed) {
        bool[15]=true;
      }
    }
    if (bool[15]) {
      fill(255, 255, 255, 125);
    } else {
      noFill();
    }
    rect(160+xoff, 275+yoff, 80, 80);
    if (mouseX>260+xoff && mouseX<260+xoff+80 && mouseY>160+yoff && mouseY<160+yoff+80) {
      hand=true;
      if (mousePressed) {
        bool[14]=false;
      }
    }
    if (!bool[14]) {
      fill(255, 255, 255, 125);
    } else {
      noFill();
    }
    rect(260+xoff, 160+yoff, 80, 80);
    if (mouseX>260+xoff && mouseX<260+xoff+80 && mouseY>275+yoff && mouseY<275+yoff+80) {
      hand=true;
      if (mousePressed) {
        bool[15]=false;
      }
    }
    if (!bool[15]) {
      fill(255, 255, 255, 125);
    } else {
      noFill();
    }
    rect(260+xoff, 275+yoff, 80, 80);

    fill(255);
    text("Dominant Gene?", 0, 450, width/4, 35);
    text("Dominant Homozygous Deadly?", width/4, 450, width/4, 35);
    text("Incomplete Dominance?", width/2, 450, width/4, 35);
    text("Sex-Linked?", 3*width/4, 450, width/4, 35);
    
    if(mouseX>width-100 && mouseX<width-5 && mouseY>5 && mouseY<95){
      fill(255, 255, 255, 125);
      hand=true;
      if(mousePressed){
        create();
      }
    } else {
      noFill();
    }
    rect(width-100, 5, 95, 95);
    fill(255);
    textSize(40);
    text("Go!", width-100, 5, 95, 95);

    if (hand) {
      cursor(HAND);
    } else {
      cursor(ARROW);
    }
  }  else {
    //println(wsf);
    //println(wlf);
    //println(rsm);
    //println(rlm);
    boolean hand=false;
    fill(255);
    textSize(50);
    text("Mother", 0, 20, width/2, 80);
    noFill();
    if(mouseX>60 && mouseX<60+width/2-120 && mouseY>150 && mouseY<150+100 && wsf){
      hand=true;
      if(mousePressed){
        bool2[0]=true;
        bool2[1]=false;
        bool2[2]=false;
        bool2[3]=false;
      }
    }
    if(bool2[0]){
      fill(255, 255, 255, 125);
    } else {
      noFill();
    }
    rect(60, 150, width/2-120, 100);
    if(mouseX>60 && mouseX<60+width/2-120 && mouseY>275 && mouseY<275+100 && wlf){
      hand=true;
      if(mousePressed){
        bool2[0]=false;
        bool2[1]=true;
        bool2[2]=false;
        bool2[3]=false;
      }
    }
    if(bool2[1]){
      fill(255, 255, 255, 125);
    } else {
      noFill();
    }
    rect(60, 275, width/2-120, 100);
    if(mouseX>60 && mouseX<60+width/2-120 && mouseY>400 && mouseY<400+100 && rsf){
      hand=true;
      if(mousePressed){
        bool2[0]=false;
        bool2[1]=false;
        bool2[2]=true;
        bool2[3]=false;
      }
    }
    if(bool2[2]){
      fill(255, 255, 255, 125);
    } else {
      noFill();
    }
    rect(60, 400, width/2-120, 100);
    if(mouseX>60 && mouseX<60+width/2-120 && mouseY>525 && mouseY<525+100 && rlf){
      hand=true;
      if(mousePressed){
        bool2[0]=false;
        bool2[1]=false;
        bool2[2]=false;
        bool2[3]=true;
      }
    }
    if(bool2[3]){
      fill(255, 255, 255, 125);
    } else {
      noFill();
    }
    rect(60, 525, width/2-120, 100);
    
    textSize(30);
    fill(255);
    if(wsf){
      fill(255);
    } else {
      fill(100);
    }
    text("White - Small", 30, 150, width/2-60, 100);
    if(wlf){
      fill(255);
    } else {
      fill(100);
    }
    text("White - Large", 30, 275, width/2-60, 100);
    if(rsf){
      fill(255);
    } else {
      fill(100);
    }
    text("Red - Small", 30, 400, width/2-60, 100);
    if(rlf){
      fill(255);
    } else {
      fill(100);
    }
    text("Red - Large", 30, 525, width/2-60, 100);
    
    
    int xoff=width/2;
    fill(255);
    textSize(50);
    text("Father", width/2, 20, width/2, 80);
    noFill();
    if(mouseX>60+xoff && mouseX<60+width/2-120+xoff && mouseY>150 && mouseY<150+100 && wsm){
      hand=true;
      if(mousePressed){
        bool2[4]=true;
        bool2[5]=false;
        bool2[6]=false;
        bool2[7]=false;
      }
    }
    if(bool2[4]){
      fill(255, 255, 255, 125);
    } else {
      noFill();
    }
    rect(60+xoff, 150, width/2-120, 100);
    if(mouseX>60+xoff && mouseX<60+width/2-120+xoff && mouseY>275 && mouseY<275+100 && wlm){
      hand=true;
      if(mousePressed){
        bool2[4]=false;
        bool2[5]=true;
        bool2[6]=false;
        bool2[7]=false;
      }
    }
    if(bool2[5]){
      fill(255, 255, 255, 125);
    } else {
      noFill();
    }
    rect(60+xoff, 275, width/2-120, 100);
    if(mouseX>60+xoff && mouseX<60+width/2-120+xoff && mouseY>400 && mouseY<400+100 && rsm){
      hand=true;
      if(mousePressed){
        bool2[4]=false;
        bool2[5]=false;
        bool2[6]=true;
        bool2[7]=false;
      }
    }
    if(bool2[6]){
      fill(255, 255, 255, 125);
    } else {
      noFill();
    }
    rect(60+xoff, 400, width/2-120, 100);
    if(mouseX>60+xoff && mouseX<60+width/2-120+xoff && mouseY>525 && mouseY<525+100 && rlm){
      hand=true;
      if(mousePressed){
        bool2[4]=false;
        bool2[5]=false;
        bool2[6]=false;
        bool2[7]=true;
      }
    }
    if(bool2[7]){
      fill(255, 255, 255, 125);
    } else {
      noFill();
    }
    rect(60+xoff, 525, width/2-120, 100);
    
    textSize(30);
    fill(255);
    fill(255);
    if(wsm){
      fill(255);
    } else {
      fill(100);
    }
    text("White - Small", 30+xoff, 150, width/2-60, 100);
    if(wlm){
      fill(255);
    } else {
      fill(100);
    }
    text("White - Large", 30+xoff, 275, width/2-60, 100);
    if(rsm){
      fill(255);
    } else {
      fill(100);
    }
    text("Red - Small", 30+xoff, 400, width/2-60, 100);
    if(rlm){
      fill(255);
    } else {
      fill(100);
    }
    text("Red - Large", 30+xoff, 525, width/2-60, 100);
    
    if(mouseX>width-100 && mouseX<width-5 && mouseY>5 && mouseY<95){
      fill(255, 255, 255, 125);
      hand=true;
      if(mousePressed){
        fly[2].male=false;
        fly[3].male=true;
        if(bool2[0]){
          for(int i=2; i<numKids1; i++){
            if(fly[i].white && fly[i].small && !fly[i].male){
              fly[2].wild1=fly[i].wild1;
              fly[2].wild2=fly[i].wild2;
              fly[2].wild3=fly[i].wild3;
              fly[2].wild4=fly[i].wild4;
            }
          }
        }
        if(bool2[1]){
          for(int i=2; i<numKids1; i++){
            if(fly[i].white && !fly[i].small && !fly[i].male){
              fly[2].wild1=fly[i].wild1;
              fly[2].wild2=fly[i].wild2;
              fly[2].wild3=fly[i].wild3;
              fly[2].wild4=fly[i].wild4;
            }
          }
        }
        if(bool2[2]){
          for(int i=2; i<numKids1; i++){
            if(!fly[i].white && fly[i].small && !fly[i].male){
              fly[2].wild1=fly[i].wild1;
              fly[2].wild2=fly[i].wild2;
              fly[2].wild3=fly[i].wild3;
              fly[2].wild4=fly[i].wild4;
            }
          }
        }
        if(bool2[3]){
          for(int i=2; i<numKids1; i++){
            if(!fly[i].white && !fly[i].small && !fly[i].male){
              fly[2].wild1=fly[i].wild1;
              fly[2].wild2=fly[i].wild2;
              fly[2].wild3=fly[i].wild3;
              fly[2].wild4=fly[i].wild4;
            }
          }
        }
        
        if(bool2[4]){
          for(int i=2; i<numKids1; i++){
            if(fly[i].white && fly[i].small && fly[i].male){
              fly[3].wild1=fly[i].wild1;
              fly[3].wild2=fly[i].wild2;
              fly[3].wild3=fly[i].wild3;
              fly[3].wild4=fly[i].wild4;
            }
          }
        }
        if(bool2[5]){
          for(int i=2; i<numKids1; i++){
            if(fly[i].white && !fly[i].small && fly[i].male){
              fly[3].wild1=fly[i].wild1;
              fly[3].wild2=fly[i].wild2;
              fly[3].wild3=fly[i].wild3;
              fly[3].wild4=fly[i].wild4;
            }
          }
        }
        if(bool2[6]){
          for(int i=2; i<numKids1; i++){
            if(!fly[i].white && fly[i].small && fly[i].male){
              fly[3].wild1=fly[i].wild1;
              fly[3].wild2=fly[i].wild2;
              fly[3].wild3=fly[i].wild3;
              fly[3].wild4=fly[i].wild4;
            }
          }
        }
        if(bool2[7]){
          for(int i=2; i<numKids1; i++){
            if(!fly[i].white && !fly[i].small && fly[i].male){
              fly[3].wild1=fly[i].wild1;
              fly[3].wild2=fly[i].wild2;
              fly[3].wild3=fly[i].wild3;
              fly[3].wild4=fly[i].wild4;
            }
          }
        }
        
        sel=false;
        breed();
      }
    } else {
      noFill();
    }
    rect(width-100, 5, 95, 95);
    fill(255);
    textSize(40);
    text("Go!", width-100, 5, 95, 95);
    
    if(hand){
      cursor(HAND);
    } else {
      cursor(ARROW);
    }
  }
}

void create(){
  fly[0].male=false;
  if(bool[0]){
    fly[0].wild1=true;
  } else {
    fly[0].wild1=false;
  }
  if(bool[1]){
    fly[0].wild2=true;
  } else {
    fly[0].wild2=false;
  }
  if(bool[2]){
    fly[0].wild3=true;
  } else {
    fly[0].wild3=false;
  }
  if(bool[3]){
    fly[0].wild4=true;
  } else {
    fly[0].wild4=false;
  }
  
  if(bool[4]){
    fly[1].wild1=true;
  } else {
    fly[1].wild1=false;
  }
  if(bool[5]){
    fly[1].wild2=true;
  } else {
    fly[1].wild2=false;
  }
  if(bool[6]){
    fly[1].wild3=true;
  } else {
    fly[1].wild3=false;
  }
  if(bool[7]){
    fly[1].wild4=true;
  } else {
    fly[1].wild4=false;
  }
  
  if(bool[8]){
    wildDom1=true;
  } else {
    wildDom1=false;
  }
  if(bool[9]){
    wildDom2=true;
  } else {
    wildDom2=false;
  }
  
  if(bool[10]){
    homoDead1=true;
  } else {
    homoDead1=false;
  }
  if(bool[11]){
    homoDead2=true;
  } else {
    homoDead2=false;
  }
  
  if(bool[12]){
    inter1=true;
  } else {
    inter1=false;
  }
  if(bool[13]){
    inter2=true;
  } else {
    inter2=false;
  }
  
  if(bool[14]){
    sexlink1=true;
  } else {
    sexlink1=false;
  }
  if(bool[15]){
    sexlink2=true;
  } else {
    sexlink2=false;
  }
  sel=false;
  breed();
  cursor(ARROW);
}

void keyReleased() {
  if (key==' ' && !sel && gen<2) {
    if (gen!=0) {
      sel=true;
    }
    gen++;
  }
  if (key=='1') {
    if (gen>1) {
      gen=1;
    }
  }
  if (key=='r') {
    gen=0;
    sel=true;
  }
}
