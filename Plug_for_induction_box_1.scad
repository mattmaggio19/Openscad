
// all measurements are in millimeters
//These are specified diameters. No attempt to compensate for shrinkage.

Cylinder_diameter = 11.5;
Cylinder_hight = 12.5;

//Cylinder_offset = Box_width/3;
//Cutoff_hight = 32;


 translate([0,0,0])
 cylinder(d = Cylinder_diameter, h = Cylinder_hight, $fs = 1,$fa  = 1); 
    
