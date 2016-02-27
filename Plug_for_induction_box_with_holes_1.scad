
// all measurements are in millimeters
//These are specified diameters. No attempt to compensate for shrinkage.

Cylinder_diameter = 11.5;
Cylinder_hight = 12.5;

//Cylinder_offset = Box_width/3;
//Cutoff_hight = 32;

difference(){
 
translate([0,0,0])
cylinder(d = Cylinder_diameter, h = Cylinder_hight, $fs = 1,$fa  = 1); 
 
translate([0,(Cylinder_diameter-3.2)/2,0])
cylinder(d = 3.2, h = Cylinder_hight, $fs = 1,$fa  = 1); 
translate([0,(1.7+Cylinder_diameter-3.2)/2,Cylinder_hight/2])
cube([3.2,3,Cylinder_hight],true); 
  
translate([0,-(Cylinder_diameter-2.5)/2,0])
cylinder(d = 2.5, h = Cylinder_hight, $fs = 1,$fa  = 1);   
    
translate([0,-(1.7+Cylinder_diameter-2.5)/2,Cylinder_hight/2])
cube([2.5,3,Cylinder_hight],true); 
    
}
    
