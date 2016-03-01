use <Permanent_magnet_model_1.scad>
use <Nut_job.scad>

//Refrence magnet parameters
Magnet_L = 482.6;
Magnet_W = 482.6;
Magnet_H = 335.28;
Rail_Thickness = 25.4;
Post_Thickness = 50.8;
Cylinder_D = 342.9;
Cylinder_H = 88.9;

Hole_D = 5;

module Threadobj(){
nut_diameter = Hole_D;
nut_height = Platform_H*2;
nut_thread_outer_diameter = Hole_D;
nut_thread_step = nut_height/3;
nut_step_shape_degrees = 45;
nut_resolution = 0.2;
difference(){
cylinder(d=nut_diameter,h=nut_height);
hex_nut(nut_diameter,nut_height,nut_thread_step,nut_step_shape_degrees,nut_thread_outer_diameter,nut_resolution);
}
}

//translate([0,0,10])
//Threadobj();
//Platform with polar holes

Platform_W = Magnet_H - 2*Cylinder_H - 2*Rail_Thickness ;
Platform_H = 2;

Number_of_holes= 8;

difference(){
union(){
cube([Platform_W,Platform_W,Platform_H],true);
translate([0,Platform_W/2,0])
cube([Platform_W/5,Platform_W/5,Platform_H],true);
translate([0,-Platform_W/2,0])
cube([Platform_W/5,Platform_W/5,Platform_H],true);
}
translate([(Platform_W/2)*0.9,0,-Platform_H])
Threadobj();

translate([Platform_W/3,0,-Platform_H]){
 for (ii = [1:2]){   
 for(jj = [0 : 180/Number_of_holes : 180]){

     translate([-(Platform_W/3)*(ii-1),0,0])
     rotate([0,0,jj])
     translate([0,Platform_W/3,0])
       Threadobj();
     }
}
}
}


//
//rotate([90,0,0]){
//Permanent_magnet();
//}