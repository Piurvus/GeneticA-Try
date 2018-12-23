
Player[] me = new Player[50];
Object obj = new Object();
Object obj2 = new Object(150);

void setup(){
    
  size(1600, 600);
  background(255);
  
}

boolean collision(int i){
  if (obj.x <= me[i].x+me[i].size && obj.x+obj.breite >= me[i].x && obj.y <= me[i].y+me[i].size && obj.y+obj.hight >= me[i].y){
    return true;
  } else if (obj2.x <= me[i].x+me[i].size && obj2.x+obj2.breite >= me[i].x && obj2.y <= me[i].y+me[i].size && obj2.y+obj2.hight >= me[i].y) {
    return true;
  }
  return false;
}

void draw(){
  
  if(keyPressed){
    me[1].jump();
  }
  
  background(255);
  strokeWeight(5);
  line(0, 550, 1600, 550);
  obj.update();
  obj.display();
  obj2.update();
  obj2.display();
  for(int i=0;i<me.length;i++){
    if(!me[i].dead){
      me[i].update();
      me[i].display();
      if (collision(i)) me[i].die();
    }
  }
  
}