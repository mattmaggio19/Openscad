
// This program renders an adaptor for printing in pla. An extra 0.2 mm is added on for shrinkage to all non z dimentions.
//All Dimentions are in mm
module Circular_Adaptor (Bigger_D, Smaller_D, Length){

First_Diameter =  Smaller_D +0.2 ;

Second_Diameter =   Bigger_D +0.2 ; 

Hole_Diameter = First_Diameter - 2;
Total_height = Length;

// special variables for the properties of circular objects
$fa = 0.01;
$fs = 0.5;

difference(){    
cylinder(d = Second_Diameter , h = Total_height);
cylinder(d = Hole_Diameter , h = Total_height);
    
translate([0,0,Total_height - (Total_height/2)])
difference(){
cylinder( d= Second_Diameter + 4 , Total_height/2);
cylinder( d= First_Diameter , Total_height/2);   
}  
}

}

Circular_Adaptor (19,15,30);
