public class Fly {
  private boolean wild1;
  private boolean wild2;
  private boolean wild3;
  private boolean wild4;
  private boolean white;
  private boolean small;
  private float x;
  private float y;
  boolean male;

  public Fly(boolean type1, boolean type2, boolean type3, boolean type4) {
    wild1=type1;
    wild2=type2;
    wild3=type3;
    wild4=type4;
    white=false;
    small=false;
    x=random(0, width);
    y=random(0, height);
  }

  public void setAlleles(boolean type1, boolean type2, boolean type3, boolean type4) {
    wild1=type1;
    wild2=type2;
    wild3=type3;
    wild4=type4;
  }

  public void show() {
    if (!((wild1==wildDom1 && wild2==wildDom1 && homoDead1) || (wild3==wildDom2 && wild4==wildDom2 && homoDead2))) {
      //println(wild1 + " " +  wild2);
      if ((wildDom1==true && (wild1==true || wild2==true)) || (wildDom1==false && (wild1==true && wild2==true))) {
        fill(255);
        white=true;
        //println("white");
      } else {
        fill(255, 0, 0);
        white=false;
        //println("red");
      }
      if ((wild1!=wild2) && inter1) {
        fill(255, 105, 180);
      }

      noStroke();

      if ((wildDom2==true && (wild3==true || wild4==true)) || (wildDom2==false && (wild3==true && wild4==true))) {
        ellipse(x, y, 2, 2);
        small=true;
      } else {
        ellipse(x, y, 5, 5);
        small=false;
      }
      if ((wild3!=wild4) && inter2) {
        ellipse(x, y, 3.5, 3.5);
        //println("inter");
      }
    }
  }

  public void upd() {
    if (!((wild1==wildDom1 && wild2==wildDom1 && homoDead1) || (wild3==wildDom2 && wild4==wildDom2 && homoDead2))) {
      total++;
      if (male) {
        males++;
        if (white) {
          if (small) {
            whsmma++;
            whsmto++;
          } else {
            whlama++;
            whlato++;
          }
        } else {
          if (small) {
            resmma++;
            resmto++;
          } else {
            relama++;
            relato++;
          }
        }
      } else {
        females++;
        if (white) {
          if (small) {
            whsmfe++;
            whsmto++;
          } else {
            whlafe++;
            whlato++;
          }
        } else {
          if (small) {
            resmfe++;
            resmto++;
          } else {
            relafe++;
            relato++;
          }
        }
      }
    }
  }

  public void move() {
    x+=random(-3, 3);
    y+=random(-3, 3);
    if (x<0) {
      x=0;
    }
    if (x>width) {
      x=width;
    }
    if (y<0) {
      y=0;
    }
    if (y>height) {
      y=height;
    }
  }
}
