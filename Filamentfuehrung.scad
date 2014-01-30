l = 15;
b = 26;
h = 30;
sh= 3.3;
df = 5;
rf = 10;

ang = 12;

anga = 55;

bh = 60;

$fn = 50;

hs = 4;

rr = 15/2;
ra = 16;

fr = 3.1/2;
ffr = 5.2/2;
ffh = 1;
ffha = 12;

module halbfeder_r(l,b,h,rf,df,sh,ra)
{
	translate([0,-b,-h/2])
	difference(){
		union(){
			translate([0,b-ra,h/2]) rotate([0,90,0]) cylinder(r=b/2,h=l);
			translate([0,b,h/2]) rotate([0,90,0]) cylinder(r=rf,h=l);
		}
		translate([-1,-ra-1,h/2-sh/2]) #cube([l+2,ra+b+1.001,h+rf]);
		translate([-1,b,h/2]) rotate([0,90,0]) cylinder(r=rf-df,h=l+2);
	}
}



module halbrohrklipp(l,b,h,rf,df,sh,rr,ra,anga)
{
	difference(){
		halbfeder_r(l,b,h,rf,df,sh,ra);
		rotate([0,90,0]) translate([0,-ra,-1]) #cylinder(r=rr, h=l+2);
		translate([-1,-ra,0]) rotate([90+anga,0,0]) #cube([l+2,ra,ra]);
	}

}

module rohrklipp(l,b,h,rf,df,sh,ang,rr,ra,anga)
{
	halbrohrklipp(l,b,h,rf,df,sh,rr,ra,anga);
	rotate([ang,0,0]) mirror([0,0,1]) halbrohrklipp(l,b,h,rf,df,sh,rr,ra,anga);
}

	rohrklipp(l,b,h,rf,df,sh,ang,rr,ra,anga);

difference(){
	union(){
		translate([0,rf-df,0]) cube([l,bh-rf-ra,hs]);
		translate([l/2,bh-df-ra,0]) cylinder(r=l/2,h=ffha);
	}
	translate([l/2,bh-df-ra,-1]) #cylinder(r=fr,h=ffha+2);
	translate([l/2,bh-df-ra,ffh]) #cylinder(r=ffr,h=ffha+2);
}
