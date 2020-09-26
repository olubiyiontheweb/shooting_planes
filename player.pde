class player {
  float x=500;
  int y=500, xSize, fid=2;
  PImage playing;  

  player(PImage players, float xx, int yy, int sx, int sy, int fiducialid) 
  {
    x=xx;
    y=yy; 
    xSize=sx;
    fid=fiducialid;
    playing=players;
  };


  void bring_player()
  {
    image(playing, x, y, xSize, xSize);
  }



  void bring_2player()
  {
    image(playing, x, y, xSize, xSize);
  }
}
