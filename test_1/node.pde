class Node{
 int nodeX;
 int nodeY;
 int nodeColor;
 int degree;
 int neighbors[];
 Node(int nodeXTemp, int nodeYTemp, int nodeColorTemp){
   nodeX = nodeXTemp;
   nodeY = nodeYTemp;
   nodeColor = nodeColorTemp;
   degree = 0;
   neighbors = new int[degree];
 }
 void display(){
   fill(nodeColor);
   ellipse(nodeX, nodeY, 20, 20);
 }
}