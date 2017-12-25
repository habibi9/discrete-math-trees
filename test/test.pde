Graph graph;

//int prufer_code[] = {};
int father_code[][] = {{1, 2, 0}, 
					   {0, 1, 2}};

void setup() {
	size(1920, 1080);
	fill(255);
	rect(10, 10, width-400, height-20);

	graph = new Graph(3, 3);

	graph.draw_nodes();

	graph.father_code = father_code;

	graph.draw_from_father_code();
}
void draw(){

}


