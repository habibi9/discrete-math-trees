class Edge{
	Node[] nodes;
	int edgeX1;
	int edgeY1;
	int edgeX2;
	int edgeY2;
	int weight;
	color edgeColor;
 	Edge(Node node_1, Node node_2, int edgeColorTemp){
		/*edgeX1 = edgeX1Temp;
		edgeY1 = edgeY1Temp;
		edgeX2 = edgeX2Temp;
		edgeY2 = edgeY2Temp;*/
		nodes = new Node[2];
		nodes[0] = node_1;
		nodes[1] = node_2;
		edgeX1 = nodes[0].nodeX;
		edgeY1 = nodes[0].nodeY;
		edgeX2 = nodes[1].nodeX;
		edgeY2 = nodes[1].nodeY;
		edgeColor = edgeColorTemp;
		weight = int(dist(edgeX1, edgeY1, edgeX2, edgeY2));
 	}
	void display(){
		stroke(edgeColor);
		line(edgeX1, edgeY1, edgeX2, edgeY2);
	}
}