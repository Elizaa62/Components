include <../../parameters.scad>
use <../888_1025.scad>

draft = false;

translate([0,30,-340])
    rotate([0,90,0])
        888_1025_part_C(2, draft);
