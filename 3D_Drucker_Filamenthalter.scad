
$fn=50;

//Ar = 17/2;
h = 30;
Kr = 5/2;

b = 20;

anggap1 = 85;

d = 2;
d2 = d+2;

Sr = 15/2+d;

rl = 2;
sl = 20;

Hl = 140;
Hh = 20;
Hd = 10;

HSr = 5;
HSl = 157;
HWl = 100;
HWs = 40;
HWt = 6;

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
		translate([HSl,Hd-1-d2,Hh-HSr-0.1])rotate([90,0,0])# cylinder(r=HSr,h=Hd+2);
		translate([HSl-HSr,d-d2*2-1,Hh-HSr-0.1]) #cube([HSr*2,Hd+2,HSr*2]);
		translate([HWs-HSr,-d2*2-1,Hh-0.1])# minkowski(){
			cube([HWl,Hd+2,1]);
			rotate([0,45,0])cube(HWt);
		}
	}
}

