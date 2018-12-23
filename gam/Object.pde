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
  x-=4;
  if( x <= 0){
    respawn();
  }
 }
 
 void respawn(){
   x = 1600;
 }
 
}