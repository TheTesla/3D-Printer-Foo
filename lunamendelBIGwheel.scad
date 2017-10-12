use <mendel_misc.inc>
use <parametric_involute_gear_v5.0.scad>

$fn=50;



r = 30.7;

teeth = 40;

cp = 2*r/teeth*180;


rs = 1.6;

tr = 7;
th = 15;
dh = 20;

ns = 3;

difference(){
    gear(number_of_teeth=teeth,
        circular_pitch=cp,
        gear_thickness = 5,
        rim_thickness = tr,
        rim_width = 3,
        hub_thickness = th,
        hub_diameter = dh,
        bore_diameter = 4,
        circles=6,
        twist = 0);
    
    for (i = [0:ns-1]){
        translate([0,0,tr+(th-tr)/2]) rotate([0,90,i/ns*360]) cylinder(r=rs,h=dh/2+1);
    }
}
