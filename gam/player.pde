
class Player{

  public int x, y;
  public int score = 0;
  public boolean dead = false;
  public int onGround = 1;
  
  public float size = 50;
  float ySpeed = 0.0f;
  
  public double inputs[] = new double[5];
  public double weights[] = new double[5]; 
  public double weights2[] = new double[5]; 
  
  public Player(boolean first){
    x = 200;
    y = 500;
    
    if(first){
      for(int i = 0; i< weights.length; i++){
        weights[i] = random(-10, 10);
        println(weights[i]);
      }      
      for(int i = 0; i< weights2.length; i++){
        weights2[i] = random(-10, 10);
        println(weights2[i]);
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
    } else{
      inputs[1] = obj.x;
      inputs[2] = obj.hight;
    }
    //inputs[3] = obj2.x;
    //inputs[4] = obj2.hight;    
  }

  public void die(){
    dead = true;
  }

}