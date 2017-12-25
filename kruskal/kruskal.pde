Tree tree;
Graph graph;

//int graph_father_code[][] = {{0, 0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 3, 3, 4}, 
//							   {1, 2, 3, 4, 5, 2, 3, 4, 5, 3, 4, 5, 4, 5, 5}};
//int graph_father_code[][];
int node_count = 10;
void setup() {
	size(1920, 1080);
	fill(255);
	rect(10, 10, width-400, height-20);


	graph = new Graph(node_count, combination(node_count, 2));
	tree = new Tree(node_count, node_count-1);

	graph.draw_nodes();

	int counter = 0;
	while(counter < graph.edge_count){
		for(int b = 0; b < graph.node_count; b++){
			for(int c = b + 1; c < graph.node_count; c++){
				graph.father_code[0][counter] = b;
				graph.father_code[1][counter] = c;
				counter++;
			}
		}
	}
	graph.draw_from_father_code();
	bubble_sort_by_weight(graph.edges, graph.edge_count);

	for(int a = 0; a < graph.node_count; a++){
		//tree.nodes.replace(new Node(graph.nodes.get(a).nodeX, graph.nodes.get(a).nodeY, a, color(0, 0, 255)));
		tree.nodes.get(a).nodeX = graph.nodes.get(a).nodeX;
		tree.nodes.get(a).nodeY = graph.nodes.get(a).nodeY;
		tree.nodes.get(a).uid = graph.nodes.get(a).uid;
		tree.nodes.get(a).nodeColor = color(0, 0, 255);

	}

	int edge_counter = 0;
	while(edge_counter < tree.edge_count){
		for(Edge edge: graph.edges){
			if(!determine_path(tree.nodes.get(edge.nodes[0].uid), tree.nodes.get(edge.nodes[1].uid))){
				Edge edge_temp = edge;
				edge_temp.edgeColor = color(255, 0, 0);
				for(Node node: tree.nodes){
					for(int a = 0; a < 2; a++){
						if(node.uid == edge_temp.nodes[a].uid){
							edge_temp.nodes[a] = node;
							node.degree++;
							//node.neighbors.add(edge_temp.nodes[1-a]);
						}
					}
				}
				tree.edges.add(edge_temp);
				tree.initialize_nodes();
				/*tree.father_code[0][a] = get_graph_index(tree.edges[a].nodes[0]);
				tree.father_code[1][a] = get_graph_index(tree.edges[a].nodes[1]);
				tree.draw_from_father_code();*/
				edge_counter++;
				//if(edge_counter >= 5) break;
			}
			else{
				println("error");
			}
		}
	}
	/*for(int a = 0; a < node_count; a++){
		tree.nodes[a] = graph.nodes[a];
	}*/
	
	tree.draw_nodes();
	tree.draw_edges();
	// tree.draw_from_father_code();
	String s = determine_path(tree.nodes.get(0), tree.nodes.get(1)) ? "yes" : "no";
	println(s);
}

void draw() {
	
}

boolean determine_path(Node start, Node end){
	ArrayList<Node> list = new ArrayList<Node>();
	list.add(start);
	while(!list.contains(end)){
		ArrayList temp = list_neighbors(list);
		if(temp.size() == 0){
			return false;
		}
		list.addAll(temp);
	}
	return true;
}
ArrayList list_neighbors(ArrayList<Node> nodes_list){
	ArrayList<Node> neighbors_list = new ArrayList<Node>();
	for(Node node : nodes_list){
		if(!node.neighbors.isEmpty()){
			for(Node neighbor: node.neighbors){
				Node node_temp = neighbor;
				if(!neighbors_list.contains(node_temp) && !nodes_list.contains(node_temp)){
					neighbors_list.add(node_temp);
				}
			}
		}
	}
	return neighbors_list;
}

void bubble_sort_by_weight(ArrayList<Edge> edge, int length){
	for(int a = 0; a < edge.size()-1; a++){
		for(int b = a+1; b < edge.size(); b++){
			if(edge.get(a).weight > edge.get(b).weight){
				Edge temp = edge.get(a);
				//edge.get(a) = edge.get(b);
				edge.set(a, edge.get(b));
				edge.set(b, temp);
			}
		}
	}
}

int combination(int i, int j){
	int result = 1;
	for(int a = i - j + 1; a <= i; a++){
		result *= a;
	}
	for(int a = 1; a <= j; a++){
		result /= a;
	}
	return result;
}

/*int get_graph_index(Node node){
	for(int a = 0; a < graph.node_count; a++){
		if(graph.nodes[a] == node){
			return a;
		}
	}
	return 0;
}*/