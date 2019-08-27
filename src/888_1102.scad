
draft = true;
include <../parameters.scad>
use <888_1004.scad>
use <888_1005.scad>
use <888_2009.scad>
use <888_1026.scad>
use <888_1029.scad>
use <888_1030.scad>
use <888_1031.scad>

difference(){
    union(){
translate([-engine_holder_beam_depth, 0, 0])
    888_1004();
888_1005();

translate([main_pilon_position, 0, height_of_vertical_tube])
rotate(180)
    888_1029();

translate([-engine_holder_beam_depth+beam_patern*9.5, 0, beam_thickness/2])
rotate(180)
    888_1030();

translate([-engine_holder_beam_depth+beam_patern*6, 0, 0])
    rotate(180)
        888_1031();

translate([-engine_holder_beam_depth+beam_patern*6, 0, 0])
    mirror([0, 1, 0])
    rotate(180)
        888_1031();

// motor
//color([0.8, 0.8, 0.8, 0.2])
translate([0, 0, 0]) rotate([0,-90,0]) 888_1026();
translate([0, 0, -beam_thickness_below]) rotate([0, 0,0]) 888_2009();


%translate([main_pilon_position, 0, 0])
    cylinder(d = 20, h = height_of_vertical_tube);

%translate([-2*main_tube_outer_diameter, -100, 0])
    rotate([0, 90, 0])
        cylinder(d = 20, h = length_of_main_tube);


%translate([250, tail_pipe_distance/2, 0])
    rotate([0, 90, 0])
        cylinder(d = 10, h = 500);

%translate([250, -tail_pipe_distance/2, 0])
    rotate([0, 90, 0])
        cylinder(d = 10, h = 500);



}
//cube(1000);
}
