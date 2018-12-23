public static class Matrix{
  public Matrix(){
  }
  public static  double [] dotproduct(double matri[][], double vector []){
    double output[] = new double[matri[0].length];
    for(int i=0; i<matri[0].length ; i++){
      for(int j=0; j<matri.length; j++){
         output[i]+=matri[j][i]*vector[j];
      }
    }
  return output;
  }
  public static double [] activation(double vector []){
    for(int i=0; i<=vector.length ; i++){
      if (vector[i] < 0) vector[i]=0; 
    }
    return vector;
  }
}
