
// all measurements are in millimeters

Cylinder_hight = 15;
Cutoff_hight = 33;
union()
{
translate([0,0,35])
cube([95,3,120],true);

    difference()
    {    
    translate([0,15,0])    
    cube([30,30,15.5 ],true);
    translate([0,Cylinder_hight,-20])
    cylinder(d = 19.1, h = 40, $fs = 1,$fa  = 1);    
    translate([0,Cutoff_hight,0])
    cube([30,30,15.5 ],true);
    }
    
        difference()
    {    
    translate([25,15,0])    
    cube([30,30,15.5 ],true);
    translate([25,Cylinder_hight,-20])
    cylinder(d = 19.1, h = 40, $fs = 1,$fa  = 1);    
    translate([25,Cutoff_hight,0])
    cube([30,30,15.5 ],true);
    }
            difference()
    {    
    translate([-25,15,0])    
    cube([30,30,15.5 ],true);
    translate([-25,Cylinder_hight,-20])
    cylinder(d = 19.1, h = 40, $fs = 1,$fa  = 1);    
    translate([-25,Cutoff_hight,0])
    cube([30,30,15.5 ],true);
    }
    
    translate([12.5,10,50])
    cube([3,18,80],true);
    
    translate([-12.5,10,50])
    cube([3,18,80],true);
    
    
    
 
}
