Tree tree;
var node_count = 10;
var edge_count = 9;
//var father_code[][]= {{1, 2, 3, 4, 5, 6, 7, 8, 9},
//                      {0, 0, 0, 0, 0, 0, 0, 0, 0}};
var prufer_code[] = {6, 0, 2, 6, 2, 9, 9, 2, 0};
var counter = 0;
String s;
function setup() {
  createCanvas(1920, 1080);
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

function draw() {
  if(mouseIsPressed == true){
    if(touchX > width - 300 - 90 && touchX < width - 300 + 90 && mouseY > 300 - 30 && mouseY < 300 + 30){
      tree.draw_from_father_code();
    }
  }
  
}