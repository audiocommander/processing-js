// Processing Example
// originally taken from http://processingjs.org
// Modified by Michael Markert for PR0C3551N6


float radius = width/4;
int x, y;
int nx, ny;
int delay = 16;
int r = (int)random(255);
int g = (int)random(255);
int b = (int)random(255);
int rc = r - (int)random(25);
int gc = g - (int)random(25);
int bc = b - (int)random(25);


void setup() {
    // setup drawing properties
    strokeWeight(width/20);
    x = width/2;
    y = height/2;
    nx = x;
    ny = y;
}

void draw() {
    // clear background
    background(r,g,b);
    
    // update radius
    radius = radius + sin( frameCount / 4 );

    // track circle to new destination
    x+=(nx-x)/delay;
    y+=(ny-y)/delay;
    
    // draw ellipse
    fill(rc,gc,bc);
    stroke(255);
    ellipse(x, y, radius, radius);
}

void mouseMoved() {
    nx = mouseX;
    ny = mouseY;
}

void mouseDragged() {
    mouseMoved();
}

void mousePressed() {
    mouseMoved();
}

