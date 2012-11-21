
class Node {
  PVector pos, base, min, tension;
  PVector vel=new PVector(0, 0);
  PVector acc=new PVector(0, 0);
  float rad = 10;
  int id;
  boolean bCatched;

  Node(int _id) {
    id=_id;
    base=new PVector(0, 0);
    pos =new PVector(20, 20);
    int maxNodes = corners;
    int offset=50+10*id*id/100; 
    bCatched = false; 
    base.x=sin(
    radians(
    360/maxNodes*id
      )) *
      offset +
      (width/2);
    base.y=cos(
    radians(
    360/maxNodes*id
      )) *
      offset +
      (height/2);
  }

  void display() {
    noStroke();
    fill(255);

    ellipse(pos.x, pos.y, rad, rad);
    stroke(255);
    strokeWeight(3);
    if (id+1<node.length)
      line(pos.x, pos.y, node[id+1].pos.x, node[id+1].pos.y);
    if (id+corners<node.length)
      line(pos.x, pos.y, node[id+corners].pos.x, node[id+corners].pos.y);
   //NUMBERT COLOR
  // fill(71,79,95); //grey
fill(253,200,0); //yellow
//fill(236,58,152); //fuschia


    PVector v = PVector.sub(base, new PVector(width/2, height/2));
    v.normalize();
    v.mult(20);
    textAlign(CENTER);
    text(id, pos.x+v.x, pos.y+v.y);
  }

  //void update(int x, int y){
  //return to basePoint if moved, bouncyness
  boolean update(int nNodeToCatch) {
    PVector mouse = new PVector(mouseX, mouseY);
    if (pos.dist(mouse)<2*rad && (id == nNodeToCatch))
    {
      pos.set(mouse);
      bCatched = true;
      return true;
    }
    else if (bCatched)
    {
      pos.set(mouse);
      return false;
    }
    else
    {
      acc.x = 0.1 * (base.x-pos.x);
      acc.y = 0.1 * (base.y-pos.y);

      vel.add(acc);
      vel.mult(0.9);

      pos.add(vel);
      acc = new PVector(0, 0);
      tension();
      return false;
    }
  }

  void tension() {

    int target = 0;
    if (id+1<node.length) {
      PVector dir = new PVector(node[id+1].pos.x, node[id+1].pos.y);
      dir.sub(pos);
      dir.normalize();
      float distance = pos.dist(node[id+1].pos);
      dir.mult(distance*distance*.0001);
      acc.add(dir);
      pos.add(acc);
    }
    if (id-1>=0) {
      PVector dir = new PVector(node[id-1].pos.x, node[id-1].pos.y);
      dir.sub(pos);
      dir.normalize();
      float distance = pos.dist(node[id-1].pos);
      dir.mult(distance*distance*.0001);
      acc.add(dir);
      pos.add(acc);
    }
    if (id+corners<node.length) {
      PVector dir = new PVector(node[id+corners].pos.x, node[id+corners].pos.y);
      dir.sub(pos);
      dir.normalize();
      float distance = pos.dist(node[id+corners].pos);
      dir.mult(distance*distance*.0001);
      acc.add(dir);
      pos.add(acc);
    }
    if (id-corners>=0) {
      PVector dir = new PVector(node[id-corners].pos.x, node[id-corners].pos.y);
      dir.sub(pos);
      dir.normalize();
      float distance = pos.dist(node[id-corners].pos);
      dir.mult(distance*distance*.0001);
      acc.add(dir);
      pos.add(acc);
    }
  }
}

