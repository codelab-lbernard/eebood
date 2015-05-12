// define a new place in memoery for a whole number called "myNumber"
int myNumber;

// define a new fraction (floating point number)
float myFrac; 

// assign values into your new variables
myNumber = 8; 
myFrac = 19.2;

println("at first, myNumber was: " + myNumber);
myNumber = myNumber * 2;  
println("but then it was all like: " + myNumber);

myFrac += myNumber; // ADD right hand value to left hand variable
println("myFrac is now: " + myFrac);

//assign a float value to a int and it will get rounded
myNumber *= myFrac;
println("and myNumber is: " + myNumber);
