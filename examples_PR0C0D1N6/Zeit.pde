// Digital Clock
// by Michael Markert for PR0C0D1N6
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
