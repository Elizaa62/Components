include <../../Parameters.scad>
use <../333_1037.scad>

use <rotor_blade_double.scad>

$vpd = 680;

draft = true;        
plywood_thickness = 4;
thickness = 30;
core_thickness = 1.0;
length = 970;       // celková délka polotovaru
material_width = 70;
side_margin = 10; 

difference()
{
    x_size = 2*material_width + 3*side_margin;
    y_size = length + 2*side_margin;
    translate([-x_size/2, -y_size/2, 0])
        cube([x_size,y_size, thickness]);

    translate([0, 0, thickness + plywood_thickness + core_thickness/2])
        rotate([0,180,0])
            rotor_blade_double(draft);
}



