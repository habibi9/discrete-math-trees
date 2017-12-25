Tree tree;
Graph graph;

//int graph_father_code[][] = {{0, 0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 3, 3, 4}, 
//							   {1, 2, 3, 4, 5, 2, 3, 4, 5, 3, 4, 5, 4, 5, 5}};
//int graph_father_code[][];
int node_count = 6;
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
	int edge_counter = 0;
	while(edge_counter < 5){
		for(int a = 0; a < graph.edge_count; a++){
			if(!determine_path(graph.edges[a].nodes[0], graph.edges[a].nodes[1])){
				tree.edges[edge_counter] = graph.edges[a];
				tree.edges[edge_counter].edgeColor = color(255, 0, 0);
				edge_counter++;
				if(edge_counter >= 5) break;
			}
		}
	}
	for(int a = 0; a < node_count; a++){
		tree.nodes[a] = graph.nodes[a];
	}
	tree.draw_edges();
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
		for(int b = 0; b < node.degree; b++){
			Node node_temp = tree.nodes[node.neighbors[b]];
			if(!neighbors_list.contains(node_temp) && !nodes_list.contains(node_temp)){
				neighbors_list.add(node_temp);
			}
		}
	}
	return neighbors_list;
}

void bubble_sort_by_weight(Edge edge[], int length){
	for(int a = 0; a < length-1; a++){
		for(int b = a+1; b < length; b++){
			if(edge[a].weight > edge[b].weight){
				Edge temp = edge[a];
				edge[a] = edge[b];
				edge[b] = temp;
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