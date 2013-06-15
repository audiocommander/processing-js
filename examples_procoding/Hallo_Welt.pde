// Text & Keyboard Input Test
//
// Copyright (c) 2009,2010 by Michael Markert for Procoding
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//
// 
// Version History
// 0.1  2011-11-01  first version
// 0.2	2012-01-19	fixed keyCode bug in Procoding
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
