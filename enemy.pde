class Enemy 
{
  int enemy_width, enemy_height, x1, y1, Ex, Ey;

  Enemy(int W, int H) 
  {
    enemy_width = W;
    enemy_height = H;
  }

  void setPosition(int X, int Y) 
  {
    x1 = X;
    y1 = Y;
  }

  //
  void drawEnemy() {
    Ex=x1+(enemy_width/6);
    Ey=y1+20;
    //    goody=Ey+190;
    image(enemy, x1, y1, enemy_width, enemy_height);
    image(rectangle, Ex, Ey, enemy_width-50, enemy_height-125);
  }


  void askQuestion()
  {
    textAlign(CENTER);
    pushStyle();
    textSize(40);
    text(firstNumber, Ex+20, Ey+50);
    text("+", Ex+50, Ey+50);
    text(secondNumber, Ex+80, Ey+50);


    noStroke();
    fill(#F54223);
    rect(Ex, Ey+190, 50, 50);
    fill(#5323F5);
    rect(Ex+80, Ey+190, 50, 50);
    fill(#23F524);
    rect(Ex+160, Ey+190, 50, 50);


    popStyle();



    textSize(40);
    if (answerDisplay == 0)
    {

      text(wrongAnswer1, Ex, Ey+205);
      text(wrongAnswer2, Ex+80, Ey+205);
      text(correctAnswer, Ex+160, Ey+205);
    } else if (answerDisplay == 1)
    {

      text(wrongAnswer1, Ex, Ey+205);
      text(correctAnswer, Ex+80, Ey+205);
      text(wrongAnswer2, Ex+160, Ey+205);
    } else if (answerDisplay == 2)
    {

      text(correctAnswer, Ex, Ey+205);
      text(wrongAnswer1, Ex+80, Ey+205);
      text(wrongAnswer2, Ex+160, Ey+205);
    }
  }
}
