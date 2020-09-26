class enemy_setting 
{
  Enemy enemy;
  boolean isAlive, explode;
  int x, y, w, h, timer=20;
  float time_to_attack;
  int MIN, MAX, dir;

  enemy_setting(int X, int Y, int W, int H, int min, int max)
  {
    enemy = new Enemy(W, H);
    enemy.setPosition(X, Y);
    isAlive = true;
    explode=false;
    MIN=min;
    MAX=max;
    time_to_attack=random(0, MAX);
    x=X;
    y=Y;
    w=W;
    h=H;
    if (time_to_attack<75) dir=1;
    else dir=-1;
  }

  void setEnemy()
  {
    if (isAlive==true)
    {
      if (level==2||level==3)
      {
        x+=dir*2;
        if ((x>width-w)||(x<0)) dir*=-1;
        enemy.setPosition(x, y);
      }


      enemy.drawEnemy();
      enemy.askQuestion();
      time_to_attack-=1;

      if (time_to_attack<0) 
      { 
        bullets.add(new Bullet(x+(w/2), y+h, 1, #FF0D21));
        time_to_attack=random(MIN, MAX);
      }
    } else if (explode)
    {
      timer-=1;
      if (timer>0) {
        explosion.play();
        image(explosion, x-(w/2), y-(h/2), w*2, h*2);
      } else {
        explosion.stop();
        explode=false;
        //generateQuestion();
      }
    }
  }



  void die() 
  {
    explode=true;
    isAlive = false;
  }
}
