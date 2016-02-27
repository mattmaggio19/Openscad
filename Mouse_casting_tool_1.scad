
// all measurements are in millimeters
// this is the 3D print design of the Casting mechanism. It will be precisely the resonator size.
//I have not accounted for shrinking, these are the specified dimentions.

Resonator_diameter = 18.73;
Resonator_height = 15.0;
Caster_length = 74;
Caster_width = 56;
 
    difference()
    {   
    translate([0,0,Resonator_height/2])
    cube([Caster_length,Caster_width,Resonator_height],true);   
    cylinder(d = Resonator_diameter, h = Resonator_height, $fs = 1,$fa  = 1);  
    }
