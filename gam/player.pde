
class Player{

  public int x, y;
  public int score = 0;
  public boolean dead = false;
  public int onGround = 1;
  
  public float size = 50;
  float ySpeed = 0.0f;
  
  public double inputs[] = new double[8];//x
 // public double weights[] = new double[5];
//  public double weights2[] = new double[5];
  public double weights1[][] = new double[8][20];//x,y
  public double weights2[][] = new double[20][2];//x,y
  
  public Player(boolean first){
    x = 200;
    y = 500;
    //println(weights1.length);
    //println(weights1[0].length);
    if(first){
      for(int j=0;j<weights1.length;j++){
        
      for(int i = 0; i< weights1[j].length; i++){
        weights1[j][i] = random(0, 1);
        //println(weights[i]);
      }    
      }
     for(int j=0;j<weights2.length;j++){
      for(int i = 0; i< weights2[j].length; i++){
        weights2[j][i] = random(0, 1);
        //println(weights[i]);
      }
    }
  }
  }
  
  public void display(){
    fill(255, 0, 0);
    rect(x, y, size, size);
  }
  
  public void jump(){
    if(y >= 500){
      ySpeed = -10;
      onGround = 0;
    }
  }
  
  public void update(){
    y += ySpeed;
    if (y >= 500){
      y = 500;
      ySpeed = 0;
      onGround = 1;
    }
    ySpeed += 0.2f;
    score ++;
    
    inputs[0] = this.y;
    
    //  only closer object
    if(obj.x > obj2.x){
      inputs[1] = obj2.x;
      inputs[2] = obj2.hight;   
      inputs[3] = obj2.breite;
      inputs[5] = obj.x;
      inputs[6] = obj.hight;
      inputs[7] = obj.breite;
    } else{
      inputs[1] = obj.x;
      inputs[2] = obj.hight;
      inputs[3] = obj.breite;
      inputs[5] = obj2.x;
      inputs[6] = obj2.hight;   
      inputs[7] = obj2.breite;
    }
    //inputs[3] = obj2.x;
    inputs[4] = 1;    
  }

  public void die(){
    dead = true;
  }

}