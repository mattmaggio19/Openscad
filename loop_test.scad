 
 
 num = 10;
 
 for(ii = [0 : 180/num : 180]){

     rotate([0,0,ii])     
     translate([0,10,00])
     cube([1,2,3],true);
     
 }