class Node{
 var nodeX;
 var nodeY;
 var nodeColor;
 Node(var nodeXTemp, var nodeYTemp, var nodeColorTemp){
   nodeX = nodeXTemp;
   nodeY = nodeYTemp;
   nodeColor = nodeColorTemp;
 }
 function display(){
   fill(nodeColor);
   ellipse(nodeX, nodeY, 20, 20);
 }
}