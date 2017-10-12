use <mendel_misc.inc>
use <parametric_involute_gear_v5.0.scad>

$fn=50;



r = 40.5/(40+11)*11-0.3;

teeth = 11;

cp = 2*r/teeth*180;


rs = 1.6;

tr = 17;
th = 25;
dh = 20;

ns = 3;

difference(){
    gear(number_of_teeth=teeth,
        circular_pitch=cp,
        gear_thickness = 17,
        rim_thickness = tr,
        rim_width = 4,
        hub_thickness = th,
        hub_diameter = dh,
        bore_diameter = 5.3,
        circles=6,
        twist = 0);
    
    for (i = [0:ns-1]){
        translate([0,0,tr+(th-tr)/2]) rotate([0,90,i/ns*360]) cylinder(r=rs,h=dh/2+1);
    }
}
