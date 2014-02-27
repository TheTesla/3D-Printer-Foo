rt = 5;
h = 50;
d = 0.7;
dp = 2.5;
s = 50;
sl = 40;
rl = 1.5;

sp = 0.5;

rb = 48/2+sp;


hw = 15;

$fn = 50;

rml = 5;
lm = 10;

difference(){
	union(){
		translate([-s/2-sp,-s/2,0]) cube([hw+sp,h,dp*2]);
	
		translate([-s/2,rml-s/2,dp]) {
			rotate([0,45,0])
			difference(){
				union(){		
					translate([-lm,0,0]) cylinder(r=rml,h=dp);
					translate([-lm,-rml,0]) cube([lm,rml*2,dp]);
				}
				translate([-lm,0,0]) cylinder(r=rl,h=dp);
			}
		}
		

	}
	#cylinder(h,rb+d,rt+d);
	#translate([-s/2-sp,-s/2,0]) cube([s+sp,s,dp]);

	translate([-sl/2,-sl/2,0]) cylinder(r=rl,h=dp*2);
	translate([-sl/2,sl/2,0]) cylinder(r=rl,h=dp*2);
	translate([sl/2,-sl/2,0]) cylinder(r=rl,h=dp*2);
	translate([sl/2,sl/2,0]) cylinder(r=rl,h=dp*2);

}