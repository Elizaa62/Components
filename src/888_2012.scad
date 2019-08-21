//valec k disku do mechoveho kola

include <../parameters.scad>

cylinder_1_thickness = 1.2;
cylinder_1_diameter = 608_bearing_outer_diameter+2;
cylinder_2_thickness = cylinder_1_thickness+0.7;
cylinder_2_diameter = 608_bearing_inner_diameter+4;

module 888_2012 () {
    difference() {
        union() {
            cylinder(h=cylinder_1_thickness, d=cylinder_1_diameter, $fn=80);
            cylinder(h=cylinder_2_thickness, d=cylinder_2_diameter, $fn=50);
            cylinder(h=wheel_inner_thickness/2+wheel_disc_upper_thickness+cylinder_1_thickness+(cylinder_2_thickness-cylinder_1_thickness) - global_clearance,
                  d=608_bearing_inner_diameter, $fn=50);
        }
        translate([0,0,-1])
            cylinder(h=wheel_inner_thickness, d=M4_screw_diameter, $fn=50);
    }
}

888_2012();
