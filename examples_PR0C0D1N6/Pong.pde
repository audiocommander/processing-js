// Written by Casey Reas and Ben Fry
// Adapted for PR0C0D1N6 and added motion control by Michael Markert

int s = (int)(width/40);
float ball_x;
float ball_y;
float ball_dir = 1;
float ball_size = s;  // Radius
float dy = 0;  // Direction
float startSpeed = 4;
float speed = startSpeed;
int r = (int)(random(255));
int g = (int)(random(200));
int b = (int)(random(255));
Color bgclr = color(r,g,b);
Color fillclr = color(#00FF00);

// Global variables for the paddle
int paddle_width = s;
int paddle_height = paddle_width*4;
float paddle_y = 0;
int dist_wall = paddle_height;

void setup() {
   //size(400, 400);
   rectMode(CENTER_RADIUS);
   ellipseMode(CENTER_RADIUS);
   noStroke();
   smooth();
   ball_y = height/2;
   ball_x = 1;
}

void draw() {
   background(bgclr);
   
   ball_x += ball_dir * speed;
   ball_y += dy;
   if(ball_x > width+ball_size) {
      ball_x = -width/2 - ball_size;
      ball_y = random(0, height);
      dy = 0;
      speed = startSpeed;
   }
   
   // Constrain paddle to screen
   //float paddle_y = constrain(mouseY, paddle_height, height-paddle_height);
   float prev_paddle_y = paddle_y;
   if(orientation.compassAccuracy > 0) {
      // this device has a gyroscope!
      if(window.orientation == -90) {
         paddle_y = map(orientation.gamma,-30,45,(height/2)*-1,height/2);
      } else if(window.orientation == 90) {
         paddle_y = map(orientation.gamma,45,-30,(height/2)*-1,height/2);
      } else if(window.orientation == 180) {
         paddle_y = map(orientation.beta,0,-40,(height/2)*-1,height/2);
      } else {
         paddle_y = map(orientation.beta,0,40,(height/2)*-1,height/2);
      }
   } else {
      // no gyro, need to fall back to accelerometer data
      if(window.orientation == -90) {
         paddle_y = map(acceleration.x,3,7,(height/2)*-1,height/2);
      } else if(window.orientation == 90) {
         paddle_y = map(acceleration.x,-3,-7,(height/2)*-1,height/2);
      } else if(window.orientation == 180) {
         paddle_y = map(acceleration.y,3,7,(height/2)*-1,height/2);
      } else {
         paddle_y = map(acceleration.y,-3,-7,(height/2)*-1,height/2);
      }
   }
   // restrict to size
   paddle_y = constrain(paddle_y,0,height);
   
   // Test to see if the ball is touching the paddle
   float py = width-dist_wall-paddle_width-ball_size;
   if(ball_x >= py 
      && ball_y > paddle_y - paddle_height - ball_size 
      && ball_y < paddle_y + paddle_height + ball_size) 
   {
      ball_dir *= -1;
      if(paddle_y != prev_paddle_y) {     
         dy = (paddle_y - prev_paddle_y)/2.0;
         if(dy >  5) { dy =  5; }  
         if(dy < -5) { dy = -5; }  
      }     
   }  
   
   // If ball hits paddle or back wall, reverse direction
   if(ball_x < ball_size && ball_dir == -1) {
      ball_dir *= -1;
      speed = speed+0.5;
   }
   
   // If the ball is touching top or bottom edge, reverse direction
   if(ball_y > height-ball_size) {
      dy = dy * -1;
   }
   if(ball_y < ball_size) {
      dy = dy * -1;
   }
   
   // Draw ball
   fill(fillclr);
   ellipse(ball_x, ball_y, ball_size, ball_size);
   
   // Draw the paddle
   fill(fillclr);
   rect(width-dist_wall, paddle_y, paddle_width, paddle_height);  
}

