			       //improving rendering speed.
draft = true;   // sets rendering quality to draft.
$fs = draft ? 5 : 0.5;
$fa = 10;

//sestava listy, závaží, kování

module 666_2300(draft){

delka_listu = 970;
sirka_listu = 50;
uchytna_cast = 100;

translate([0,0,-1.5])
	rotate([-14,8,0])
		union(){
		translate([sirka_listu/2 - 8,29.5,6.5])
				union(){
				//list
				translate([-sirka_listu/2, delka_listu/2,6])
					rotate([0,0,0])
							import ("../../STL/rotor_blade.stl");

				//podložka listu
				translate([-35/4,0,0])
					rotate([0,0,90])
						color([0,0,1])
							import ("../../STL/666_1247.stl");

				//kování
				translate([-33.5 - 33.5/3.4 - 0.6,-15 + 1,0])
					rotate([180,0,90])
						color([1,0,0])
							import ("../../STL/666_1206.stl");

				//závěs
				translate([-34,-41,12])
					rotate([180,0,90 + 20])
						color([1,0,1])
							import ("../../STL/666_1232.stl");

		}

		translate([-sirka_listu/2 + 8,-29.5,6.5])	
			rotate([0,0,180])
				union(){
				//list
				translate([-sirka_listu/2, delka_listu/2,6])
					rotate([0,0,0])
							import ("../../STL/rotor_blade.stl");
				//podložka listu
				translate([-35/4,0,0])
					rotate([0,0,90])
						color([0,0,1])
							import ("../../STL/666_1247.stl");
				//kování
				translate([-33.5 - 33.5/3.4 - 0.6,-15 + 1,0])
					rotate([180,0,90])
						color([1,0,0])
							import ("../../STL/666_1206.stl");
				//závěs
				translate([-34,-41,12])
					rotate([180,0,90 + 20])
						color([1,0,1])
							import ("../../STL/666_1232.stl");

		}
		//domek
			rotate([0,0,90 + 20])
				color([1,0.5,0])
					import ("../../STL/666_1207.stl");

		//ozubená řemenice
		translate([0,0,-20])
			rotate([0,0,20])
				color([0.5,0,1])
					import ("../../STL/rotor_pulley.stl");
		}



//sestava rotorové hlavy
translate([0,0,-110])
	rotate([0,0,90])
		color([0.5,1,1])
			import ("../../STL/888_1101.stl");

}

//rotate([0,0,-20])
666_2300(draft);

use <./../lib/naca4.scad>
include <../../Parameters.scad>