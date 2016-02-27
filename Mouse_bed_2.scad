
// all measurements are in millimeters



union()
{
translate([0,0,40])
cube([50,10,120],true);

    difference()
    {    
    translate([0,15,0])    
    cube([30,30,15.5 ],true);
    translate([0,18,-20])
    cylinder(d = 19.1, h = 40, $fs = 1,$fa  = 1);    
    translate([0,37,0])
    cube([30,30,15.5 ],true);
    }
    
    difference()
    {    
    translate([0,10,90])    
    cube([30,30,19],true);
    translate([0,19,70])
    cylinder(d = 13, h = 40, $fs = 1,$fa  = 1); 
    translate([0,35,90])    
    cube([30,30,19],true);   
        
    }
    
 
}
