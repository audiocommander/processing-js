// Digital Clock
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
// 0.2. 2012-01-05  added time
// 0.3. 2012-01-13  improved interface

// Properties
PFont bigFont;
PFont smallFont;
int fontSize = (int)(width/5);

void setup() {
    // colors
    colorMode( HSB, width, height, height );
    noStroke();

	// setup font
    bigFont = createFont("HelveticaNeue-CondensedBlack",fontSize);
    smallFont = createFont("HelveticaNeue-UltraLight",(int)(fontSize/1.5));
    textAlign(CENTER, CENTER);
}

void draw() {
    background(mouseX,mouseY,mouseY);
    
    // nf takes an argument and adds x decimals
    // eg nf(2, 4) returns "0002"
    String date = nf(day(),2) +"."+nf(month(),2)+"."+year();
    String time = nf(hour(),2) +":"+nf(minute(),2) +":"+nf(second(),2);
    
    fill(255);

	textFont(bigFont);
    text( time, width/2, height/2-fontSize);

	textFont(smallFont);
    text( date, width/2, height/2);
}
