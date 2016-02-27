// This file is designed to replicate box design. It will take arguments for length, width, and height. Number of cut out sections. 
// Wall thickness is 2 mm


//sums over a vector
module Sum(vector){
    sum = 0; 
    for(ii=len(vector)){
        sum = sum + vector(ii);
    }
}


module Box_equal_volume_horizontal (Box_Width,Box_Length,Box_Height,Number_of_Cut_outs,ratio_of_volumes_vec){
Wall_thickness = 2;
//create hollow box
difference(){        
    cube([Box_Width,Box_Length,Box_Height]);    
    translate([Wall_thickness , Wall_thickness, Wall_thickness])
    cube([Box_Width-(2*Wall _thickness),Box_Length-(2*Wall_thickness),Box_Height]);       
}

//create walls subdivng the box

Sum_of_box_volumes = Sum(ratio_of_volumes_vec);

for (ii =[1:1:Number_of_Cut_outs-1]){
    
Delta_Y =  (Box_Length-(2*Wall_thickness))/Number_of_Cut_outs;
    
Y_pos_wall = Wall_thickness + Delta_Y * ii;
    
translate([Wall_thickness , Y_pos_wall , Wall_thickness])
cube([Box_Width-Wall_thickness,Wall_thickness,Box_Height*0.9]);
    
}
}


Box_equal_volume_horizontal (200,400,60,5,[2,1,1,1,1]);