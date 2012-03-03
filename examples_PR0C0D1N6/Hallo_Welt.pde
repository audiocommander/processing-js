// Text & Keyboard Input Test
// (cc) BY-SA by Michael Markert
// 
// Version History
// 0.1  2011-11-01  first version
// 0.2	2012-01-19	fixed keyCode bug in PR0C0D1N6
// 0.3	2012-01-21	general processing compatibility


// Text Properties
PFont font;
int fontsize;
int x, y;
String lastKey = " ";

void setup() {
  //size(500,500);
  fontsize = (int)(width/10);
  x = (int)width/2;
  y = (int)height/2-fontsize*2;
  noStroke();
  
  // setup font & text
  //font = createFont("Menlo-Regular", 10); // for processing
  font = createFont("Menlo", fontsize);  // for PR0C0D1N6
  // Menlo comes with PR0C0D1N6
  // see iosfonts.com for available fonts on iOS
  textFont(font);
  textAlign(CENTER, CENTER);
}

void draw() {
  background(0);
  fill(255);
  textSize(fontsize);
  text("Hallo Welt", x, y);
  textSize((int)(fontsize/2.5));
  text("Type any key ("+ lastKey + "|" + key + "|" + keyCode + ")", x, y+fontsize);
}


void keyPressed() { 

  // A restriction of processingjs is that chars actually don't exist
  // in Processing, a char is a number, so you can do calculations; 
  // in Processingjs (and JavaScript), a char is either a string or a number but not both
  // The folks at pjs have decided it's better to have a number, so we have to convert it
  // to get the alphabetical representation of a char you have to explicitly convert:
  lastKey = String.fromCharCode(key);	// for Processingjs
  // lastKey = "" + key; // for Processing
  println("key '" + lastKey + "' pressed (value: " + key + ", code #" + keyCode + ")");

  // Testing for chars (key)
  if(key == 'y') { 
    println(" >>> Yay! <<< ");
  }
  
  // Testing for charCodes like UP, DOWN, LEFT, RIGHT
  if(keyCode == UP) { 
    println(" UP! UP! UP!");
  }

  // Works in JS, but is not Processing compatible, as 'x' is supposed to be a char, not a String Object
  //if(key.equals('x')) { println(" !!! XXX !!!"); }

}

void keyReleased() {
  // a soft keyboard has no key release, so the release is sent immediately after the keyPressed()
  //print(" & Key Released()");
}
