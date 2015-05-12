
//declare three variables to hold numbers 
int xPosition = 30;
int yPosition = 20;
float sz = 20.0;

size(400,400);

// draw an ellipse using the declared variables
ellipse(xPosition, yPosition, sz, sz);
xPosition += 45; // add 45 
yPosition *= 2; // multiply by 2
sz *= 1.65; // multiply by 1.65 - float variable can hold fractures 

// these commands are exactly identical.
ellipse(xPosition, yPosition, sz, sz);
xPosition += 45;
yPosition *= 2;
sz *= 1.65;

ellipse(xPosition, yPosition, sz, sz);
xPosition += 45;
yPosition *= 2;
sz *= 1.65;

ellipse(xPosition, yPosition, sz, sz);
xPosition += 45;
yPosition *= 2;
sz *= 1.65;

ellipse(xPosition, yPosition, sz, sz);
xPosition += 45;
yPosition *= 2;
sz *= 1.65;




