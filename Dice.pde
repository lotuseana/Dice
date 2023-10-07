int s =5;
int total = 0;
int count = 0;
int op = 255;
float st = 1.0;
int out1;
Die bob;

void setup()
{
  //noLoop();
  size (300, 300);
  textSize(20);
  textAlign(CENTER);
  frameRate(30);
}
void draw()
{
  background (138, 12, 3);
  noFill();
  stroke(255);
  strokeWeight(2);
  rect(20, 10, 260, 250);
  stroke(0);
  for (int y = 30; y <= 250; y+=80)
  {
    for (int x = 45; x<=280; x+=80)
    {
      bob = new Die(x, y);
      if (count<20) {
        bob.roll();
        bob.show();
      }
      if (count == 20) {
        bob.freeze();
      }
      if (count >= 20 && count <30 ) {
        bob.anim();
        bob.freeze();
      }
      if (count == 30) {
        bob.freeze();
        count = 0;
      }
    }
  } //emd loop

  count++;
  //text
  fill(255);
  text(total, 150, 285);
  //if (count<20){
  total = 0;//}
  if (count==30) {
        if (out1 ==6) {
          bob.win();
        }
    noLoop();
  }
}
void mousePressed()
{
  textSize(20);
  total=0;
  redraw();
  count =0;
  loop();
  op = 255;
  st = 1.0;
}
class Die //models one single dice cube
{
  int myX, myY, output;

  Die(int x, int y) //constructor
  {
    myX = x;
    myY = y;
  }

  void roll()
  {
    output = (int)(Math.random()*6)+1;
    total+= output;
    out1 = output;
    //System.out.print(output);
  }
  void show()
  {
    //dice
    strokeWeight (2);
    fill(255);
    stroke(0);
    rect (myX, myY, 50, 50);
    fill (0);
    if (output ==1) {
      mid();
    } else if (output ==2) {
      corners();
    } else if (output ==3) {
      mid();
      corners();
    } else if (output ==4) {
      corners();
      corners2();
    } else if (output ==5) {
      corners();
      corners2();
      mid();
    } else {
      corners();
      corners2();
      sides();
    }
  }
  void mid() {
    ellipse (25+myX, 25+myY, s, s);
  }
  void corners() {
    ellipse (10+myX, 10+myY, s, s);
    ellipse (40+myX, 40+myY, s, s);
  }
  void corners2() {
    ellipse (40+myX, 10+myY, s, s);
    ellipse (10+myX, 40+myY, s, s);
  }
  void sides() {
    ellipse(10+myX, 25+myY, s, s);
    ellipse (40+myX, 25+myY, s, s);
  }
  void anim() {
    noFill();
    stroke(179, op);
    strokeWeight(st);
    rect(myX+5, myY+5, 40, 40);
    stroke(255, op/6);
    strokeWeight (st/3);
    rect(20, 10, 260, 250);
    op-=4;
    st+=0.7;
  }
  void freeze() {
    total += out1;
    strokeWeight (2);
    fill(255);
    stroke(0);
    rect (myX, myY, 50, 50);
    fill (0);
    if (out1 ==1) {
      mid();
    } else if (out1 ==2) {
      corners();
    } else if (out1 ==3) {
      mid();
      corners();
    } else if (out1 ==4) {
      corners();
      corners2();
    } else if (out1 ==5) {
      corners();
      corners2();
      mid();
    } else {
      corners();
      corners2();
      sides();
    }
  }
  void win() {
    strokeWeight (2);
    fill(255);
    stroke(255, 189, 46);
    for (int y = 30; y <= 250; y+=80)
  {
    for (int x = 45; x<=280; x+=80)
    {
      rect (x, y, 50, 50);
  }
}//end loop
  textSize(50);
  textAlign(CENTER);
  fill (0);
  text("W", 69, 154);
  text("I", 149, 154);
  text("N", 229, 154);
  fill (255, 189, 46);
  text("W", 71, 152);
  text("I", 151, 152);
  text("N", 231, 152);
  noFill();
  stroke(255, 189, 46);
  rect(20, 10, 260, 250);
  
  }}







