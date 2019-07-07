//Mark Chen
//June 2019
//TEJ4M
//This program has 2 main functions. 
//You can play a single player version of Agario, or you can relax and watch a screensaver thing. In short, you can play a game, or be mesmerized.
//Additional Information: Agario is a game where the user moves around with the mouse, growing by touching balls of smaller size, and dying by touching a ball that is bigger than the user.
//Enjoy!


//This global variable will determine which mode of the program to run.
public String stateOfGame;

//Setup function
void setup() {
  //Start the program by running the main menu
  stateOfGame = "Main Menu";

  size(600, 500);
  noStroke();

  frameRate(100);

  //Initially fill the circular motion particle list with particles
  for (int partNum = 0; partNum<70; partNum++) {
    particles.add(new CircleMotion(0, 0, (int)(random(3)*2.0+3.0), c[floor(random(6))]));
  }
}


//The draw function runs specific part of the program/game based on what the mode should be
void draw() {

  //Checks which state of the program should be running, and runs that specific mode
  if (stateOfGame.equals("Main Menu")) {

    //Resets some variables to repeat special effect (see CreditsAndMenu file)
    wordCount = 0;
    out = "";

    menu();
  } else if (stateOfGame.equals("Agario")) {
    agarioGame();
  } else if (stateOfGame.equals("Cursor")) {
    cursorMotion();
  } else if (stateOfGame.equals("Credits")) {
    credits();
  }
}

//This function listens for any keyboard action
void keyPressed() {
  //Whenever the agario game terminates, or the state of the program is not the main menu, the listener will look for M/m
  if (gameOver || stateOfGame.equals("Cursor") || stateOfGame.equals("Credits")) {

    //If M/m is pressed, the program will go back to the main menu
    if (key == 'M' || key == 'm') {
      stateOfGame = "Main Menu";

      if (gameOver) {
        //Reset variables for agario game to play again if desired
        gameOver=false;
        score = 0;
        playerRadius = 20;
        balls.clear();
      }
    }
  }
}
