class Bullet {
  int xpos, ypos, direction;
  color bullet_col;
  boolean Alive;

  Bullet(int xpos, int ypos, int direction, color bullet_col) {
    this.xpos = xpos;
    this.ypos = ypos;
    this.bullet_col=bullet_col;
    this.direction=direction;
    Alive=true;
  }

  void draw()
  {
    if (Alive) 
    {  
      bullet_color=bullet_col;
      stroke(bullet_col);
      fill(bullet_col);
      ellipse(xpos, ypos, 10, 10);
      ypos +=direction*speedy;
      hit_player1();
      hit_ans();
    }
  }

  void hit_player1()
  {
    if (bullet_col==#FF0D21) // enemy is shooting
    {
      //      text("die now", (width/2), height/2);
      if (ypos+10>610 && ypos+10<700 && (xpos+10>playerX && xpos+10< playerX+150) && playerLives>0 && playerIsHere==true)
      {
        // text("die now", (width/2), height/2);
        isPlayerAlive=false;
        playerLives--;
        //        Alive=false;
        explode();
      }
    }
  }

  void hit_ans()
  {
    if (bullet_col==#0D26FC) // player is shooting
    {
      for (int i=0; i<enemy_settings.length; i+=2)//check if the laser is touching enemy_settings
      { 
        int py=enemy_settings[i].y;
        int py2=enemy_settings[i].y+enemy_settings[i].h;
        int px=enemy_settings[i].x;

        //        rect (px+20, 280, 50, 50);
        //        rect (px+110, 280, 50, 50);
        //        rect (px+190, 280, 50, 50);

        //rect (x1+50,goody,50,50);
        //rect (x1+100,goody,50,50);

        if (ypos+10 >= py && ypos+10<=py2  && ( xpos+10 >= enemy_settings[i].x && xpos+10 <= enemy_settings[i].x+enemy_settings[i].w))
        {

          if (enemy_settings[i].isAlive)
          { 
            //            rect (px+20, 280, 50, 50);
            //            rect (px+110, 280, 50, 50);
            //            rect (px+190, 280, 50, 50);
            //            text(goodx1, width/2, height/2);
            //        text(goodx2, (width/2)+100, height/2);
            if (answerDisplay == 0 && ypos < 280) {
              bullets.remove(i);
              enemy_settings[i].die();
              nextQuestionButton();
            } else if (answerDisplay == 1 && ypos < 280)
            {
              bullets.remove(i);
              enemy_settings[i].die();
              nextQuestionButton();
            } else if (answerDisplay == 2 && ypos < 280)
            {
              bullets.remove(i);
              enemy_settings[i].die();
              nextQuestionButton();
            }
          }
        }
      }
    }
  }
}
