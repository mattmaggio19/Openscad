// special variables for the properties of circular objects
$fa = 0.01;
$fs = 0.5;

//constants
Plug_height = 10;
Plug_OD = 15;

Brass_tube_ID = 38;
Brass_tube_Exit_D = Brass_tube_ID-10;
Base_height = 10;

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
translate([0,0,Base_height])    
cylinder(d = Brass_tube_Exit_D ,h = Plug_height);
translate([0,(Brass_tube_Exit_D/2-(Post_D/2)),Base_height+Plug_height])
cylinder(d = Post_D ,h = Post_H);    
}
cylinder(d = Plug_OD-1.5,h = Base_height+1);
translate([0,0,Base_height])
Plug_model();

translate([0,-(Brass_tube_Exit_D/2-(Post_D/2)),])
cylinder(d = Post_D,h = 50);
}
}


module Post_grabber(){
difference(){    
cylinder(d = Post_D+Post_D,h = Post_H);
cylinder(d = Post_D,h = Post_H);    
translate([0,-Post_D,Post_H/2])       
cube([Post_D*1.2,Post_D*2,Post_H],true);  
}    
}

module Latch_assembly(){
translate([Brass_tube_Exit_D,0,0])     
Post_grabber();   
    
difference(){    
union(){        
cylinder(d = Post_D-0.2,h = (Post_H+Plug_height+Base_height+5));    
translate([(Brass_tube_Exit_D/2),0,0])
cylinder(d = Brass_tube_Exit_D,h = Post_H-2); 
    }  
translate([Brass_tube_Exit_D/2,-6,0])
cylinder(d = Brass_tube_Exit_D,h = Post_H-2); 
translate([Brass_tube_Exit_D,0,0]){   
cylinder(d = Post_D+Post_D,h = Post_H);
translate([0,-Post_D,Post_H/2])     
cube([Post_D*1.2,Post_D*2,Post_H],true);      
}  
}       
}






scale([1.01,1.01,1.01])
Base_plus_plug_holder();

translate([0,Brass_tube_ID,0])
Plug_model();

translate([Brass_tube_ID,0,0])
Latch_assembly();



//Latch that operates on the holder to contain the plug when inserted.