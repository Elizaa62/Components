include <../parameters.scad>


module 888_2019(){
    piston_out_d = 21.5;

    piston_screw_d = 16 + 0.3;
    piston_screw_t = 12 + 0.5;

    bearing_distance = 25;
    shoulder_screw_length = 25+2;
    bearing_screw_length = 20;

    difference(){
        union(){
            cylinder(d1 = piston_out_d, d2 = piston_out_d + 5, h = 2, $fn = 80);
            translate([0, 0, 2])
                cylinder(d1 = piston_out_d+5, d2 = piston_out_d + 15, h = bearing_distance + 9.6 - 2, $fn = 80);
        }
        
        translate([0, 0, 10-3])
            rotate([0, 90, 0]){
                cylinder(d = M6_screw_diameter, h = 100, center = true, $fn = 80);
                translate([0, 0, bearing_screw_length/2]) cylinder(d = M6_nut_diameter, h = 30);
                translate([0, 0, -bearing_screw_length/2-30]) cylinder(d = M6_nut_diameter, h = 30, $fn = 6);
            }

        translate([0, 0,-global_clearance])
        intersection(){
            cylinder(d = piston_screw_d, h = 13.5, $fn = 80);
            cube([piston_screw_t, 50, 50], center = true);
        }

        translate([0, 0, bearing_distance])
            rotate([0, 90, 0]){

                cylinder(d = M8_screw_diameter, h = 100, center = true, $fn = 80);
                translate([0, 0, shoulder_screw_length/2]) cylinder(d = 18.5, h = 30);
                translate([0, 0, -shoulder_screw_length/2-30]) cylinder(d = M6_nut_diameter, h = 30, $fn = 6);
                cube([20, 50, 12.5], center = true);


            }

    }
}

888_2019();
