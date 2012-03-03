// P_2_3_1_01.pde
// 
// Generative Gestaltung, ISBN: 978-3-87439-759-9
// First Edition, Hermann Schmidt, Mainz, 2009
// Hartmut Bohnacker, Benedikt Groß, Julia Laub, Claudius Lazzeroni
// Copyright 2009 Hartmut Bohnacker, Benedikt Groß, Julia Laub, Claudius Lazzeroni

/**
* draw tool. draw with a rotating line. 
* 
* MOUSE
* drag                : draw
* 
* KEYS
* 1-4                 : switch default colors
* 0, del, backspace   : clear screen
* d                   : reverse direction and mirrow angle 
* space               : new random color
* arrow left          : rotaion speed -
* arrow right         : rotaion speed +
* arrow up            : line length +
* arrow down          : line length -
*/


color col = color(50,200,100,100);
float lineLength = 0;
float angle = 0;
float angleSpeed = 1.0;

void setup() {
    //size(500,500);
    background(0);
    smooth();
    cursor(CROSS);
    noLoop();
}

void draw() {
    pushMatrix();
    strokeWeight(1.0); 
    noFill();
    stroke(col);
    translate(mouseX,mouseY);
    rotate(radians(angle));
    line(0, 0, lineLength, 0);
    popMatrix();
    
    angle += angleSpeed;
}

void mousePressed() {
    // create a new random line length
    lineLength = random(70, 200);
    draw();
}

void mouseDragged() {
    draw();
}

void keyPressed() {
    if (key == DELETE || key == BACKSPACE || key == "0") {         
        background(255); 
    }
    
    // reverse direction and mirrow angle
    if (key=="d" || key=="D") {
        angle = angle + 180;
        angleSpeed = angleSpeed * -1;
    }
    
    // r g b alpha
    if (key == " ") col = color(random(255),random(255),random(255),random(80,150));
    
    //default colors from 1 to 4 
    if (key == "1") col = color(181,157,0,100);
    if (key == "2") col = color(0,130,164,100);
    if (key == "3") col = color(87,35,129,100);
    if (key == "4") col = color(197,0,123,100);
    
    if (keyCode == "UP") lineLength += 5;
    if (keyCode == "DOWN") lineLength -= 5; 
    if (keyCode == "LEFT") angleSpeed -= 0.5;
    if (keyCode == "RIGHT") angleSpeed += 0.5; 
}
