include <vars.scad>;

module clip(){
  tollerance = 0.9;
  max_width = JOINT_WIDTH - JOINT_TOLLERANCE; 
  hinge_side = max_width/6;
  width = (max_width-hinge_side*2) - JOINT_TOLLERANCE;
  size = TRIANGLE_THICKNESS;
  corner = 0.5;

  echo("clip width:", width);
    
  difference() {
    hull() {
      translate([0, size, 0]) {
        cube([width, size, size], center=true);
      }
      translate([0, -size/2+corner, size/2-corner]) {
        rotate(90, [0, 1, 0]) {
          cylinder(h=width, r=corner, center=true);
        }
      }
      translate([0, -size/2+corner, -size/2+corner]) {
        rotate(90, [0, 1, 0]) {
          cylinder(h=width, r=corner, center=true);
        }
      }
    }
    translate([0, -size/2, 0]) {
      cube([JOINT_WIDTH, size, size/3], center=true);
    }
    rotate(90, [0, 1, 0]) {
      cylinder(h=JOINT_WIDTH, r=size/2*1/2, center=true);
    }
  }
}

color(COLOR, 1) {
  clip();
}