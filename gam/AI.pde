class AI {
  
  public AI(){};
  
  public void initializeNextGen(){
    

    for (int i = me.length-1; i > -1; i--){
      me[i] = sortme.get(i);
    }
    println("\nScore: "+ score);
    println("Generation: "+ generation + "\n\n");
    println(me[me.length-1].score);
    println(me[me.length-1].weights);
    println(me[me.length-1].weights2);
    output.println("\nScore: "+ score);
    output.println("Generation: "+ generation + "\n\n");
    output.println(me[me.length-1].score);
    output.println(me[me.length-1].weights+ "\n");
    output.println(me[me.length-1].weights2);
    sortme = new ArrayList<Player>();
    
    
    for (int i = me.length/8; i < me.length/3 -1; i++){
      //COPY OF BEST ONES
       me[i].weights = me[i + me.length*2/3-1].weights;
       me[i].weights2 = me[i + me.length*2/3-1].weights2;
    }
    
    for (int i = 0; i < me.length/8 -1; i++){
      //ADDING 1/8 NEW ONES
      for ( int j = 0; j < 5; j++){
        me[i].weights[j] += random(-1, 1); 
        me[i].weights2[j] += random(-1, 1); 
      }
    }
      
    mutation();
    crossover();
    
    for (int i = 0; i < me.length; i++){
      me[i].dead = false;
      me[i].score = 0;
    }
    obj.x = 1600; 
    obj2.x = 800;
  }


  void mutation(){
    for (int i = 0; i < me.length-1; i++) {
      if (random(0, 1) >= 0.2){
        me[i].weights[int(random(0, 5))] += 0.1*random(-1, 1);
      }      
      if (random(0, 1) >= 0.2){
        me[i].weights2[int(random(0, 5))] += 0.1*random(-1, 1);
      }
    }
  }

  void crossover(){
    for (int i = 0; i < me.length -10; i++) {
      
      int count = (int)random(0, 5);
      int count2 = (int)random(0, 5);
      int a = (int)random(0, 5);
      int b = (int)random(0, me.length/2 -1);
      for( int j = 0; j <= count; j++){
        
        me[i].weights[a] = me[me.length/2 - 1 + b].weights[a];
        me[i].weights2[a] = me[me.length/2 - 1 + b].weights2[a];
      }      

    }
  }

  public void forwardProp(int j){
    
    double jump = 0;
    double notJump = 0;
    
    for (int i = 0; i < 4; i++){
      notJump += me[j].inputs[i] * me[j].weights[i];
    }    
    
    for (int i = 0; i < 4; i++){
      jump += me[j].inputs[i] * me[j].weights2[i];
    }
    
    if(notJump < jump){
      me[j].jump();
    }
    
  }


}