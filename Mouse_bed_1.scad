
// all measurements are in millimeters



union()
{
translate([0,0,40])
cube([60,20,120],true);

    difference()
    {    
    translate([0,20,0])    
    cube([30,30,15.5 ],true);
    translate([0,24,-40])
    cylinder(d = 19.1, h = 100, $fs = 1,$fa  = 1);    
    }
    
    difference()
    {    
    translate([0,20,90])    
    cube([30,30,19],true);
    translate([0,19,80])
    cylinder(d = 13, h = 500, $fs = 1,$fa  = 1); 
    translate([0,35,90])    
    cube([30,30,19],true);   
        
    }
    
 
}
