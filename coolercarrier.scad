rb = 48/2;
rt = 5;
h = 50;
d = 0.7;
dp = 2.5;
s = 50;
sl = 40;
rl = 1.5;

$fn = 50;

difference(){
	union(){
		cylinder(h,rb+d,rt+d);
		translate([-s/2,-s/2,0]) cube([s,s,dp]);
	}
	cylinder(h,rb,rt);

	translate([-sl/2,-sl/2,0]) cylinder(r=rl,h=dp);
	translate([-sl/2,sl/2,0]) cylinder(r=rl,h=dp);
	translate([sl/2,-sl/2,0]) cylinder(r=rl,h=dp);
	translate([sl/2,sl/2,0]) cylinder(r=rl,h=dp);

}