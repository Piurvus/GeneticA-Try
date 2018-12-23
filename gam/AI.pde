class AI {
  
  public AI(){};
  
  public void initializeNextGen(){
    

    for (int i = me.length-1; i > -1; i--){
      me[i] = sortme.get(i);
    }
    println("\nScore: "+ score);
    println("Generation: "+ generation + "\n\n");
    println(me[me.length-1].score);
    //println(me[me.length-1].weights);
    //println(me[me.length-1].weights2);
    output.println("\nScore: "+ score);
    output.println("Generation: "+ generation + "\n\n");
    output.println(me[me.length-1].score);
    //output.println(me[me.length-1].weights+ "\n");
    //output.println(me[me.length-1].weights2);
    sortme = new ArrayList<Player>();
    
    
    for (int i = 0; i < me.length/3 -1; i++){
      //COPY OF BEST ONES
       me[i].weights1 = me[i + me.length*2/3-1].weights1;
       me[i].weights2 = me[i + me.length*2/3-1].weights2;
    }
    for (int i = 0; i < me.length/3 -1; i++){
      //COPY OF BEST ONES
       me[i+me.length/3 -1].weights1 = me[i + me.length*2/3-1].weights1;
       me[i+me.length/3 -1].weights2 = me[i + me.length*2/3-1].weights2;
    }
    //for (int i = 0; i < me.length/8 -1; i++){
    //  //ADDING 1/8 NEW ONES
    //  for ( int j = 0; j < 5; j++){
    //    me[i].weights[j] += random(-1, 1); 
    //    me[i].weights2[j] += random(-1, 1); 
    //  }
    //}
      
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
    for (int i = 0; i < me.length*98/100; i++) {
      for(int j=0;j<me[i].weights1[0].length;j++){
        if (random(0, 1) >= 0.2){
          me[i].weights1[int(random(0, me[i].weights1.length))][j] += 0.0001*random(-1, 1);
        }   
      }
      for(int j=0;j<me[i].weights2[0].length;j++){
        if (random(0, 1) >= 0.2){
          me[i].weights2[int(random(0, me[i].weights2.length))][j] += 0.0001*random(-1, 1);
        }   
      }
    }
  }

  void crossover(){
    for (int i = 0; i < me.length*9/10; i++) {
      
      int count = (int)random(0, 5);
      int count2 = (int)random(0, 5);
      int a = (int)random(0, 5);
      int b = (int)random(0, me.length/2 -1);
      for( int j = 0; j <= count; j++){
        
        me[i].weights1 = me[me.length/2 - 1 + b].weights1;
        //me[i].weights2[a] = me[me.length/2 - 1 + b].weights2[a];
      }      

    }
  }

  public void forwardProp(int j){
    
    double jump = 0;
    double notJump = 0;
    double hidenneuron[] = new double[me[0].weights1[0].length];
    double output[] = new double[me[0].weights2[0].length];
    hidenneuron=Matrix.dotproduct(me[j].weights1,me[j].inputs);
    hidenneuron=Matrix.activation(hidenneuron);
    output=Matrix.dotproduct(me[j].weights2,hidenneuron);
    //first is jump second is nonjump
    
    
    if(output[0] < output[1]){
      me[j].jump();
    }
    
  }


}