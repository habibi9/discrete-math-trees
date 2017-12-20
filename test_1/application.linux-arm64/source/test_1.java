import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class test_1 extends PApplet {

Tree tree;
int node_count = 10;
int edge_count = 9;
//int father_code[][]= {{1, 2, 3, 4, 5, 6, 7, 8, 9},
//                      {0, 0, 0, 0, 0, 0, 0, 0, 0}};
int prufer_code[] = {6, 0, 2, 6, 2, 9, 9, 2, 0};
int counter = 0;
String s;
public void setup() {
  
  fill(255);
  rect(10, 10, width-400, height-20);
  
  tree = new Tree(node_count, edge_count);
  tree.draw_nodes();
  //tree.father_code = father_code;
  tree.prufer_code = prufer_code;
  tree.construct_from_prufer_code();
  //tree.draw_from_father_code();
  fill(255);
  text("Click here to draw tree from father code!", width-300, 300, 180, 60);
}

public void draw() {
  if(mouseButton == LEFT){
    if(mouseX > width - 300 - 90 && mouseX < width - 300 + 90 && mouseY > 300 - 30 && mouseY < 300 + 30){
      tree.draw_from_father_code();
    }
  }
  
}
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
 public void display(){
   stroke(edgeColor);
   line(edgeX1, edgeY1, edgeX2, edgeY2);
 }
}
class Node{
 int nodeX;
 int nodeY;
 int nodeColor;
 Node(int nodeXTemp, int nodeYTemp, int nodeColorTemp){
   nodeX = nodeXTemp;
   nodeY = nodeYTemp;
   nodeColor = nodeColorTemp;
 }
 public void display(){
   fill(nodeColor);
   ellipse(nodeX, nodeY, 20, 20);
 }
}
class Tree{
  Node[] nodes;
  Edge[] edges;
  int node_count;
  int edge_count;
  int father_code[][];
  int prufer_code[];
  Tree(int node_countTemp, int edge_countTemp){
    node_count = node_countTemp;
    edge_count = edge_countTemp;
    nodes = new Node[node_count];
    edges = new Edge[edge_count];
    father_code = new int[2][edge_count];
    //father_code = new Array[2];
    for(int a = 0; a < node_count; a++){
      int nodeX = PApplet.parseInt(random(10, width - 400));
      int nodeY = PApplet.parseInt(random(10, height - 10));
      nodes[a] = new Node(nodeX, nodeY, 0);
    }
    for(int a = 0; a < 2; a++){
      for(int b = 0; b < edge_count; b++){
        father_code[a][b] = 0;
      }
    }
  }
  public void draw_from_father_code(){
    for(int a = 0; a < edge_count; a++){
      int start = father_code[0][a];
      int end = father_code[1][a];
      edges[a] = new Edge(nodes[start].nodeX, nodes[start].nodeY, nodes[end].nodeX, nodes[end].nodeY, 0);
    }
    draw_edges();
  }
  public void draw_nodes(){
    for(int a = 0; a < node_count; a++){
      fill(0);
      text(str(a), PApplet.parseFloat(nodes[a].nodeX+20), PApplet.parseFloat(nodes[a].nodeY), 20.0f, 20.0f);
      nodes[a].display();
    }
  }
  public void draw_edges(){
    String s = "";
    for(int a = 0; a < edge_count; a++){
      edges[a].display();
      s += (father_code[0][a] + " " + father_code[1][a] + "\n");
    }
    text(s, width-300, 100, 60, 200);
  }
  public void construct_from_prufer_code(){
    for(int a = 0; a < edge_count-1; a++){
      father_code[1][a] = prufer_code[a];
    }
    for(int a = 0; a < edge_count; a++){
      int val = 1;
      while (doesnt_appear(val, father_code[1], a, edge_count) == false || doesnt_appear(val, father_code[0], 0, a) == false){
        val++;
      }
      father_code[0][a] = val;
    }
  }
}
public boolean doesnt_appear(int val, int array[], int start_pos, int length){
  boolean result = true;
  for(int a = start_pos; a < length; a++){
    if(val == array[a]) result = false;
  }
  return result;
}
  public void settings() {  size(1920, 1080); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--stop-color=#cccccc", "test_1" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
