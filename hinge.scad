include <vars.scad>;

module hinge(){
  width = TRIANGLE_SIDE/4;
  size = TRIANGLE_THICKNESS;
  side = width/6*0.9;
  corner = 0.8;
    
  hull() {
    translate([-(width/2)+side/2, side*2, 0]) {
      cube([side, size, size], center=true);
    }
    translate([-(width/2)+side/2, -size/2+corner, size/2-corner]) {
      rotate(90, [0,1,0]) {
        cylinder(h=side, r=corner, center=true);
      }
    }
    translate([-(width/2)+side/2, -size/2+corner, -size/2+corner]) {
      rotate(90, [0,1,0]) {
        cylinder(h=side, r=corner, center=true);
      }
    }
  }
  hull() {
    translate([width/2-side/2, side*2, 0]) {
      cube([side, size, size], center=true);
    } 
    translate([width/2-side/2, -size/2+corner, size/2-corner]) {
      rotate(90, [0,1,0]) {
        cylinder(h=side, r=corner, center=true);
      }
    }
    translate([width/2-side/2, -size/2+corner, -size/2+corner]) {
      rotate(90, [0,1,0]) {
        cylinder(h=side, r=corner, center=true);
      }
    }
  }
  rotate(90, [0,1,0]) {
    cylinder(h=width, r=size/2*0.8/2, center=true);
  }
} 

color(COLOR, 1) {
  hinge();
}