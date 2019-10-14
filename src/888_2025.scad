//========== DRŽÁK PÍSTU ==========//

include <../parameters.scad>

wall_thickness = 2;
height = 10;

module 888_2025(piston=false) {
    if(piston) {

    }

    difference() {
        hull() {
            cylinder(d=RT57208M25_BE+wall_thickness, h=RT57208M25_MR+RT57208M25_LB+wall_thickness, $fn=60);

            translate([RT57208M25_EW/2+2, 0, RT57208M25_MR+RT57208M25_LB+wall_thickness+M6_screw_diameter/2+wall_thickness+height])
                rotate([0, -90, 0])
                    cylinder(d=M6_screw_diameter+wall_thickness*2, h=KBRM03_B/2+chasis_fork_thickness-888_2025_distance_space+2+RT57208M25_EW/2, $fn=60);
        }

        //píst
        translate([0, 0, -0.1])
            intersection() {
                cylinder(d=RT57208M25_BE, h=RT57208M25_MR+RT57208M25_LB+0.1, $fn=50);

                translate([RT57208M25_EW/-2, RT57208M25_BE/-2, 0])
                    cube([RT57208M25_EW, RT57208M25_BE, RT57208M25_MR+RT57208M25_LB]);
            }

        //šroub pro přišroubování k pístu
        translate([0, 0, RT57208M25_LB])
            rotate([0, 90, 0])
                cylinder(d=M3_screw_diameter, h=100, $fn=20, center=true);
        translate([-RT57208M25_EW/2-2, 0, RT57208M25_LB])
            rotate([0, -90, 0])
                cylinder(d=M3_nut_diameter, h=10, $fn=6);
        translate([RT57208M25_EW/2+2, 0, RT57208M25_LB])
            rotate([0, 90, 0])
                cylinder(d=50+height, h=10, $fn=20);

        //šroub pro připevnění k 888_2024
        translate([0, 0, RT57208M25_MR+RT57208M25_LB+wall_thickness+M6_screw_diameter/2+wall_thickness+height])
                rotate([0, -90, 0])
                    cylinder(d=M6_screw_diameter, h=(KBRM03_B/2+chasis_fork_thickness-888_2025_distance_space+2)*2, $fn=60, center=true);
    }
}

888_2025();
