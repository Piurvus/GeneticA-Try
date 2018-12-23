class AI {
  
  public AI(){};
  
  public void initializeNextGen(){
    
    for (int i = me.length-1; i > -1; i--){
      me[i] = sortme.get(i);
    }
    
    sortme = new ArrayList<Player>();
    
    for (int i = 0; i < me.length/2 -1; i++){
       me[i].weights = me[i + me.length/2].weights;
       me[i].weights2 = me[i + me.length/2].weights2;
    }
    
    mutation();
    for (int i = 0; i < me.length; i++){
      me[i].dead = false;
      me[i].score = 0;
    }
    obj.x = 1600; 
    obj2.x = 800;
  }


  void mutation(){
    for (int i = 0; i < me.length; i++) {
      if (random(0, 1) >= 0.2){
        me[i].weights[int(random(0, 4))] += random(-1, 1);
      }      
      if (random(0, 1) >= 0.2){
        me[i].weights2[int(random(0, 4))] += random(-1, 1);
      }
    }
  }


  public void forwardProp(int j){
    
    double jump = 0;
    double notJump = 0;
    
    for (int i = 0; i < 5; i++){
      notJump += me[j].inputs[i] * me[j].weights[i];
    }    
    
    for (int i = 0; i < 5; i++){
      jump += me[j].inputs[i] * me[j].weights2[i];
    }
    
    if(notJump < jump){
      me[j].jump();
    }
    
  }


}