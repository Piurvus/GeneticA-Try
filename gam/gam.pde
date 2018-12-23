static int genSize = 5000;
static Player[] me = new Player[genSize];
static ArrayList<Player> sortme = new ArrayList<Player>();

AI ai= new AI();

Object obj = new Object();
Object obj2 = new Object(150);

int score = 0;
int generation = 1;
  
static PrintWriter output;

void setup(){
  output = createWriter("positions"+".txt"); 
  for(int i = 0; i < genSize; i++){
    me[i] = new Player(true);
  }

  frameRate(100000000);

  size(1600, 800);
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
void draw2(){
 while (true) draw2(); 
}
void draw(){
  output.flush();
  if(keyPressed){
    if(key=='a')frameRate(100);
    if(key=='w')frameRate(1000);
    
    me[1].jump();
  }
  
  background(255);
  strokeWeight(5);
  line(0, 550, 1600, 550);
  obj.update();
  obj.display();
  obj2.update();
  obj2.display();
  

  
  for(int i = 0; i < me.length; i++){
    if(!me[i].dead){
      if(me[i].score >= score) score = me[i].score;
      //me[i].display();
      
        }
  }  
  for(int i = 0; i < me.length; i++){
    if(!me[i].dead){
      me[i].display();
      text(me[i].score,0,500);
      text(generation,0,520);
      text(score,0,540);
      
      break;
    } 
    if (i == me.length - 1){
      ai.initializeNextGen();
      generation++;
    }
  }
  
  int deathCount = 0;
  for(int i = 0; i < me.length; i++){
    if(!me[i].dead){
      me[i].update();
      ai.forwardProp(i);
      if (collision(i)){ 
        me[i].die();
        sortme.add(me[i]);
      }
    } else {
      deathCount++;
      
  }}
  text(deathCount,0,565);
  println(deathCount);
}