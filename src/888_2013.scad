include <../parameters.scad>
use <lib/igus.scad>

//improving rendering speed.
draft = true;   // sets rendering quality to draft.


//chassis_pipe_angle_x = 30;
//chassis_pipe_angle_y = 10;
chassis_top_bearing_position = [0, 35, -45];
chassis_top_bearing_rotation = [chassis_pipe_angle_x, chassis_pipe_angle_y, chassis_pipe_angle_z];


888_2013_width = 70;

module 888_2013(draft) {
    material_plus = 10;

    difference(){
        union(){
            intersection(){
                union(){

                    // zakladni cast okolo trubky
                    translate([-888_2013_width/2, 0, -main_tube_outer_diameter/2 - material_plus])
                        cube([888_2013_width, main_tube_outer_diameter/2 + material_plus, main_tube_outer_diameter + material_plus*2]);

                    hull(){
                        translate([-50, 0, -main_tube_outer_diameter/2-material_plus])
                            cube([100, main_tube_outer_diameter/2 + material_plus, material_plus/2]);

                        // kostka, na kterou je pridelane loziska
                        translate(chassis_top_bearing_position)
                            rotate(chassis_top_bearing_rotation)
                                translate([-100/2, 0, -15/2])
                                    cube([100, 15, 15]);
                    }

                translate(chassis_top_bearing_position)
                    rotate(chassis_top_bearing_rotation)
                        translate([-100, -5, -15/2])
                            cube([200, 20, 15]);

                }

                // kostka, na kterou je pridelane loziska
                translate([-888_2013_width/2, global_clearance, -100])
                    cube([888_2013_width, 100, 200]);

            }
        }

        // dira na podelnou trubku
        rotate([0, 90, 0])
            translate([0, 0, -888_2013_width/2 - global_clearance])
                cylinder(d = main_tube_outer_diameter, h = 888_2013_width+ 2*global_clearance);

        // zkoseni nahore
        rotate([45, 0, 0])
            translate([-888_2013_width/2-global_clearance, main_tube_outer_diameter/2+material_plus, -25])
                cube([888_2013_width+2*global_clearance, 50, 50]);

        // diry pro sesroubovani
        rotate([-90, 0, 0]){
            translate([888_2013_width/4, 0, 0])
                cylinder(d = M4_screw_diameter, h = 100);

            translate([888_2013_width/4, 0, 35/2])
                cylinder(d = M4_nut_diameter, h = 100, $fn = 6);

            translate([-888_2013_width/4, 0, 0])
                cylinder(d = M4_screw_diameter, h = 100);

            translate([-888_2013_width/4, 0, 35/2])
                cylinder(d = M4_nut_diameter, h = 100, $fn = 6);

            translate([0, main_tube_outer_diameter/2+5, 0])
                cylinder(d = M4_screw_diameter, h = 100);

            translate([0, main_tube_outer_diameter/2+5, 35/2])
                cylinder(d = M4_nut_diameter, h = 100, $fn = 6);
        }


        // diry pro prisroubovani kuloveho loziska.
        translate(chassis_top_bearing_position)
            rotate(chassis_top_bearing_rotation)
                rotate([-90, 0, 0]){
                    translate([kstm_hole_distance("10")/2, 0, 0])
                        cylinder(d = M4_screw_diameter, h = 80, center = true);
                    translate([-kstm_hole_distance("10")/2, 0, 0])
                        cylinder(d = M4_screw_diameter, h = 80, center = true);
                    translate([kstm_hole_distance("10")/2, 0, 15/2-4])
                        cylinder(d = M4_nut_diameter, h = 50, $fn =6);
                    translate([-kstm_hole_distance("10")/2, 0, 15/2-4])
                        cylinder(d = M4_nut_diameter, h = 50, $fn = 6);
            }
    }
}



//666_1017_drillhelper_doc();
translate(chassis_top_bearing_position)
        rotate([chassis_pipe_angle_x, chassis_pipe_angle_y, chassis_pipe_angle_z])
            translate([0, -20, 0])
                rotate([90, 0, 0])
                    kstm_10();

888_2013(draft);

//translate([70,0,0])
//666_1017_drillhelper();