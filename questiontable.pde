void generateQuestion()
{
  firstNumber = int(random(1, 10));
  secondNumber = int(random(1, 10));
  correctAnswer = firstNumber + secondNumber;

  answerDisplay = int(random(3));
  wrongAnswer1 = int(random(20));
  wrongAnswer2 = int(random(20));

  while (correctAnswer == wrongAnswer1 || correctAnswer == wrongAnswer2 || wrongAnswer1 == wrongAnswer2)
  {
    wrongAnswer1 = int(random(20));
    wrongAnswer2 = int(random(20));
  }
}


void correctAnswer()
{



  if (userAnswer == 2)
  {

    nextQuestionButton();
  }
}



void wrongAnswer()

{

  if (userAnswer == 1)
  {

    textAlign(CENTER);
    fill(#FFA500);
    textFont(font);
    text("Wrong Answer. The correct answer is: " + correctAnswer, width/2, 65);



    nextQuestionButton();
  }
}

void nextQuestionButton()
{
  //  fill(#FFA500);
  //  rect(width/2, height/2, 200, 40);
  //
  //  fill(255);
  //  text("Next Question", width/2, 180);
  nextQuestionButton = true;
  generateQuestion();
  //  quest=2;
  userAnswer = 0;
}
