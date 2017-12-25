class Graph{
  Node[] nodes;
  Edge[] edges;
  int node_count;
  int edge_count;
  int father_code[][];
  //int prufer_code[];

  Graph(int node_countTemp, int edge_countTemp){
    node_count = node_countTemp;
    edge_count = edge_countTemp;
    nodes = new Node[node_count];
    edges = new Edge[edge_count];
    father_code = new int[2][edge_count];
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
      edges[a] = new Edge(nodes[start], nodes[end], 0);
    }
    for(int a = 0; a < node_count; a++){
      int degree = get_degree_from_father_code(a);
      nodes[a].define_neighbors(degree);
      initialize_nodes(nodes[a]);
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
      s += (father_code[0][a] + " " + father_code[1][a] + " " + edges[a].weight + "\n");
    }
    text(s, width-300, 100, 60, 500);
  }

  void initialize_nodes(Node a){
    int counter = 0;
    /*for(int b = 0; b < 2; b++){
      for(int c = 0; c < edge_count; c++){
        if(father_code[b][c] == a){
          nodes[a].neighbors[counter] = father_code[neighbor_row(b)][c];
          counter++;//
        }
      }
    }*/
    for(int b = 0; b < 2; b++){
      for(int c = 0; c < edge_count; c++){        
        if(edges[c].nodes[b] == a){
          a.neighbors[counter] = edges[c].nodes[neighbor_row(b)];
          counter++;
        }
      }
    }
  }
  int get_degree_from_father_code(int a){
    int degree = 0;
    for(int b = 0; b < 2; b++){
      for(int c = 0; c < edge_count; c++){
        if(father_code[b][c] ==a) degree++;
      }
    }
    return degree;
  }

  /*void add_edge(Node start, Node end){
    
  }*/
}



class Tree extends Graph{
  int prufer_code[];

  Tree(int node_countTemp, int edge_countTemp){
    super(node_countTemp, edge_countTemp);
    prufer_code = new int[edge_count-1];
  }

  void draw_from_father_code(){
    super.draw_from_father_code();
  }

  void draw_nodes(){
    super.draw_nodes();
  }

  void draw_edges(){
    super.draw_edges();
  }

  void initialize_nodes(Node a){
    super.initialize_nodes(a);
  }

  int get_degree_from_father_code(int a){
    return super.get_degree_from_father_code(a);
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


class Bipartite extends Tree{
  int spacing;
  int startX;
  int startY;
  int column_distance;

  Bipartite(int node_countTemp, int edge_countTemp){
    super(node_countTemp, edge_countTemp);
    spacing = 20;
    startX = 100;
    startY = 100;
    column_distance = 200;

    for(int a = 0; a < node_count/2; a++){
      int nodeY = startY + a * spacing;
      //int degree = get_degree_from_father_code(a);
      nodes[a] = new Node(startX, nodeY, 0);
    }
    for(int a = node_count/2; a < node_count; a++){
      int nodeY = startY + (a - node_count/2) * spacing;
      //int degree = get_degree_from_father_code(a);
      nodes[a] = new Node(startX + column_distance, nodeY, 0);
    }
    for(int a = 0; a < 2; a++){
      for(int b = 0; b < edge_count; b++){
        father_code[a][b] = 0;
      }
    }
  }

   Bipartite(int node_countTemp, int edge_countTemp, int startXTemp, int startYTemp, int spacingTemp, int column_distanceTemp){
    super(node_countTemp, edge_countTemp);
    spacing = spacingTemp;
    startX = startXTemp;
    startY = startYTemp;
    column_distance = column_distanceTemp;
    for(int a = 0; a < node_count/2; a++){
      int nodeY = startY + a * spacing;
      nodes[a] = new Node(startX, nodeY, 0);
    }
    for(int a = node_count/2; a < node_count; a++){
      int nodeY = startY + (a - node_count/2) * spacing;
      nodes[a] = new Node(startX + column_distance, nodeY, 0);
    }
    for(int a = 0; a < 2; a++){
      for(int b = 0; b < edge_count; b++){
        father_code[a][b] = 0;
      }
    }
  }

  void draw_from_father_code(){
    super.draw_from_father_code();
  }

  void draw_nodes(){
    super.draw_nodes();
  }

  void draw_edges(){
    super.draw_edges();
  }

  void construct_from_prufer_code(){
    super.construct_from_prufer_code();
  }

  void initialize_nodes(Node a){
    super.initialize_nodes(a);
  }

  int get_degree_from_father_code(int a){
    return super.get_degree_from_father_code(a);
  }
}


boolean doesnt_appear(int val, int array[], int start_pos, int length){
  boolean result = true;
  for(int a = start_pos; a < length; a++){
    if(val == array[a]) result = false;
  }
  return result;
}

int neighbor_row(int a){
  if(a == 1) a = 0;
  else a = 1;
  return a;
}