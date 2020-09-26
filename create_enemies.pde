void createEnemies(int level)
{
  int numberOfenemies=0;
  int enemiesPerRow=0;
  int enemyWidth=0;
  int enemyHeight=0;
  int Start_ypos=0; 
  int Min=0;
  int Max=0;

  switch(level)
  {
  case 1:   
    numberOfenemies = 8;
    enemiesPerRow = 8;
    enemyWidth = 150;
    enemyHeight = 200;
    Start_ypos = 40; 
    Min=1;
    Max=50;
    //    noQ=numberOfenemies/2;
    break;

  case 2:   
    numberOfenemies = 12;
    enemiesPerRow = 12;
    enemyWidth = 150;
    enemyHeight = 200;
    Start_ypos = 40;
    Min=1;
    Max=30;
    break;
  }

  enemy_settings = new enemy_setting[numberOfenemies];
  for (int i=0; i<numberOfenemies; i++)
  {
    int rowNum = i/enemiesPerRow;
    // coords

    int x = enemyWidth*i+50;
    x -= rowNum*enemiesPerRow*enemyWidth;

    int y = Start_ypos+i/enemiesPerRow*enemyHeight;
    //    int y = yenemy_settings+i/enemy_settingsPerRow*enemy_settingHeight;
    // create enemy_setting
    enemy_settings[i] = new enemy_setting(x, y, enemyWidth, enemyHeight, Min, Max);
  }
}
