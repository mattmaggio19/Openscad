// special variables for the properties of circular objects
$fa = 0.01;
$fs = 0.5;

//constants
Plug_height = 15;
Plug_OD = 25;

Brass_tube_ID = 38;
Brass_tube_Exit_D = Plug_OD+5;
Base_height = 3;

Tube_OD = Plug_OD+2;
Tube_ID = Plug_OD;
Tube_height = Plug_height-3;

Post_D = 2.5;
Post_H = 5;

//plug with arb hole for hypoxia targeting
module Plug_model(){
cylinder(d = Plug_OD,h = Plug_height);
translate([-((Plug_OD/2)-(Post_D/1.5)),0,Plug_height]){
cube([Post_D,Post_D,Plug_height],true);
translate([0,0,-Plug_height])
linear_extrude(height = Plug_height, scale = 1)
rotate([0,0,180])
circle(4,$fn = 3, center = true);

mirror([0,0,0])
translate([(Plug_OD)-4,0,-Plug_height])
linear_extrude(height = Plug_height, scale = 1)
circle(4,$fn = 6, center = true);    
}    
}

//Holder that fits inside the brass collimator holder and deterministically fits the plug
module Base_plus_plug_holder(){
difference(){
union(){    
cylinder(d = Brass_tube_ID,h = Base_height+1);
cylinder(d = Brass_tube_Exit_D ,h = Plug_height);
}
cylinder(d = Plug_OD-1,h = Base_height+1);
Plug_model();
translate([0,(Brass_tube_Exit_D/2-(Post_D/2)),Base_height+Plug_height])
cylinder(d = Post_D ,h = Post_H);
translate([0,-(Brass_tube_Exit_D/2-(Post_D/2)),])
cylinder(d = Post_D,h = 50);
}
}


module Latch_assembly(){
difference(){    
    union(){        
cylinder(d = Post_D,h = (Post_H+Plug_height+Base_height+5));
translate([(Brass_tube_Exit_D/2),0,0])
cylinder(d = Brass_tube_Exit_D,h = Post_H-2);
translate([Brass_tube_Exit_D,0,0])    
cylinder(d = Post_D+Post_D,h = Post_H);
    }  
translate([Brass_tube_Exit_D/2,-6,0])
cylinder(d = Brass_tube_Exit_D,h = Post_H-2); 
translate([Brass_tube_Exit_D,0,0]){
cylinder(d = Post_D,h = Post_H);
translate([0,-Post_D,Post_H/2])    
cube([Post_D*1.2,Post_D*2,Post_H],true);   
}       
}
}




//punch a hole through the holder for latch Mechanism.
scale([1.03,1.03,1.03])
Base_plus_plug_holder();

translate([0,Plug_OD*2,0])
Plug_model();

translate([Plug_OD*2,0,0])
Latch_assembly();



//Latch that operates on the holder to contain the plug when inserted.