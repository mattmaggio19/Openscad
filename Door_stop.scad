

Door_stop_L = 30;
Door_stop_H = 30;
Door_stop_W = 10;

//difference(){
// cylinder(Door_stop_L,Door_stop_W,Door_stop_H,$fn=3);
//    
//}
difference(){
cube([Door_stop_L,Door_stop_W,Door_stop_H]);
translate([Door_stop_L,Door_stop_W,Door_stop_H])
cube([Door_stop_L,Door_stop_W,Door_stop_H]);;
}