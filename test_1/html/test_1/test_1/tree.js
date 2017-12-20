class Tree{
  Node[] nodes;
  Edge[] edges;
  var node_count;
  var edge_count;
  var father_code[][];
  var prufer_code[];
  Tree(var node_countTemp, var edge_countTemp){
    node_count = node_countTemp;
    edge_count = edge_countTemp;
    nodes = new Node[node_count];
    edges = new Edge[edge_count];
    father_code = new var[2][edge_count];
    //father_code = new Array[2];
    for(var a = 0; a < node_count; a++){
      var nodeX = var(random(10, width - 400));
      var nodeY = var(random(10, height - 10));
      nodes[a] = new Node(nodeX, nodeY, 0);
    }
    for(var a = 0; a < 2; a++){
      for(var b = 0; b < edge_count; b++){
        father_code[a][b] = 0;
      }
    }
  }
  function draw_from_father_code(){
    for(var a = 0; a < edge_count; a++){
      var start = father_code[0][a];
      var end = father_code[1][a];
      edges[a] = new Edge(nodes[start].nodeX, nodes[start].nodeY, nodes[end].nodeX, nodes[end].nodeY, 0);
    }
    draw_edges();
  }
  function draw_nodes(){
    for(var a = 0; a < node_count; a++){
      fill(0);
      text(str(a), float(nodes[a].nodeX+20), float(nodes[a].nodeY), 20.0, 20.0);
      nodes[a].display();
    }
  }
  function draw_edges(){
    String s = "";
    for(var a = 0; a < edge_count; a++){
      edges[a].display();
      s += (father_code[0][a] + " " + father_code[1][a] + "\n");
    }
    text(s, width-300, 100, 60, 200);
  }
  function construct_from_prufer_code(){
    for(var a = 0; a < edge_count-1; a++){
      father_code[1][a] = prufer_code[a];
    }
    for(var a = 0; a < edge_count; a++){
      var val = 1;
      while (doesnt_appear(val, father_code[1], a, edge_count) == false || doesnt_appear(val, father_code[0], 0, a) == false){
        val++;
      }
      father_code[0][a] = val;
    }
  }
}
boolean doesnt_appear(var val, var array[], var start_pos, var length){
  boolean result = true;
  for(var a = start_pos; a < length; a++){
    if(val == array[a]) result = false;
  }
  return result;
}