
$fn = 50;

r1 = 3.3;
r2 = 4.5;
h = 10;

l = 40;
b = 5;
t = 4;

bl = 25;


rotate([90,0,0]){
	scale([r2/r1,1,1]) cylinder(h,r1,r1);
	translate([0,-t/2,0]) {
		cube([l,t,b]);
		translate([l,0,0]) cube([b,t,bl+2*b]);
	}
	
	translate([0,0,bl+2*b])
	rotate([180,0,0]){
		scale([r2/r1,1,1]) cylinder(h,r1,r1);
		translate([0,-t/2,0]) cube([l,t,b]);
	}

}