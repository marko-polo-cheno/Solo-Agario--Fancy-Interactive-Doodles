/*
Included in this file: Credits, Menu, mouse listener, keyboard listener, and a homemade delay function
 */

//Complex stuff - Staggered text output - Menu system - Functions passing parameters

//Some important variables related to the Credits screen
int wordCount = 0;
String out = "";
String creds = "TEJ4M Processing Challenge.\nMark Chen\nJune 2019";
String text = "This program has 2 main functions. You can play a single player version of Agario (dodging larger balls and eating smaller ones), or you can relax and put on some soothing animations.";
String words[] = text.split(" ");


//This is the credits function which will show the credits
void credits() {

  //Display title and important info
  background(255);
  fill(0, 50, 230);
  textAlign(CENTER, CENTER);
  textSize(35);
  text(creds, width/2, height/5);

  //Display the program's message to users word by word
  textSize(25);

  //While there are words to be shown, add a word to the output that will be drawn
  if (wordCount<words.length) {
    //Delay the process a bit for visual coolness
    myDelay(100000000.0);

    //Append the next word in the message to the desired output
    out += words[wordCount] + " ";

    //Keep track of the index of the added word to move to the next word
    wordCount++;

    //Every 7 words, create a new line so the words do not go off screen
    if (wordCount%6==0) {
      out+= "\n";
    }
  } else {
    //When all the words in the message have been printed, give the user the instructions for going back to the menu
    myDelay(500000000.0);
    text("PRESS M TO GO BACK TO THE MENU", width/2, height/2+200);
  }

  //Print out the message word by word
  text(out, width/2, height/2+60);
}

/////

//This is the menu function that displayes the main menu
void menu() {

  background(155);
  rectMode(CENTER);
  fill(0);

  //We have round rectangles drawn as buttons
  for (int verticalPosition = 1; verticalPosition < 4; verticalPosition++) {
    rect(width/2, verticalPosition*100+100, 200, 40, 50);
  }

  //Show the title of the screen ~ Main Menu
  textSize(40);
  fill(millis()/4%255);
  text("A Spectacular Main Menu", width/2, 60);

  //Display text on top of te buttons for user's to click
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(25);
  text("Agario", width/2, 200);
  text("Sleep Mode", width/2, 300);
  text("Credits + Info", width/2, 400);
}

//This method will run when a mouse button is pressed
void mouseClicked() {
  //The method will only consider any mouse clicking interaction when the main menu is running
  if (stateOfGame.equals("Main Menu")) {

    //Get the desired game state of the user
    int state = buttonPressed();

    //Based on the state that the user chooses, change the mode of the program to be what the user wants
    if (state==1) {
      playerRadius = 20;
      stateOfGame = "Agario";
    } else if (state==2) {
      stateOfGame = "Cursor";
    } else if (state==3) {
      stateOfGame = "Credits";
    }
  }
}

//This method will return a game state as an integer representing what the user wants
int buttonPressed() {
  //A button is only clicked if the horizontal position of the mouse, when clicked, is within a certian range
  if (mouseX>width/2-100 && mouseX<width/2+100) {
    //Based on the vertical position of the mouse during the click, determine which mode the user wants
    if (mouseY<220 && mouseY>180) {
      background(0);
      return 1;
    } else if (mouseY<320 && mouseY>280) {
      background(0);
      return 2;
    } else if (mouseY<420 && mouseY>380) {
      background(0);
      return 3;
    } else {
      return -1;
    }
  } else {
    //If no condiiton is satisfied, return a value that will act as if the click is ignored
    return -1;
  }
}

//This is a delay function
//It takes a numerical time parameter, and the function will do nothing for a "time" number of times
//The duration of the delay is probably proportional to the user's CPU speed
void myDelay(double time) {
  for (double x = 0.0; x<time; x+=1.0) {
    //Nothing, just delaying, cause I'm creative and Processing does not have a "delay" function
  }
}
