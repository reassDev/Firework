ArrayList<Rocket> rockets = new ArrayList<Rocket>(); // Initializes the ArrayList of Rockets

int lastRocketTime = 0; // Time since last rocket
int rocketInterval = 100; // Time between rockets (in milliseconds)

void setup() {
  size(1000, 1000);
}

void draw() {
  background(20, 30, 40);
  if(millis() - lastRocketTime > rocketInterval) { // Checks if rocketInterval time has passed since last rocket
    rockets.add(new Rocket()); // If true, adds another rocket to create
    lastRocketTime = millis(); // Sets last rocket time to current time
  }
  createRockets(); // Runs the function to create the rockets
}

void createRockets() { // Function to create the rockets
  for (int i = rockets.size() - 1; i >= 0; i--) { // Loops through the amount of rockets
    Rocket rocket = rockets.get(i); // Gets rocket
    rocket.shouldExplode(); // Checks if it should explode yet

    if (rocket.exploded && rocket.alpha <= 0) {
      rockets.remove(i); // Removes the rocket if it has exploded
    }
  }
}
