//Runs the "Sleep mode" particles
//Not really complex, but I used an advanced for-loop, and played with the concepts of object lists


//Particle list for circle motion particles
public ArrayList<CircleMotion> particles = new ArrayList();

//Colour array for particle colour generation - cool blue colour themed
public color[] c = {color(0, 0, 255), color(30, 140, 250), color(40, 200, 240), color(60, 220, 220), color(135, 200, 240), color(80, 0, 180)};

//This method runs the particle circular motion animation
void cursorMotion() {

  //Instruction for when the user wishes to quit this mode
  fill(150);
  textAlign(CENTER, CENTER);
  textSize(20);
  text("PRESS M TO GO BACK TO THE MENU", width/2, height-25);


  //Tainted background to add tail effect to particles
  fill(250, 250, 255, 5);
  rect(width/2, height/2, 2*width, 2*height);


  //Draw the particles in the list of "particles"
  for (CircleMotion particle : particles) {
    particle.update();
  }

  //Every given time interval, a random (to user it is random, but it is the particle at the beginning of the list - the oldest one) particle is removed
  if (frameCount%40==0) {
    //Remove the oldest particle
    particles.remove(0);

    //Replace the deleted particle with a new particle
    particles.add(new CircleMotion(0, 0, (int)(random(3)*2.0+2.0), c[floor(random(6))]));
  }
}
