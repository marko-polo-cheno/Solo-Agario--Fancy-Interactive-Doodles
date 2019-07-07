//CircleMotion Class
//This class will maintain the motion of particles around the cursor in a cool way
//Complex points ~ Advanced math used for circular motion ~ class includes many attributes

class CircleMotion {

  //Attributes
  int radius;
  float xPos, yPos, distFromMid, radians, velocity;
  color colour;
  float[] lastPoint = new float[2];

  //Primary Constructor for a particle
  public CircleMotion(float xPos, float yPos, int radius, color colour) {
    this.xPos = xPos;
    this.yPos = yPos;
    this.radius = radius;
    this.colour = colour;
    this.radians = (float) (Math.PI * random(2));
    this.velocity = random(0.005, 0.03);
    this.distFromMid = random(10, 150);
  }

  //This method updates the position of particles in circular motion
  void update() {

    //Updates the position of the particle, treated as time
    this.radians+=this.velocity;

    //Shifts all the particles to chase the cursor
    this.lastPoint[0] += (mouseX - this.lastPoint[0]) * 0.01;
    this.lastPoint[1] += (mouseY - this.lastPoint[1]) * 0.01;

    //Updates the position of the particle in the circular motion based on the time passed and velocity
    this.xPos = this.lastPoint[0] - (float) Math.cos(this.radians) * distFromMid;
    this.yPos = this.lastPoint[1] + (float) Math.sin(this.radians) * distFromMid;

    //Draws the particle
    fill(colour);
    ellipse(xPos, yPos, radius, radius);
  }
}
