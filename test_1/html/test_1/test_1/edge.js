class Edge{
 var edgeX1;
 var edgeY1;
 var edgeX2;
 var edgeY2;
 var edgeColor;
 Edge(var edgeX1Temp, var edgeY1Temp, var edgeX2Temp, var edgeY2Temp, var edgeColorTemp){
   edgeX1 = edgeX1Temp;
   edgeY1 = edgeY1Temp;
   edgeX2 = edgeX2Temp;
   edgeY2 = edgeY2Temp;
   edgeColor = edgeColorTemp;
 }
 function display(){
   stroke(edgeColor);
   line(edgeX1, edgeY1, edgeX2, edgeY2);
 }
}