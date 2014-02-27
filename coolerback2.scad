rb = 46/2;
ri = 24/2;
rt = rb;
h = 20;
d = 0.7;
dp = 1.0;
s = 50;
sl = 40;
rl = 1.7;
twist = -24;

$fn = 30;
n = 5;

hi=0;

mirror([1,0,0]){

	difference(){
		union(){
			linear_extrude(height=h, center=false, convexity=1, twist=twist,scale=1, slices=30) conebase(rb, ri, d, n);
			cylinder(r=ri,h=hi+d);
		}
		cylinder(r=rb,h=hi);
	}
	
	difference(){
		translate([-s/2,-s/2,0]) cube([s,s,dp]);
	
		cylinder(h,rb,rt);
	
		translate([-sl/2,-sl/2,0]) cylinder(r=rl,h=dp);
		translate([-sl/2,sl/2,0]) cylinder(r=rl,h=dp);
		translate([sl/2,-sl/2,0]) cylinder(r=rl,h=dp);
		translate([sl/2,sl/2,0]) cylinder(r=rl,h=dp);
	
	}
}

module conebase(rb, ri, d, n)
{
	intersection(){
		circle(rb+d);
		union(){
			difference(){
				circle(rb+d);
				circle(rb);
			}
			difference(){
				circle(ri);
				circle(ri-d);
			}
			for(i = [0:n]){
				rotate([0,0,i*360/n]) translate([ri-d,0,0])square([d,rb]);
			}
		}
	}
}