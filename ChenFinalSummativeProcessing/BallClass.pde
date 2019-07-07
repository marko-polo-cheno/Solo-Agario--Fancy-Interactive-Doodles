/*
Ball class
 A ball is used in the agario game as the objects that the user should avoid or consume if possible.
 Complex ~ Object collision detection
 */

class Ball {

  int side, r, g, b, radius;
  float xPos, yPos, directionX, directionY;
  boolean eaten;

  public Ball() {
    //Pick a random side to spawn on
    this.side = int(random(4));

    //Generate a ramdom colour
    this.r = int(random(256));
    this.b = int(random(256));
    this.g = int(random(256));

    //Create an appropriate size based on the player's size
    this.radius = int(random(playerRadius/2, playerRadius*2));

    //Give this ball a random direction to travel
    this.directionX = random(-PI, PI);
    this.directionY = random(-PI, PI);

    //Generation of initial ball spawn point
    if (this.side==0) {
      //Along the top border
      this.xPos = random(width);
      this.yPos = 0-this.radius/2;
    } else if (this.side==1) {
      //Along the left border
      this.xPos = 0-this.radius/2;
      this.yPos = random(height);
    } else if (this.side==2) {
      //Along the right border
      this.xPos = width+this.radius/2;
      this.yPos = random(height);
    } else {
      //Along the bottom border
      this.xPos = random(width);
      this.yPos = height+this.radius/2;
    }
  }

  /*
  This method will draw the ball object with respect to its colour and position and size.
   */
  public void displayBall() {
    //Fill the ball with the randomly generated colour from random RGB values
    fill(this.r, this.g, this.b);
    //Draw the ball at its position with its size
    ellipse(this.xPos, this.yPos, this.radius, this.radius);
  }

  /*
  This method updates the position of the ball to draw unless the game should terminate
   In other words, this method runs and continues tha game.
   */
  public void updatePosition() {

    //Update coordinates of ball
    this.xPos+=this.directionX;
    this.yPos+=this.directionY;

    //Check if player ball touches another ball based of distance between centres
    if (dist(this.xPos, this.yPos, playerXPos, playerYPos) < this.radius/2 + playerRadius/2) {

      //Toggle game over boolean if the game should terminate
      if (this.radius > playerRadius +1) {
        gameOver = true;
      } else {

        //Otherwise the ball is smaller than the player's and the player grows
        playerRadius+=1 + floor(this.radius/15);

        //Add to user's score
        score+=(playerRadius - radius) / 2;

        //Indicate that this ball has been eaten and should be removed from the game
        eaten = true;
      }
    }
  }
}
