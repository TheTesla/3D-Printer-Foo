
$fn=50;

//Ar = 17/2;
h = 20;
Kr = 5/2;

b = 20;

anggap1 = 85;

d = 2;
d2 = d;

Sr = 15/2+d;

rl = 2;
sl = 20;

Hl = 50;
Hh = 10;
Hd = 5;

HSr = 5;
HSl = 157;
HWl = 100;

lf = 79;
bf = 36;
hf = 10;
Wbf = 5;
Wrf = 10;
df = d*1.5;

lpf = 37;


module frame(l, b, h, Wb, Wr, d)
{
	difference(){
		cube([l+2*d,b+2*d,h+2*d]);
		translate([d,d,d])cube([l,b,h+4*d]);
	
		rotate([90,0,0])
		translate([Wb+Wr+d,Wb+Wr+d,-4*d-b]){
			minkowski(){
				cube([l-2*(Wb+Wr),max(l,b,h)+4*d+2*Wr,b+8*d]);
				cylinder(r=Wr,h=1);
			}
		}
	
		rotate([0,-90,0])
		translate([Wb+Wr+d,Wb+Wr+d,-4*d-l]){
			minkowski(){
				cube([max(l,b,h)+4*d+2*Wr,b-2*(Wb+Wr),l+8*d]);
				cylinder(r=Wr,h=1);
			}
		}
	
		translate([Wb+Wr+d,Wb+Wr+d,-4*d]){
			minkowski(){
				cube([l-2*(Wb+Wr),b-2*(Wb+Wr),h+8*d]);
				cylinder(r=Wr,h=1);
			}
		}
	}
}

module halter1(anggap)
{
	minkowski(){
		union(){
			difference(){
				cylinder(r=Sr+1,h=h);
				translate([0,0,-1])cylinder(r=Sr,h=h+2);
				translate([-Sr-3,0,-1])cube([3*Sr,3*Sr,h+2]);
				rotate([0,0,-anggap])translate([-Sr-3,0,-1])cube([3*Sr,3*Sr,h+2]);
			}
			
			translate([-Sr-Kr-1,0,0])
			rotate([0,0,0])
			intersection(){
				difference(){
					cylinder(r=Kr+1,h=h);
					translate([0,0,-1])cylinder(r=Kr,h=h+2);
				}
				translate([0,0,-1])cube([3*(Kr+1),3*(Kr+1),h+2]);
			}
		}
		cylinder(r=d,h=1);
	}
}



difference(){
	union(){
		translate([0,0,0]) rotate([0,0,-45])mirror([0,1,0]) halter1(anggap1);
	
		translate([-Sr-Kr-d/2,Kr+d/2,0]){
			difference(){
			cylinder(r=3*d,h=h+1);
			translate([0,-4*d,-1])cube([4*d,4*d,h+3]);
			rotate([0,0,45]) translate([0,-4*d,-1])cube([4*d,4*d,h+2]);
	
			}
		}
	}
	scale([1.02,1.1,1.1])translate([0,0,-0.1]) halter1(anggap1);

}



xp = Sr*cos(anggap1-45);
yp = -d+Sr*sin(anggap1-45);

difference(){
	translate([xp,yp,0]) cube([b-xp+Sr-2,2*d,h+1]);
	translate([sl,2*d+1+yp,rl/2+h/2-1/2]) rotate([90,0,0]) cylinder(r=rl,h=2*d+2);
}

sk = 3;





translate([0,-10,0])
color([1,0,0]){
	difference(){
		union(){
			translate([Sr,d-d2*2,0])cube([b,2*d2,h+1]);
			halter1(0);
		}
		translate([sl,d+1,rl/2+h/2-1/2]) rotate([90,0,0]) #cylinder(r=rl,h=2*d2+2);
	}
	difference(){
		translate([sl+Sr,d-d2*2,0]){
			difference(){
				union(){
					cube([Hl,Hd,Hh]);
					translate([0,0,Hh])difference(){
						cube([sk,Hd,sk]);
						translate([sk,-1,sk]) rotate([-90,0,0]) cylinder(r=sk,h=Hd+2);
					}	
				}
				translate([0,Hd,-1]) cylinder(r=Hd-d2*2,h=max(Hh,h)+2);
			}

		}
			translate([lpf+bf+df*2,Hd-d,-1]) rotate([0,0,-135]) translate([-Hd,0,0])#cube([Hh*2,Hd+2,Hh*2]);

	}

	translate([lpf,Hd-d2*2+d,0]) frame(bf,lf,hf,Wbf,Wrf,df);

}

