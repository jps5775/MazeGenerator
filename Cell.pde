class Cell{

  int i, j;
  boolean[] walls = {true,true,true,true};
  boolean visited = false;
  
  Cell(int i, int j){
    this.i = i;
    this.j = j;
  }
  
  Cell getNextNeighbor(ArrayList<Cell> grid, int cols, int rows){
    ArrayList<Cell> neighbors = new ArrayList<Cell>();
    Cell top = null;
    Cell right = null;
    Cell down = null;
    Cell left = null;
    
    if(index(i - 1, j, cols, rows) != -1){
      top = grid.get(index(i - 1, j, cols, rows));
    }
    if(index(i, j + 1, cols, rows) != -1){
      right = grid.get(index(i, j + 1, cols, rows));
    }
    if(index(i + 1, j, cols, rows) != -1){
      down = grid.get(index(i + 1, j, cols, rows));
    }
    if(index(i, j - 1, cols, rows) != -1){
      left = grid.get(index(i, j - 1, cols, rows));
    }
    
    if(top != null && !top.visited){
      neighbors.add(top);
    }
    if(right != null && !right.visited){
      neighbors.add(right);
    }
    if(down != null && !down.visited){
      neighbors.add(down);
    }
    if(left != null && !left.visited){
      neighbors.add(left);
    }
    
    if(neighbors.size() > 0){
      int num = floor(random(neighbors.size()));
      return neighbors.get(num);
    }
    
    return null;
  }
  
  int index(int i, int j, int cols, int rows){
    if(i < 0 || j < 0 || j > cols-1 || i > rows-1){
      return -1;
    }
    return j + i * cols; 
  }
  
  void displayCell(int n){
    int x = this.i*n;
    int y = this.j*n;
    
    stroke(255);
    
    if(walls[0]){
      line(x,y,x+n,y);
    }
    if(walls[1]){
      line(x+n,y,x+n,y+n);
    }
    if(walls[2]){
      line(x+n,y+n,x,y+n);
    }
    if(walls[3]){
      line(x,y+n,x,y);
    }
    
    if(this.visited){
      noStroke();
      fill(255,0,255,100);
      rect(x,y,n,n);
    }
  }
  
  void highlight(int n){
    int x = this.i*n;
    int y = this.j*n;
    
    noStroke();
    fill(0,0,255,100);
    rect(x,y,n,n);
  }
  

}
