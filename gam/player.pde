class Player{

  public int x, y;
  public int score = 0;
  public boolean dead = false;
  
  public float size = 50;
  float ySpeed = 0.0f;
  
  public Player(){
    x = 200;
    y = 500;
    
  }
  
  public void display(){
    fill(255, 0, 0);
    rect(x, y, size, size);
  }
  
  public void jump(){
    if(y >= 500){
      ySpeed = -10;
    }
  }
  
  public void update(){
    y += ySpeed;
    if (y >= 500){
      y = 500;
      ySpeed = 0;
    }
    ySpeed += 0.2f;
    score ++;
  }

  public void die(){
    dead = true;
  }

}