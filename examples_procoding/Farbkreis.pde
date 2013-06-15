// Farbkreis
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
// 0.1  2009-12-28  first version
// 0.2  2010-01-07  added rotation
//
// RGB Farbkreis
//
//
// ***** How to use *****
// 
// + see FileExporter
// 'c'  show color wheel
// 'd'  show degrees


// settings
boolean draw_wheel = true;
boolean draw_degrees = true;

// sketch properties
int s = width;    // size
int w = s;      // width
int h = s;      // height

// color wheel properties
int cx = w / 2;
int cy = h / 2;
int radius = s - (s>>1) - (s>>3); // wheel size
int segments = 6;                 // number of segments
float segmentAngle;               // angle of each segment

// init FileExporter
//FileExporter fex = new FileExporter("Farbkreis_Example");

// Text Properties
PFont font;

void setupFont() {  
   font = createFont("Arial", 10);
   textFont(font);
   textAlign(CENTER, CENTER);
}

void setup() {
   // canvas
   //size(w,h);
   mouseX = width;
   mouseY = height;
   setupFont();
}

void draw() {
   background(0);
   noStroke();  
   colorMode(HSB, 360, w, h);
   
   translate(0,100);
   //translate(wheelOffsetTranslateX,height);
   //rotate(radians(wheelOffset));
   
   segmentAngle = 360 / segments;
   float angle, i;
   float vx, tx;
   float vy, ty;
   
   // draw color wheel
   if(draw_wheel) {
      pushMatrix();
      beginShape(TRIANGLE_FAN);
      vertex(cx, cy);
      for(angle=0; angle<=360; angle+=segmentAngle) {
         vx = cx + cos(radians(angle)) * radius;
         vy = cy + sin(radians(angle)) * radius;
         vertex(vx, vy);
         fill(angle, mouseX, mouseY);//(mouseY*(-1))+50);
      }
      // close
      if(angle>360) {
         angle=360;
         vx = cx + cos(radians(angle)) * radius;
         vy = cy + sin(radians(angle)) * radius;
         vertex(vx, vy);
      }
      endShape();
      popMatrix();
   }
   
   // draw degree numbers
   for(angle=0; angle<=360; angle+=segmentAngle) {
      if(draw_degrees) {
         tx = cx + cos(radians(angle)) * (radius + 25);
         ty = cy + sin(radians(angle)) * (radius + 25);
         if(draw_degrees && (angle < 360)) {
            pushMatrix();
            //        rotate(90);
            //        fill(#666666);
            //        text(""+angle+"°", tx+1, ty+1);
            fill(angle, mouseX, mouseY);//(mouseY*(-1))+50);
            text(""+(int)angle+"°", tx, ty);
            popMatrix();
         }
      }
   }
   
}

void mousePressed() {
   if(mouseY>s){
      if(mouseX>=(width/2)){
         if(segments<360){ segments++; }
      } else {
         if(segments>1) { segments--; }
      }
   }
}

void keyPressed() {
   //println("KeyPressed: "+key);
   //println(keyCode);
   
   // set new number of segments
   if(keyCode==UP) { if(segments<360){ segments++; } }
   if(key==',') { if(segments<360){ segments++; } }
   if(keyCode==DOWN) { if(segments>1) { segments--; } }
   if(key=='.') { if(segments>1) { segments--; } }
   if(key=='0') { segments = 3; }
   if(key=='1') { segments = 4; }
   if(key=='2') { segments = 5; }
   if(key=='3') { segments = 6; }
   if(key=='4') { segments = 12; }
   if(key=='5') { segments = 24; }
   if(key=='6') { segments = 45; }
   if(key=='7') { segments = 90; }
   if(key=='8') { segments = 180; }
   if(key=='9') { segments = 360; }
   if(key=='c') { draw_wheel = !draw_wheel; }
   if(key=='d') { draw_degrees = !draw_degrees; }
}
