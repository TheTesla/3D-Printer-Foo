rb = 48/2;
ri = 24/2;
rt = 5;
h = 50;
d = 0.7;
dp = 2.5;
s = 50;
sl = 40;
rl = 1.5;
twist = -120;

$fn = 30;
n = 5;

rh = 2;


mo = (rb-rt)/h;
mi = ri/h;
mang = twist/h;
for(i=[0:h/rh-1]){
	translate([0,0,i*rh]) rotate([0,0,i*rh*mang]) linear_extrude(height=rh, center=false, convexity=1, twist=-twist*rh/h,scale=(rb-(i+1)*rh*mo)/(rb-i*rh*mo), slices=3) conebase(rb-i*rh*mo, ri-i*rh*mi, d, n);
}

difference(){
	translate([-s/2,-s/2,0]) cube([s,s,dp]);

	cylinder(h,rb,rt);

	translate([-sl/2,-sl/2,0]) cylinder(r=rl,h=dp);
	translate([-sl/2,sl/2,0]) cylinder(r=rl,h=dp);
	translate([sl/2,-sl/2,0]) cylinder(r=rl,h=dp);
	translate([sl/2,sl/2,0]) cylinder(r=rl,h=dp);

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