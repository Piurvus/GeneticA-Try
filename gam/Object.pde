class Object {
  
  public int hight = 100, breite = 50;
  public float x, y;
  
 public Object(int hohe){
   hight = hohe;
   x = 800;
   y = 550 - hight;

 }
 
  public Object(){
   x = 1600;
   y = 550 - hight;

 }
 
 public void display(){
   fill(0,0,255);
   rect(x,y,breite,hight);
 }
 
 public void update(){
  x-=3;
  if( x <= 0){
    respawn();
  }
 }
 
 void respawn(){
   x = 1600+random(-100,100);
   hight = (int)(100 + (float)random(0, 100));
   y = 550 - hight;
   breite = (int)(50 + (float)random(0, 50));
 }
 
}