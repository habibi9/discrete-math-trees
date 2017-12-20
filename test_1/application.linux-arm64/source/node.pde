class Node{
 int nodeX;
 int nodeY;
 int nodeColor;
 Node(int nodeXTemp, int nodeYTemp, int nodeColorTemp){
   nodeX = nodeXTemp;
   nodeY = nodeYTemp;
   nodeColor = nodeColorTemp;
 }
 void display(){
   fill(nodeColor);
   ellipse(nodeX, nodeY, 20, 20);
 }
}