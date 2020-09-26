/***********************************************************************************
 *
 *  This code was written by Olubiyi OluwaTosin Gabriel
 *  
 *  Prototype of an educational game for kids.
 *  
 *  Copyright c) 2014 olubiyiontheweb.
 **********************************************************************************/


import TUIO.*;
import ddf.minim.*;
import java.util.*;
import gifAnimation.*;
import processing.sound.*;

TuioProcessing tuioClient;

//Mapping cursor to display with symbolid
HashMap <Integer, cursor> obj=new HashMap <Integer, cursor>();
HashMap <Integer, player> play=new HashMap <Integer, player>();
ArrayList <Bullet> bullets = new ArrayList();

Minim minim;    //loads required music and sound effects
SoundFile massive_war;

//Initialization
PImage front, menu, menu2, l1screen, options, player, help, about, enemy, rectangle, playermode;
Gif player_sample, explosion;
PFont tahomabold, AdobeArabic;
float x=100;
float y=600;
int screenid=0;
int fid;
//boolean shootanswer = false;
boolean stop = false;
enemy_setting[] enemy_settings;
boolean playerIsHere=false;



SoundFile bullet_sound;
boolean bang = false;
float speedy;
//float originx, originy;
PVector origin;
boolean correct=false;
boolean canShoot = true;
int shootdelay = 0;
PFont font;
//int opposy, opposx;

int firstNumber;
int secondNumber;
int correctAnswer;
int answerDisplay;
int wrongAnswer1;
int wrongAnswer2;
int goody;

int userScore;
int keeperScore;

int userAnswer;
boolean nextQuestionButton = false;

boolean isPlayerAlive=true;
int level=1; 
int playerLives=5;
//int playerHealth=100;
boolean createenemy_settings=false;
float time=60, j=0;

float playerX;
//float playerY=0;
color bullet_color;
int gamemode;



void setup () 
{

  size(1400, 800);

  //Initialising the Tuio object
  tuioClient  = new TuioProcessing(this);

  //initialising the Minim sound object
  minim = new Minim(this);

  //initializing objects by mapping file name to the constructor
  front = loadImage ("screen1.png");
  menu = loadImage ("screen2.png");
  menu2 = loadImage ("screen1.png");
  enemy = loadImage ("enemy.png");
  l1screen = loadImage ("screen7.png");
  options = loadImage ("screen4.png");
  help = loadImage ("screen3.png");
  about = loadImage ("screen5.png");
  player = loadImage ("player.png");
  rectangle = loadImage ("rectangle.png");
  playermode = loadImage ("screen6.png");
  //  Gif player_sample = new Gif(this, "su-22.gif");
  //  player_sample = Gif.getPImages(this, "su-22.gif");
  player_sample = new Gif(this, "su-22.gif");
  massive_war = new SoundFile(this, "massive_war.mp3");
  tahomabold = loadFont("Tahoma-Bold-48.vlw");
  AdobeArabic = loadFont("AdobeArabic-Bold-48.vlw");
  player_sample.play();

  Gif Animation = new Gif(this, "BigExplosion.gif");
  explosion=Animation;
  explosion.noLoop();

  createEnemies(1); // initializing the level
  //  bullets=new Bullet[5000];

  speedy = 50;
  minim = new Minim(this);
  bullet_sound = new SoundFile(this, "laser.wav");

  image(front, 0, 0, 1400, 800);  //draw and stretch image

  fill (0);
  rect(100, 600, 1150, 50, 7);  //draw rect with curved edges

  //text customization
  textFont(tahomabold);
  textSize(35);  
  fill(#FFFFFF);
  text("Game Loading", width/2, 550);



  font = loadFont("font-24.vlw");
  userScore = 0;
  userAnswer = 0;
  generateQuestion();
}

void draw ()
{
  // have all targets been hit?
  //  boolean allHit=true;

  //creating screen characteristics
  if (screenid==0) {
    int e;
    gload();
    //creating game loading limit
    if (x>1245) 
    {
      screenid=1;
    }
  }

  if (screenid==1) 
  {

    gselection(); //call game selection
    image(player_sample, 200, 250, 450, 500);
    // rect(1100, 525, 330, 50);
    // draw shape
    
    
    for (cursor o : obj.values ()) {
      o.draw_ellipse();
    }
  }
  


  if (screenid==2) {
    image(playermode, 0, 0, 1400, 800);  //draw and stretch image
    image(player_sample, 200, 250, 450, 500);
    //    shapeMode(CENTER);
    //    rect(855, 340, 310, 50);
    //    rect(855, 500, 310, 50);
    for (cursor o : obj.values ()) {
      o.draw_ellipse();
    }
  }

  if (screenid==6)
  {
    massive_war.stop();
    //    background(100);
    start_game();

    for (player p : play.values ()) {
      p.bring_player();
    }

    for (int i = 0; i < bullets.size (); i++) {
      Bullet bullet = (Bullet) bullets.get(i);
      bullet.draw();
    }

    //    for (enemy e: enemies) {
    //
    //      e.bring_enemy();
    //      //      e.shake_enemy(5);
    //    }
    //    opposy=int(random(240, 270));
    //    opposx=int(random(230, 260));
    //int[] number = new int[noQ*5]; //questions for each player
    //check_ans();
    updateBull();
    //    askQuestion();
    //    correctAnswer();
    wrongAnswer();
    showScore();
  }


  if (screenid==3) {
    image(options, 0, 0, 1400, 800);  //draw and stretch image



    image(player_sample, 200, 250, 450, 500);

    // draw shape
    for (cursor o : obj.values ()) {
      o.draw_ellipse();
    }
    //    rect(1100, 435, 100, 38);
    //    text("back to Main Menu", width/2, 700);

    if (stop==false)
    {
      text("OFF", 1110, 470);
    } else 
    {
      text("ON", 1110, 470);
      massive_war.play();
    }
  }

  if (screenid==4)
  {
    image(help, 0, 0, 1400, 800);  //draw and stretch image
    image(player_sample, 200, 250, 450, 500);
  }

  if (screenid==5)
  {
    image(about, 0, 0, 1400, 800);  //draw and stretch image
    image(player_sample, 200, 250, 450, 500);
  }
}


void gload() {
  noStroke();
  fill (#FACB49); 
  rect(x, y, 50, 50, 7);
  x= x + 10;
}

void updateBull() {
  shootdelay++;
  if (shootdelay >= 20) {
    canShoot = true;
  }
}

void player()
{
  ArrayList<TuioObject> tuioObjectList = tuioClient.getTuioObjectList();
  for (int i=0; i<tuioObjectList.size (); i++) {
    TuioObject tobj = tuioObjectList.get(i);
    //playerX = constrain(tobj.getScreenX(width), 150/3, width-(150/2));
    player p= new player(player, tobj.getScreenX(width), 610, 150, 150, fid);  //when a symbol is displayed, show a shape, creating identifier of the class cursor
    play.put(new Integer(fid), p);
    playerX=tobj.getScreenX(width);
    playerIsHere=true;
    //    playerY=610;
  }
}

void explode()
{
  time-=1;
  if (time>0) {
    explosion.play();
    image(explosion, playerX, 610, 150, 150);
  } else {
    explosion.stop();
    if (playerLives>0) {
      isPlayerAlive=true;
      time=60;
    }
  }
}

// called when a fiducial is added to the scene
void addTuioObject(TuioObject tobj) 
{
}

// called when a fiducial is removed from the scene
void removeTuioObject(TuioObject tobj) 
{
  fid = tobj.getSymbolID();  //assignment
  // when a symbol is removed, hide it
  obj.remove(new Integer(fid));
}

// called when a fiducial is moved
void updateTuioObject (TuioObject tobj) 
{
  fid = tobj.getSymbolID();  //assignment


  if (fid==1 && screenid==1) 
  {
    cursor o= new cursor(tobj.getScreenX(width), tobj.getScreenY(height), 40, 40, fid);  //when a symbol is displayed, show a shape, creating identifier of the class cursor
    obj.put(new Integer(fid), o);
    o= obj.get(new Integer(fid));  //creating identifier of the class cursor

    if (tobj.getAngleDegrees()>=20 && tobj.getScreenY(height)>240 && tobj.getScreenY(height)<285 && tobj.getScreenX(width)>845 && tobj.getScreenX(width)<1175)
    {
      screenid=2;
    } else if (tobj.getAngleDegrees()>=20 && tobj.getScreenY(height)>340 && tobj.getScreenY(height)<385 && tobj.getScreenX(width)>845 && tobj.getScreenX(width)<1175)
    {
      screenid=3;
    } else if (tobj.getAngleDegrees()>=20 && tobj.getScreenY(height)>433 && tobj.getScreenY(height)<478 && tobj.getScreenX(width)>845 && tobj.getScreenX(width)<1175)
    {
      screenid=4;
    } else if (tobj.getAngleDegrees()>=20 && tobj.getScreenY(height)>525 && tobj.getScreenY(height)<570 && tobj.getScreenX(width)>845 && tobj.getScreenX(width)<1175)
    {
      screenid=5;
    } else if (tobj.getAngleDegrees()>=20 && tobj.getScreenY(height)>625 && tobj.getScreenY(height)<670 && tobj.getScreenX(width)>845 && tobj.getScreenX(width)<1175) {
      exit();
    }
  }

  if (fid==1 && screenid==2) 
  {
    cursor o= new cursor(tobj.getScreenX(width), tobj.getScreenY(height), 40, 40, fid);  //when a symbol is displayed, show a shape, creating identifier of the class cursor
    obj.put(new Integer(fid), o);
    o= obj.get(new Integer(fid));  //creating identifier of the class cursor

    if (tobj.getAngleDegrees()>=20 && tobj.getScreenY(height)>340 && tobj.getScreenY(height)<390 && tobj.getScreenX(width)>855 && tobj.getScreenX(width)<1165)
    {
      gamemode=1;
      screenid=6;
    } else if (tobj.getAngleDegrees()>=20 && tobj.getScreenY(height)>500 && tobj.getScreenY(height)<550 && tobj.getScreenX(width)>855 && tobj.getScreenX(width)<1165)
    {
      gamemode=2;
      screenid=6;
    }
  }


  if (fid==3 && screenid==6) 
  {
    //    player p= new player(player, tobj.getScreenX(width), 610, 150, 150, fid);  //when a symbol is displayed, show a shape, creating identifier of the class cursor
    //    play.put(new Integer(fid), p);

    player();

    if (tobj.getAngleDegrees()>=40 && playerLives>0) 
    {      
      //player();
      bullet_sound.play();
      int x = tobj.getScreenX(width)+75; //x position of mouse
      int y = 550; //y position at top of image
      //      bullets[j]= new Bullet(x, 5, -1, #0D26FC);
      bullets.add(new Bullet(x, y, -1, #0D26FC));
      canShoot = false;
      shootdelay = 0;
    }
  }

  if (fid==6 && screenid==6 && gamemode==2)   //second player
  {
    //    player p= new player(player, tobj.getScreenX(width), 610, 150, 150, fid);  //when a symbol is displayed, show a shape, creating identifier of the class cursor
    //    play.put(new Integer(fid), p);

    player();

    if (tobj.getAngleDegrees()>=40 && playerLives>0) 
    {      
      //player();
      bullet_sound.play();
      int x = tobj.getScreenX(width)+75; //x position of mouse
      int y = 550; //y position at top of image
      //      bullets[j]= new Bullet(x, 5, -1, #0D26FC);
      bullets.add(new Bullet(x, y, -1, #0D26FC));
      canShoot = false;
      shootdelay = 0;
    }
  }

  if (fid==1 && screenid==3) 
  {
    cursor o= new cursor(tobj.getScreenX(width), tobj.getScreenY(height), 40, 40, fid);  //when a symbol is displayed, show a shape, creating identifier of the class cursor
    obj.put(new Integer(fid), o);
    o= obj.get(new Integer(fid));  //creating identifier of the class cursor

    if (tobj.getAngleDegrees()>=90 && tobj.getScreenY(height)>435 && tobj.getScreenY(height)<472 && tobj.getScreenX(width)>1100 && tobj.getScreenX(width)<1148)
    {
      if (stop==false) 
      {
        massive_war.stop();
        stop = true;
      } else 
      {
        //        massive_war.play();  //play sound
        stop=false;
      }
    }
  }

  if (fid==0) {
    screenid=1;
  }
}

// called when a cursor is added to the scene
void addTuioCursor(TuioCursor tcur) {
}

// called when a cursor is moved
void updateTuioCursor (TuioCursor tcur) {
}

// called when a cursor is removed from the scene
void removeTuioCursor(TuioCursor tcur) {
}

// called after each message bundle
// representing the end of an image frame
void refresh(TuioTime bundleTime) { 
  //redraw();
}
