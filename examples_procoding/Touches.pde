// Multitouch Example
// For processing-js
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
// Note to iPad Users:
// If you have enabled "Multitasking Gestures"
// in Settings » General you can use only up to 3 touches.
// Otherwise it'll work with up to 11 touches
// 
// touchStart(), touchMove(), touchEnd() and touchCancel()
// are available in processingjs, but not in processing
// so this sketch won't compile on processing
//
// for a detailed API see:
// http://www.w3.org/TR/touch-events/



boolean debug = false;
int diameter = (int)(width/4);

// Array to store active Touches
ArrayList touches = new ArrayList();

void setup() {
    //println("Touch the screen");
    background(0);
    noStroke(0);
}

void draw() {
    background(0);
    Touch touch;
    int length = touches.size();
    int i;
    for(i=0; i<length; i++) {
        touch = (Touch)touches.get(i);
        fill(touch.c);
        ellipse(touch.x, touch.y, diameter, diameter);
    }
}


// processingjs Touch Event Handlers

void touchStart(TouchEvent t) {
    if(debug) println("TouchStart:" + t.touches.length);
    // save touch object
    int i;
    for (i=0; i<t.touches.length; i++) {
        long id = t.touches[i].identifier;
        Touch touch;
        // see if there's already a touch with this id
        int index = indexOfTouchWithID(id);
        if(index < 0) {
            // create
            touch = new Touch(id);
            touches.add(touch);
            if(debug) println("Added touch "+id);
        } else {
            // already there
            touch = touchWithID(id);
        }
        touch.x = t.touches[i].offsetX;
        touch.y = t.touches[i].offsetY;
    }
}


void touchMove(TouchEvent t) {
    //println("TouchMoved:" + t);
    Touch touch;
    int i;
    for (i=0; i<t.touches.length; i++) {
        long id = t.touches[i].identifier;
        touch = touchWithID(id);
        touch.x = t.touches[i].offsetX;
        touch.y = t.touches[i].offsetY;
    }
}


void touchEnd(TouchEvent t) {
    if(debug) println("TouchEnd:" + t.touches.length + " " + t.changedTouches.length);
    int i;
    
    // Remember: you'll find all touches not in 'touches' nor 'targetTouches' but in 'changedTouches'. 
    
    // remove touches obj
    int index;
    for (i=0; i<t.changedTouches.length; i++) {
        long id = t.changedTouches[i].identifier;
        index = indexOfTouchWithID(id);
        touches.remove(index);
        if(debug) println("Removed touch "+id);
    }
}

void touchCancel(TouchEvent t) {
    if(debug) println("TouchCancelled:" + t);
    // touchCancel occurs if the application unexpectedly loses focus, e.g. if a call comes in
    // so we're removing all touches
    int i;
    for (i=touches.size()-1; i>=0; i--) {
        touches.remove(i);
        if(debug) println("Removed touch "+id);
    }
}

Touch touchWithID(long id) {
    int length = touches.size();
    Touch touch;
    int i;
    for(i=0; i<length; i++) {
        touch = touches.get(i);
        if(touch.id == id) {
            return touch;
        }
    }
    return;
}

int indexOfTouchWithID(long id) {
    int length = touches.size();
    Touch touch;
    int i;
    for(i=0; i<length; i++) {
        touch = touches.get(i);
        if(touch.id == id) {
            return i;
        }
    }
    return -1;
}





class Touch {
    // each touch has an ID, a position and a color
    long id = 0;
    int x = 0;
    int y = 0;
    color c; // = color(0,0,255);
    
    Touch(long identifier) {
        id = identifier;
        c = color( random(255), random(255), random(255) );
        //println("TouchCreated: " + id);
    }
}

