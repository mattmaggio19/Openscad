// This file is designed to replicate box design. It will take arguments for length, width, and height. Number of cut out sections. 
// Wall thickness is 2 mm

// All measurements in mm. Added 0.2 to all dimentions for PLA shrinkage.


module Box_equal_volume_horizontal (Box_Width,Box_Length,Box_Height,Number_of_Cut_outs){
Wall_thickness = 2;
//create hollow box
difference(){        
    cube([Box_Width,Box_Length,Box_Height]);    
    translate([Wall_thickness , Wall_thickness, Wall_thickness])
    cube([Box_Width-(2*Wall_thickness),Box_Length-(2*Wall_thickness),Box_Height]);       
}

//create walls subdivng the box
Delta_Y =  (Box_Length-(2*Wall_thickness))/Number_of_Cut_outs;

for (ii =[1:1:Number_of_Cut_outs-1]){

Y_pos_wall = Wall_thickness + Delta_Y * ii;
    
translate([Wall_thickness , Y_pos_wall , Wall_thickness])
cube([Box_Width-Wall_thickness,Wall_thickness,Box_Height*0.9]);
    
}
translate([Box_Width/2 , Wall_thickness , Wall_thickness])
cube([Wall_thickness,Box_Length-Wall_thickness,Box_Height*0.9]);

}


Box_equal_volume_horizontal (20,40,6,5);