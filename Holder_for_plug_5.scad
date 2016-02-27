// special variables for the properties of circular objects
$fa = 0.01;
$fs = 0.5;

//constants
Plug_height = 10;
Plug_OD = 15;

Brass_tube_ID = 45.3;
Brass_tube_inner_chamber_D =39.8;
Brass_tube_Exit_D = 39.8;
Base_height = Plug_height-4;

Tube_OD = Plug_OD+2;
Tube_ID = Plug_OD;
Tube_height = Plug_height-3;

Post_D = 3.80;
Post_H = 2;

Spacing_for_posts = Brass_tube_Exit_D/2-(Post_D*1.5);

Notch_parameter = 2.5;

//plug with arb hole for hypoxia targeting
module Plug_model(){
cylinder(d = Plug_OD,h = Plug_height);
translate([-((Plug_OD/2)-(Notch_parameter/1.5)),0,Plug_height]){
translate([0,0,-Plug_height])
linear_extrude(height = Plug_height, scale = 1)
rotate([0,0,180])
circle(Plug_OD/4,$fn = 3, center = true);

mirror([0,0,0])
translate([(Plug_OD)-4,0,-Plug_height])
linear_extrude(height = Plug_height, scale = 1)
circle(Plug_OD/4,$fn = 6, center = true);    
}    
}

//Holder that fits inside the brass collimator holder and deterministically fits the plug
module Base_plus_plug_holder(){
difference(){
union(){    
cylinder(d = Brass_tube_ID,h = Base_height+1);
translate([0,0,Base_height])    
cylinder(d = Brass_tube_Exit_D ,h = Plug_height);

}
difference(){
cylinder(d = Brass_tube_ID,h = Base_height/2);
cylinder(d = Brass_tube_inner_chamber_D,h = Base_height/2);    
}
cylinder(d = Plug_OD-1.5,h = Base_height+1);
translate([0,0,Base_height])
Plug_model();
translate([0,-(Spacing_for_posts),Base_height+Plug_height-Post_H])
cylinder(d = Post_D,h = Post_H);  
translate([0,Spacing_for_posts,0])
cylinder(d = Post_D,h = 50);
}
}


//Full_concentric_circle with a hole to put a screw through Small Post for locking.
module Locking_assembly(){
difference(){
union(){
cylinder(d = Brass_tube_Exit_D , h = Post_H );    
translate([0,-(Spacing_for_posts),Post_H])    
cylinder(d = Post_D,h = Post_H);    
} 
cylinder(d = Plug_OD*0.9 , h = Post_H );
translate([0,Spacing_for_posts,0])
cylinder(d = Post_D,h = Post_H);
}
}




Locking_assembly();

translate([Brass_tube_ID*1.3,0,0])
scale([1.01,1.01,1.01])
Base_plus_plug_holder();

translate([0,Brass_tube_ID,0])
Plug_model();

//translate([Brass_tube_ID,Brass_tube_ID,0])


//Latch that operates on the holder to contain the plug when inserted.