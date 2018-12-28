import java.util.Stack;

int n =40;
ArrayList<Cell> grid;
Cell current;
int rows;
int cols;
Stack<Cell> stack;

void setup(){
  size(800,800);
  grid = new ArrayList<Cell>();
  rows = floor(width/n);
  cols = floor(height/n);
  stack = new Stack<Cell>();
 
  // add this to slow down generation
  //frameRate(5); 

  for(int i = 0; i < rows; i++){
    for(int j = 0; j < cols; j++){
      Cell cell = new Cell(i, j);
      grid.add(cell);
    }
  }
  
  current = grid.get(0);
}

void draw(){
  
  background(51);
  for(int i = 0; i < grid.size(); i++){
    grid.get(i).displayCell(n);
  }
  
  current.visited = true;
  current.highlight(n);
  Cell next = current.getNextNeighbor(grid, cols, rows);
  if(next != null){
    next.visited = true;
    stack.push(current);
    removeWalls(current, next);
    current = next;
  }else{
    if(!stack.isEmpty()){ current = stack.pop(); }
  }
    
}

void removeWalls(Cell current, Cell next){
  int y = current.j - next.j;
  int x = current.i - next.i;
  
  if(x == -1){ 
    current.walls[1] = false;
    next.walls[3] = false;
  }else if(x == 1){ 
    current.walls[3] = false;
    next.walls[1] = false;
  }else if(y == -1){ 
    current.walls[2] = false;
    next.walls[0] = false;
  }else if(y == 1){ 
    current.walls[0] = false;
    next.walls[2] = false;
  }
}
