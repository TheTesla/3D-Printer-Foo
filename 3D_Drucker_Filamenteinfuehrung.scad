l = 23.5;
b1 = 28;
db1 = 20;

h = 50;
r1 = 2.5;
r2 = 2.6;
t = 2;

dh1=9.4;
dh2=32.2;
db2=16;

d1 = 2.5;
d2 = 4;

df = 4;
dl = l+d1;

b2 = 18;

le=5;

module triangle(w, b, h) {
	polyhedron(
		points=[
			[0,0,0], [w,0,0], [0,b,0], [w,b,0],
			[0,0,h], [w,0,h]
		],
		triangles=[
			[0,1,2], [2,1,3],
			[1,0,4], [5,1,4],
			[0,2,4], [3,1,5],
			[2,3,4], [3,5,4]
		]);
}

translate([b1/2,d2+df,h+d2])
difference() {
	difference() {
		translate([0,(r2+d1+l+d1-df)/2-r2-d1,le/2])
		cube(size=[2*(r2+d1),r2+d1+l+d1-df,le],center=true);
		cylinder(h=le,r=r2);
	}
}

difference() {
	cube(size=[b1,l+d1+d2,h+d2]);
	cube(size=[b1,l,h-t]);
	translate([0,d2,0])
		cube(size=[b1,l,h]);
	translate([(b1-db1)/2,0,h-t])
		cube(size=[db1,d2,t]);
	translate([0,l-dl+d1+d2,0])
		cube(size=[(b1-b2)/2,dl,h]);
	translate([b2+b1/2-b2/2,l-dl+d1+d2,0])
		cube(size=[(b1-b2)/2,dl,h]);
	translate([b1/2,d2+df,h])
		cylinder(h=d2+le,r=r2);

	translate([(b1+b2)/2+(b1-b2)/2+1,l+d2+d1+1,h+d2+.05])
	rotate([180,90,0])
		triangle(d2*1.1,l+d1,(b1-b2)/2);

	translate([-1,l+d2+d1+1,h])
	rotate([180,-90,0])
		triangle(d2*1.1,l+d1,(b1-b2)/2);

	translate([b1/2-db2/2,l+d2+d1/2,h-dh1])
		cube(size=[2*r1,d1,2*r1], center=true);
	translate([b1/2+db2/2,l+d2+d1/2,h-dh1])
		cube(size=[2*r1,d1,2*r1], center=true);
	translate([b1/2-db2/2,l+d2+d1/2,h-dh2])
		cube(size=[2*r1,d1,2*r1], center=true);
	translate([b1/2+db2/2,l+d2+d1/2,h-dh2])
		cube(size=[2*r1,d1,2*r1], center=true);

	cube(size=[b1,l+d1+d2,2*r1]);
}