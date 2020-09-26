void start_game() 
{
  //massive_war.play();  //play sound
  // int rectangle;

  image(l1screen, 0, 0, 1400, 800);  //display and stretch image
  rectMode(CENTER);
  fill(#C03FDE);
  rect((width/2)-20, 0, 200, 70);
  fill(0);
  text("Level:" +level, (width/2)-20, 25);

  textFont(font, 24); 
  fill(255);
  //  text("Level "+level+"" , 0, 30); 
  text("Lives remaining:"+playerLives, width-250, 30); 
  if (playerLives<=0)  
  {
    textFont(font, 30); 
    fill(255);
    text("You lose !", width/2-100, height/2);
  }

  if (level==3)
  {
    textFont(font, 30); 
    fill(255);
    text("Congratulations !!", width/2-100, height/2); 
    text("Game Over !", width/2-100, height/2+50);
  }
  if (createenemy_settings==true) { 
    createEnemies(level);
    //    createenemy_settings=false;
  }


  for (int i=0; i<enemy_settings.length; i+=2)//refresh all enemy_settings
  {
    enemy_settings[i].setEnemy();
  }

  if (level<4)
  {
    createenemy_settings=true;
    for (int i=0; i<enemy_settings.length; i+=2)//check if all enemy_settings are dead 
    {
      if (enemy_settings[i].isAlive==true) createenemy_settings=false;
    }

    if (createenemy_settings) {
      level++;
      j=0;
    }
  }
}
