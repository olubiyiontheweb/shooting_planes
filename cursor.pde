class cursor 
{
  int x, y, xSize, ySize, fid=1;
  color fillCol, strokeCol;
  cursor(int xx, int yy, int sx, int sy, int fiducialid) 
  {
    x=xx; 
    y=yy; 
    xSize=sx; 
    ySize=sy;
    fid=fiducialid;
    fillCol=color(100);
    strokeCol=color(200);
  }

  void draw_ellipse() 
  {
    /* basic draw method - just draws a circle
     */

    fill(fillCol);
    stroke(strokeCol);
    strokeWeight(1);
    ellipse(x, y, xSize, ySize);
  }
}
