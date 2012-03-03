// @pjs preload must be used to preload the image
// please be patient, loading can take a while

/* @pjs preload="http://procoding.audiocommander.de/images/test.jpg"; */

imageMode(CENTER);

PImage b;
b = loadImage("http://procoding.audiocommander.de/images/test.jpg");

background(100);
image(b, width/2, height/2);
filter(INVERT);
