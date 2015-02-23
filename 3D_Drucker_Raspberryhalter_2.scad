
$fn=50;

//Ar = 17/2;
h = 20;
Kr = 5/2;

b = 20;

anggap1 = 105;

d = 2;
d2 = d+2.5;

Sr = 15.0/2+d;

rl = 2;
sl = 20;

Hl = 100;
Hh = 10;
Hd = 5;


lf = -10;
bf = -10;
hf = 10;

Hl2 = 85;

bf2 = 27.2;
lf2 = 73.5;
hf2 = 20;

Wbf = 3;
Wrf = 5;
df = d*1.5;

lpf = 47;

xp = Sr*cos(anggap1-45);
yp = -d+Sr*sin(anggap1-45);

sk = 3;


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


mirror([0,1,0]) {
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





difference(){
	translate([xp,yp,0]) cube([b-xp+Sr-2,2*d,h+1]);
	translate([sl,2*d+1+yp,rl/2+h/2-1/2]) rotate([90,0,0]) cylinder(r=rl,h=2*d+2);
}






translate([0,-10,0])
color([1,0,0]){
	difference(){
		union(){
			translate([Sr,d-d2*2,0]) cube([b,2*d2,h+1]);
			halter1(0);
		}
		translate([sl,d+1,rl/2+h/2-1/2]) rotate([90,0,0]) #cylinder(r=rl,h=2*d2+2);
	}
	translate([sl+Sr,d/2-d2*2,0]){
		difference(){
			union(){
				translate([0,df-Hl2,0]) cube([Hd,d2*2+d/2-df+Hl2,Hh]);
				translate([-df*2-bf,-Hl+df,0]) frame(bf,lf,hf,Wbf,Wrf,df);
				translate([-df*2-bf2,-Hl2+df,0]) frame(bf2,lf2,hf2,Wbf,Wrf,df);
				translate([-bf-df*2,df*3-Hl2+lf2,0]) cube([df,Hl2-Hl-lf2-df*2,Hh]);
				translate([0,d/2,Hh])difference(){
					cube([sk,d2*2,sk]);
					translate([sk,-1,sk]) rotate([-90,0,0]) cylinder(r=sk,h=d2*2+2);
				}	
			}
			translate([0,df-Hl2,-1]) rotate([0,0,-135]) translate([-Hd*2,0,0])cube([Hd*2,Hd+2,Hh*2]);
			translate([0,d2*2+d/2,-1]) rotate([0,0,-45]) cube([Hd*2,Hd+2,Hh*2]);
		}

	}

	


}

}