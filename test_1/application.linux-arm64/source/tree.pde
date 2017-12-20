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
      int nodeX = int(random(10, width - 400));
      int nodeY = int(random(10, height - 10));
      nodes[a] = new Node(nodeX, nodeY, 0);
    }
    for(int a = 0; a < 2; a++){
      for(int b = 0; b < edge_count; b++){
        father_code[a][b] = 0;
      }
    }
  }
  void draw_from_father_code(){
    for(int a = 0; a < edge_count; a++){
      int start = father_code[0][a];
      int end = father_code[1][a];
      edges[a] = new Edge(nodes[start].nodeX, nodes[start].nodeY, nodes[end].nodeX, nodes[end].nodeY, 0);
    }
    draw_edges();
  }
  void draw_nodes(){
    for(int a = 0; a < node_count; a++){
      fill(0);
      text(str(a), float(nodes[a].nodeX+20), float(nodes[a].nodeY), 20.0, 20.0);
      nodes[a].display();
    }
  }
  void draw_edges(){
    String s = "";
    for(int a = 0; a < edge_count; a++){
      edges[a].display();
      s += (father_code[0][a] + " " + father_code[1][a] + "\n");
    }
    text(s, width-300, 100, 60, 200);
  }
  void construct_from_prufer_code(){
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
boolean doesnt_appear(int val, int array[], int start_pos, int length){
  boolean result = true;
  for(int a = start_pos; a < length; a++){
    if(val == array[a]) result = false;
  }
  return result;
}