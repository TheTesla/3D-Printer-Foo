
$fn = 50;

he = 7;
be = 10.5;

ht = 0.6;
h = 30.5+ht;
b = 75.5;
l = 33.5;

bt = 0.7;

lc = 20;
hcc = 19.5;
lcc = 11;
lcp = 16;
dch = 25;
rch = 1.4;

d = 6;
st = 0.5;
ds = 2-st;
ts = 3-st;
dh = 3;
dcs = 1;
lcs = 6;

bb = 15;

dc = 3;

bs = 12;
ls = 18;

difference(){
color([0,1,0]){
	translate([-lc-dc,+d+0.01,-dc-he/2]) cube([lc+d+dc-0.01,b+be+d/2+dc+d/2-0.02,h+he+dc*2]);
}
	translate([-lc,+d,-he/2]) cube([lc+0+d*0+1,b+be+d/2+d/2+0.01,h+he]);
	translate([-ls,+d+b+d/2+d/2-ts-0.01,h/2-bs/2]) cube([ls+d+1,be+dc+ts+0.02,bs]);

	difference(){
		union(){
			translate([-bt,0,0]) cube([l+2*d,b+bb+2*d,h]);
			translate([-lc,0,0]) cube([lc,d,h]);
		}
		translate([d/2-ds/2,-1,-1]) cube([ds,b+bb+d*2+2,ts+1]);
		translate([d/2-ds/2,-1,h-ts]) cube([ds,b+bb+d*2+2,ts+1]);
	
	}


union(){
	difference(){
		union(){
			cube([l+2*d,b+2*d,h]);
			translate([-lc,0,0]) cube([lc,d,h]);
		}
		translate([d,d,-1]) cube([l,b,h+2]);
		translate([d*2+l,dh,-1]) rotate([0,0,45]) cube([d*1.5,d*1.5,h+2]);
		translate([d*2+l,-dh+b,-1]) rotate([0,0,45]) cube([d*1.5,d*1.5,h+2]);
		translate([d+l-1,d+dh,-1]) cube([d+2,b-2*dh,h+2]);
		*translate([-1-lc,d/2-ds/2,h-ts]) cube([lc+l+2*d+2,ds,ts+1]);
		*translate([-1-lc,d/2-ds/2,-1]) cube([lc+l+2*d+2,ds,ts+1]);
		*translate([-1,b+d+d/2-ds/2,h-ts]) cube([l+2*d+2,ds,ts+1]);
		*translate([-1,b+d+d/2-ds/2,-1]) cube([l+2*d+2,ds,ts+1]);
		translate([d/2-ds/2,-1,-1]) cube([ds,b+d*2+2,ts+1]);
		translate([d/2-ds/2,-1,h-ts]) cube([ds,b+d*2+2,ts+1]);
	
		*translate([-lcp,-1,h/2-hcc/2]) cube([lcc,d+2,hcc]);
		*translate([d/2-ds/2,-1,-1]) cube([ds,ts+1,h+2]);
		translate([d/2-ds/2,b+d*2-ts,-1]) cube([ds,ts+1,h+2]);
		translate([-1-lc,d/2-ds/2,-1]) cube([ts+1,ds,h+2]);
		*translate([-1,b+d+d/2-ds/2,-1]) cube([ts+1,ds,h+2]);
	
		*translate([-lcp+lcc/2,-1,h/2-dch/2]) rotate([-90,0,0]) cylinder(r=rch,h=d+2);
		*translate([-lcp+lcc/2,-1,h/2+dch/2]) rotate([-90,0,0]) cylinder(r=rch,h=d+2);
	}
	
	difference(){
		translate([l+d,-bb-ds,0]) cube([d,bb+ds,h]);
		translate([l+d/2+ds/2,-bb,d/2-ds/2]) cube([d,bb,h-ds*2+d]);
		translate([l+d+1,-dcs,h-lcs]) cube([d,dcs,lcs+1]);
	
	}
}

}