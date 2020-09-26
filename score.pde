void showScore()
{
  rectMode(CENTER);
  fill(#F78B16);
  rect(0, 600, 300, 30);
  fill(255);
  textFont(font);
  text("Scored: " + userScore, 60, 610);
  //  text("Saved:" + keeperScore, 80, 330);
}
