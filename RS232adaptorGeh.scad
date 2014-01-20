 

$fn=5;


l = 14;
b = 20;
h = 27;
ho = 3;
bo = 14;
ao = 1.5;

d = 0.7;



btl = 31;
ltl = 14;
htl = 2;
hptl = 2;

bt = 23;
lt = ltl+2;
ht = 2*d+htl+3;


btfl = 31;
ltfl = 11;


translate([0,b/2+1.6,0]) rotate([90,0,0]) scale(6)linear_extrude(0.2)polygon([[0,0],[0,1],[1,0]],[[0,1,2]]);

difference(){
	union(){
		translate([-(lt-l)/2,-(bt-b)/2,h+d]) cube([lt+2*d,bt+2*d, ht]);
		cube([l+2*d,b+2*d,h+d]);

	}
	translate([d,d,d]) cube([l,b,h+ht+1]);
	translate([-(ltl-l-2*d)/2,-(btl-b-2*d)/2,h+hptl+2*d]) cube([ltl,btl,htl]);
	translate([-(ltfl-l-2*d)/2,-(btl-b-2*d)/2,h+hptl+2*d]) cube([ltfl,btfl,ht-hptl+1]);

	translate([d+l/2,d+(b-bo)/2,d+ao]) cube([l,bo,ho]);


}