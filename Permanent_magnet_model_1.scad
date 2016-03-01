//Model of Permanent magnet from ningbo


module Permanent_magnet(){
Magnet_L = 482.6;
Magnet_W = 482.6;
Magnet_H = 335.28;
Rail_Thickness = 25.4;
Post_Thickness = 50.8;
Cylinder_D = 342.9;
Cylinder_H = 88.9;


union(){
difference(){ 
cube([Magnet_W,Magnet_L,Magnet_H],true);
cube([Magnet_W-Post_Thickness,Magnet_L-Post_Thickness,Magnet_H-Rail_Thickness],true);
translate([Magnet_W/2,0,0])    
cube([Magnet_W-(2*Post_Thickness),Magnet_L-(2*Post_Thickness),Magnet_H-Rail_Thickness],true);
translate([-(Magnet_W/2),0,0])    
cube([Magnet_W-(2*Post_Thickness),Magnet_L-(2*Post_Thickness),Magnet_H-Rail_Thickness],true);
translate([0,Magnet_W/2,0])    
cube([Magnet_W-(2*Post_Thickness),Magnet_L-(2*Post_Thickness),Magnet_H-Rail_Thickness],true);
translate([0,-(Magnet_W/2),0])    
cube([Magnet_W-(2*Post_Thickness),Magnet_L-(2*Post_Thickness),Magnet_H-Rail_Thickness],true);
}
translate([0,0,-(Magnet_H/2)+Rail_Thickness/2])
cylinder(d = Cylinder_D,h=Cylinder_H);

translate([0,0,(Magnet_H/2)-Rail_Thickness/2])
mirror([0,0,1])
cylinder(d = Cylinder_D,h=Cylinder_H);
}
}
Permanent_magnet();