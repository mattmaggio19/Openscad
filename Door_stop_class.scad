

Door_stop_L = 40;
Door_stop_H = 30;
Door_stop_W = 60;

scale([3,2,8]) 
difference(){
cube([Door_stop_L,Door_stop_W,Door_stop_H]);
translate([0,0,Door_stop_H])
    rotate([0,45,0])
cube([Door_stop_L*2,Door_stop_W,Door_stop_H]);;
    
}
