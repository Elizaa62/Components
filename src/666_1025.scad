	use <./lib/naca4.scad>
	use <666_1032_A.scad>
include <../Parameters.scad>

module 666_1025(){

    length_of_drop = 580;
    thickness = 0.8;
    y_size = 100;
    z_size = 150;
    x_size = 580;
    corner_radius = 4;
    airfoil_thickness= 35;
    scale_x = 1;
    scale_y = 1.5;
    scale_z = 1.5;


    beta = 90 - trailing_edge_angle(naca = airfoil_thickness); // calculate the angle of trailing edge
    trailing_wall= 1/(cos(beta)); //calculate lenght of wall cut relative to wall thickness
    echo(trailing_wall); // print a relative thickness of material at traling edge to wall thickness. 

   

difference(){
	union (){
		difference(){
			intersection () {
				translate([0,0,0])
         			rotate ([0,90,0])           
                   		rotate_extrude($fn = 100)
                        	rotate([0,0,90])
                            	difference(){
                            		polygon(points = airfoil_data(naca=airfoil_thickness, L =length_of_drop , N=100)); 
                              		square(length_of_drop,length_of_drop); 
                            	}

				scale ([scale_x,scale_y,scale_z]) 
					rotate ([0,90,0])           
                   		rotate_extrude($fn = 100)
                       		rotate([0,0,90])
                            	difference(){
                                    polygon(points = airfoil_data(naca=airfoil_thickness, L =length_of_drop , N=100)); 
                              		square(length_of_drop,length_of_drop); 
                            	}
                    
            minkowski(){                   
         		translate ([0,-(main_tube_outer_diameter/2)+1,-z_size/2])
         				cube ([x_size,y_size*scale_y,z_size]);
         	
         			rotate ([0,90,0])
             			cylinder (h = 1, r = corner_radius, $fn = 100);                   
    		}
			}

//hollowing skeleton
		translate ([thickness,0,0])
            intersection () {
                    resize([length_of_drop - thickness - trailing_wall* thickness, (length_of_drop*airfoil_thickness/100) - 2*thickness, (length_of_drop*airfoil_thickness/100) - 2*thickness], auto=true)
                 		rotate ([0,90,0])           
                            rotate_extrude($fn = 100)
                                rotate([0,0,90])
                                    difference(){
                                        polygon(points = airfoil_data(naca=airfoil_thickness, L = length_of_drop, N=200)); 
                                      	square(length_of_drop, length_of_drop); 
                                    }
            minkowski(){                   
                translate ([0,-(main_tube_outer_diameter/2),-z_size/2 + thickness])
                   		cube ([x_size,y_size - thickness, z_size - 2*thickness]);
                
                	rotate ([0,90,0])
                   		cylinder (h = 1, r = corner_radius, $fn = 100);                   
            }                   
            }
            
//for front part
		translate ([-2,-1 - main_tube_outer_diameter/2,-25])
				cube ([52,y_size+10,50]);

//for tube in back
		translate ([x_size-70,0,0])
			rotate ([0,90,0])
				cylinder (h = 80, r1 = main_tube_outer_diameter/2, r2 = main_tube_outer_diameter/2, $fn = 200);
					    
//for tube - propeller
		//translate ([237.5 - (main_tube_outer_diameter/2),90,-main_tube_outer_diameter/2])
		translate ([170+68- main_tube_outer_diameter/2,main_tube_outer_diameter+40,-main_tube_outer_diameter/2])
			rotate ([0,0,0])
				cube ([main_tube_outer_diameter, main_tube_outer_diameter*2,main_tube_outer_diameter]);
    			
//for printing
		translate([0,-main_tube_outer_diameter/2-4.90,-170/2])
				cube ([600,5,170]);

		translate([x_size-50,-main_tube_outer_diameter,-main_tube_outer_diameter/2])		
				cube([80,main_tube_outer_diameter, main_tube_outer_diameter]);	

		}


		
//hodní držák
		
		//created from part 666_1032
		difference(){
		scale ([1,1,1.2])     
    		translate([180,0,0])             
    			rotate([-90,0,0])
            		resize([170 - thickness - trailing_wall*thickness,(170*airfoil_thickness/100)- 2*thickness,315], auto=true) airfoil(naca = airfoil_thickness, L = 170, N=101, h = 260, open = false);
    		translate([185,0,0])
        		rotate([-90,0,0])    
            		resize([150 - thickness - trailing_wall*thickness,(150*airfoil_thickness/100)- 2*thickness,315], auto=true) airfoil(naca = airfoil_thickness, L = 150, N=101, h = 240, open = false);

    		translate([180,110,-100])        
					cube([200,250,200]);

			//for delete inside part of 666_1032		
			translate ([thickness,0,0])
            	intersection () {
                    resize([length_of_drop - thickness - trailing_wall* thickness, (length_of_drop*airfoil_thickness/100) - 2*thickness, (length_of_drop*airfoil_thickness/100) - 2*thickness], auto=true)
                 		rotate ([0,90,0])           
                            rotate_extrude($fn = 100)
                                rotate([0,0,90])
                                    difference(){
                                        polygon(points = airfoil_data(naca=airfoil_thickness, L = length_of_drop, N=200)); 
                                      	square(length_of_drop, length_of_drop); 
                                    }
            	minkowski(){                   
                	translate ([0,-(main_tube_outer_diameter/2),-z_size/2 + thickness])
                   			cube ([x_size,y_size - thickness, z_size - 2*thickness]);
                
                		rotate ([0,90,0])
                   			cylinder (h = 1, r = corner_radius, $fn = 100);                   
           		}                   
            	}
		}			
	}

//for dividing into two parts
	translate([170+68,-30,z_size])
		rotate ([0,90,0])
			cube ([600,250,1]);
			
}

//final part
}
666_1025();