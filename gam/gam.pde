
Player me = new Player();
Object obj = new Object();
Object obj2 = new Object(150);

void setup(){
    
  size(1600, 600);
  background(255);
  
}

boolean collision(){
  if (obj.x <= me.x+me.size && obj.x+obj.breite >= me.x && obj.y <= me.y+me.size && obj.y+obj.hight >= me.y){
    return true;
  } else if (obj2.x <= me.x+me.size && obj2.x+obj2.breite >= me.x && obj2.y <= me.y+me.size && obj2.y+obj2.hight >= me.y) {
    return true;
  }
  return false;
}

void draw(){
  
  if(keyPressed){
    me.jump();
  }
  
  background(255);
  strokeWeight(5);
  line(0, 550, 1600, 550);
  obj.update();
  obj.display();
  obj2.update();
  obj2.display();
  if(!me.dead){
    me.update();
    me.display();
    if (collision()) me.die();
  }
  
}