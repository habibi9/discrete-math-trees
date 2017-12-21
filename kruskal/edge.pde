class Edge{
 int edgeX1;
 int edgeY1;
 int edgeX2;
 int edgeY2;
 int edgeColor;
 Edge(int edgeX1Temp, int edgeY1Temp, int edgeX2Temp, int edgeY2Temp, int edgeColorTemp){
   edgeX1 = edgeX1Temp;
   edgeY1 = edgeY1Temp;
   edgeX2 = edgeX2Temp;
   edgeY2 = edgeY2Temp;
   edgeColor = edgeColorTemp;
 }
 void display(){
   stroke(edgeColor);
   line(edgeX1, edgeY1, edgeX2, edgeY2);
 }
}