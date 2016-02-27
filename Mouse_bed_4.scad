
// all measurements are in millimeters

Box_width = 95.2;
Box_hight = 20;
Cylinder_hight = 4.6+(19.1/2);
Cylinder_offset = Box_width/3;
Cutoff_hight = 32;

union()
{
    difference()
    {    
    translate([0,Box_hight/2,0])    
    cube([Box_width,Box_hight,15.5 ],true); //box
                //3 holes for casts
     translate([0,Cylinder_hight,-20])
    cylinder(d = 19.1, h = 40, $fs = 1,$fa  = 1); 
     translate([Cylinder_offset,Cylinder_hight,-20])
    cylinder(d = 19.1, h = 40, $fs = 1,$fa  = 1); 
     translate([-Cylinder_offset,Cylinder_hight,-20])
    cylinder(d = 19.1, h = 40, $fs = 1,$fa  = 1);     
    translate([0,Cutoff_hight,0])
    cube([Box_width,30,15.5 ],true); //Cutoff
    }
    
      
}
