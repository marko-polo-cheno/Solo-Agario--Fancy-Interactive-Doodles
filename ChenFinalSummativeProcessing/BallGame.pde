//Agario Game


//Global variables for Agario game
public ArrayList<Ball> balls = new ArrayList();
public boolean gameOver = false;
public int score, playerXPos, playerYPos, playerRadius;

//This function handles the entire agario game
void agarioGame() {

  //Keep displaying the score while the game is still running
  if (!gameOver) {

    //Clear the sketch to a black background
    background(0);

    //Add balls over set interval of time based on population of balls
    if (frameCount%10 == 0 && balls.size()<40) {
      balls.add(new Ball());
    } else if (frameCount%40 == 0 && balls.size()>40) {
      balls.add(new Ball());
    }

    //Add to score over set interval of time
    if (frameCount%300==0) {
      score++;
    }

    //Run updated game data for all the balls
    for (int ballIndex=0; ballIndex<balls.size(); ballIndex++) {

      //Diplay all the balls with updated positions
      balls.get(ballIndex).displayBall();
      //Update a ball's attributes
      balls.get(ballIndex).updatePosition();

      //Check to see if a ball's state is "eaten" or outside of screen
      if (balls.get(ballIndex).eaten) {

        //Remove this ball if it is "eaten"
        balls.remove(ballIndex);
      } else if (
        balls.get(ballIndex).yPos > 1.25 * height || balls.get(ballIndex).yPos < -0.25 * height || 
        balls.get(ballIndex).xPos > 1.25 * width || balls.get(ballIndex).xPos < -0.25 * width) {

        //Remove this ball if it is too far off the user's visible screen
        balls.remove(ballIndex);
      }
    }

    fill(255);

    //Ball will smoothly follow the mouse's position
    playerXPos += (mouseX-playerXPos) * 0.1 ;
    playerYPos += (mouseY-playerYPos) * 0.1 ;

    //Draws the ball of the user
    ellipse(playerXPos, playerYPos, playerRadius, playerRadius);

    //Show the score
    textAlign(LEFT, CENTER);
    textSize(25);
    text("Score:  " + score, 30, 30);
  } else {
    //If the game is over, display related game over information
    fill(150);

    //Game over text
    textAlign(CENTER, CENTER);
    textSize(80);
    text("Game Over", width/2, height/2);

    //Instuction to return to menu
    textSize(30);
    text("PRESS M TO GO BACK TO THE MENU", width/2, height/2+200);
  }
}
