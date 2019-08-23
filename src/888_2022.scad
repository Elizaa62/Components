//========== VIDLICE TVARU H ==========//

include <../parameters.scad>

wheel_screw_diameter = M6_screw_diameter;
wheel_nut_diameter = M6_nut_diameter;
wheel_nut_height = M6_nut_height;
wheel_screw_head_height = M6_head_height;
wheel_screw_head_diameter = M6_head_diameter;

wheel_tolerance = 15;
888_2022_wheel_diameter = wheel_diameter+wheel_tolerance;

height = 23;
connector_width = 10;
wheel_screw_overhang = 10;

module 888_2022(wheel=false) {
    translate([0, -(connector_width+material_around_bearing*2+696_bearing_outer_diameter), height/-2-material_around_bearing-696_bearing_outer_diameter/2]) {
    if(wheel) {
        #union() {
            translate([-fork_wheel_width*1/3/2, -888_2022_wheel_diameter/2, 0])
                rotate([0, -90, 0])
                    cylinder(d2=wheel_diameter-30, d1=wheel_diameter, h=fork_wheel_width*1/3, $fn=20);
            translate([fork_wheel_width*1/3/2, -888_2022_wheel_diameter/2, 0])
                rotate([0, 90, 0])
                    cylinder(d2=wheel_diameter-30, d1=wheel_diameter, h=fork_wheel_width*1/3, $fn=20);
            translate([0, -888_2022_wheel_diameter/2, 0])
                rotate([0, 90, 0])
                    cylinder(d=wheel_diameter, h=fork_wheel_width*1/3, center=true, $fn=20);
        }
    }
    
    difference() {
        union() {
            translate([-chasis_fork_thickness-fork_wheel_width/2, -888_2022_wheel_diameter/2-wheel_screw_overhang, -height/2])
                cube([chasis_fork_thickness*2+fork_wheel_width, 888_2022_wheel_diameter/2+wheel_screw_overhang+connector_width, height]);

            hull() {
                translate([-chasis_fork_thickness-fork_wheel_width/2, connector_width, -height/2])
                    cube([chasis_fork_thickness*2+fork_wheel_width, 20, height]);

                translate([0, connector_width+material_around_bearing*2+696_bearing_outer_diameter, height/2+696_bearing_outer_diameter/2+material_around_bearing])
                    rotate([0, 90, 0])
                        cylinder(d=696_bearing_outer_diameter+material_around_bearing*2, h=chasis_fork_thickness*2+fork_wheel_width, $fn=100, center=true);
            }
        }

        //kolo
        translate([0, -888_2022_wheel_diameter/2-fork_wheel_width/2, 0])
            cube([fork_wheel_width, 888_2022_wheel_diameter, 888_2022_wheel_diameter], center=true);

        //kolo
        translate([0, -fork_wheel_width/2, 0])
            cylinder(d=fork_wheel_width, h=height*2, $fn=50, center=true);

        //uchycení
        translate([-fork_wheel_width/2-0.2, connector_width, -height*5])
            cube([fork_wheel_width+0.4, 300, height*10]);

        //šroub u kola
        translate([0, -888_2022_wheel_diameter/2, 0])
            rotate([0, 90, 0])
                cylinder(d=wheel_screw_diameter, h=chasis_fork_thickness*2+fork_wheel_width+10, center=true, $fn=20);

        //matka šroubu u kola
        translate([fork_wheel_width/2+chasis_fork_thickness-wheel_nut_height, -888_2022_wheel_diameter/2, 0])
            rotate([0, 90, 0])
                cylinder(d=wheel_nut_diameter, h=wheel_nut_height+0.1, $fn=6);

        //hlavička šroubu u kola
        translate([-fork_wheel_width/2-chasis_fork_thickness+wheel_screw_head_height, -888_2022_wheel_diameter/2, 0])
            rotate([0, -90, 0])
                cylinder(d=wheel_screw_head_diameter, h=wheel_screw_head_height+0.1, $fn=20);

        //šroub pístu
        translate([0, -888_2022_wheel_diameter/2+screw_spring_distance, 0])
            rotate([0, 90, 0])
                cylinder(d=M3_screw_diameter, h=chasis_fork_thickness*2+fork_wheel_width+10, center=true, $fn=20);

        //matka šroubu u pístu
        translate([0, -888_2022_wheel_diameter/2+screw_spring_distance, 0])
            rotate([0, 90, 0])
                cylinder(d=M3_nut_diameter, h=M3_nut_height*2+fork_wheel_width, center=true, $fn=6);

        //šroub uchycení
        translate([0, connector_width+material_around_bearing*2+696_bearing_outer_diameter, height/2+696_bearing_outer_diameter/2+material_around_bearing])
            rotate([0, 90, 0])
                cylinder(d=M6_screw_diameter, h=chasis_fork_thickness*2+fork_wheel_width+10, $fn=20, center=true);
    }
    }
}

888_2022(false);