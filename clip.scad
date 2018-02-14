include <vars.scad>;

module clip(){
  width = TRIANGLE_SIDE/4;
  size = TRIANGLE_THICKNESS;
  corner = 0.8;
    
  difference() {
    hull() {
      translate([0, size, 0]) {
        cube([size, size, size], center=true);
      }
      translate([0, -size/2+corner, size/2-corner]) {
        rotate(90, [0,1,0]) {
          cylinder(h=size, r=corner, center=true);
        }
      }
      translate([0, -size/2+corner, -size/2+corner]) {
        rotate(90, [0,1,0]) {
          cylinder(h=size, r=corner, center=true);
        }
      }
    }
    translate([0, -size/2, 0]) {
      cube([width*0.9, size, size/3], center=true);
    }
    rotate(90, [0,1,0]) {
      cylinder(h=width*0.9, r=size/2*1/2, center=true);
    }
  }
}

clip();