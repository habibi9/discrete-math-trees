class Node{
	int nodeX;
	int nodeY;
	int nodeColor; 
	int degree;
 	Node neighbors[];
	Node(int nodeXTemp, int nodeYTemp, int nodeColorTemp){
		nodeX = nodeXTemp;
		nodeY = nodeYTemp;
		nodeColor = nodeColorTemp;
		//degree = 0;
	}
	void display(){
		fill(nodeColor);
		ellipse(nodeX, nodeY, 20, 20);
 	}

	void define_neighbors(int degreeTemp){
		degree = degreeTemp;
		neighbors = new Node[degree];
	}
}
