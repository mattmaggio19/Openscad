
// all measurements are in millimeters
// this is the 3D print design of the MRI-EPR adaptor ring. It will be precisely the resonator size.
//I have not accounted for shrinking, these are the specified dimentions.

Resonator_diameter = 18.73;
Resonator_height = 15.0;
Adaptor_diameter = 28;
Total_height = Resonator_height +30;
Cutout_dim = 30;


    difference()
    {    
    cylinder(d = Adaptor_diameter, h = Total_height, $fs = 1,$fa  = 1);       
    cylinder(d = Resonator_diameter, h = Total_height, $fs = 1,$fa  = 1);  
    translate([0,(Cutout_dim/2)-(Adaptor_diameter-Resonator_diameter),(Cutout_dim/2)+Resonator_height])
    cube([Cutout_dim,Cutout_dim,Cutout_dim ],true);
    }
