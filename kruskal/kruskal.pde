Tree tree;
Bipartite graph;
int node_count = 4;
int edge_count = 6;
int prufer_code[] = {6, 0, 2, 6, 2, 9, 9, 2};
int father_code[][] = {{0, 1, 2, 3, 2, 3},
					   {1, 2, 3, 0, 0, 1}};
int graph_code[][] = {{0, 1, 2, 3}, {7, 6, 5, 4}};
void setup() {
	size(1920, 1080);
	fill(255);
	rect(10, 10, width-400, height-20);
	tree = new Tree(node_count, edge_count);
	graph = new Bipartite(8, 4, 100, 100, 100, 400);
//	tree.draw_nodes();
	graph.draw_nodes();
	//tree.prufer_code = prufer_code;
//	tree.father_code = father_code;
	graph.father_code = graph_code;
	//tree.construct_from_prufer_code();
//	tree.draw_from_father_code();
	graph.draw_from_father_code();
}

void draw() {

}