class AI {
  
  public AI(){};
  
  public void initializeNextGen(){
    

    for (int i = me.length-1; i > -1; i--){
      me[i] = sortme.get(i);
    }
    println("\nScore: "+ score);
    println("Generation: "+ generation + "\n\n");
    println(me[me.length-1].score);
    //println(me[me.length-1].weights1[0]);
    //println(me[me.length-1].weights2[0]);
    output.println("\nScore: "+ score);
    output.println("Generation: "+ generation + "\n\n");
    output.println(me[me.length-1].score);
    //output.println(me[me.length-1].weights+ "\n");
    //output.println(me[me.length-1].weights2);
    sortme = new ArrayList<Player>();
    //for(int k=0;k<me.length/2;k++){
    //  if(me[k].score<500){
    // for(int j=0;j<me[k].weights1.length;j++){
        
    //  for(int i = 0; i< me[k].weights1[j].length; i++){
    //    me[k].weights1[j][i] = random(0, 1);
    //    //println(weights[i]);
    //  }    
    //  }
    // for(int j=0;j<me[k].weights2.length;j++){
    //  for(int i = 0; i< me[k].weights2[j].length; i++){
    //    me[k].weights2[j][i] = random(0, 1);
    //    //println(weights[i]);
    //  }
    //}
    //  }
    //}
    
    for (int i = 0; i < me.length/3 -1; i++){
      //COPY OF BEST ONES
       me[i].weights1 = me[i + me.length*2/3-1].weights1;
       me[i].weights2 = me[i + me.length*2/3-1].weights2;
    }
    for (int i = 0; i < me.length/3 -1; i++){
      //COPY OF BEST ONES
       me[i+me.length/3 -1].weights1 = me[ me.length-1].weights1;
       me[i+me.length/3 -1].weights2 = me[ me.length-1].weights2;
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
    for (int i = 0; i < me.length*9/10; i++) {
      for(int j=0;j<me[i].weights1[0].length;j++){
        if (random(0, 1) >= 0.5){
          me[i].weights1[int(random(0, me[i].weights1.length))][j] += 0.001*random(-1, 1)*log(i);
        }   
      }
      for(int j=0;j<me[i].weights2[0].length;j++){
        if (random(0, 1) >= 0.5){
          me[i].weights2[int(random(0, me[i].weights2.length))][j] += 0.001*random(-1, 1)*log(i);
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