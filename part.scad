include <vars.scad>;
use <triangle.scad>;
use <hinge.scad>;
use <clip.scad>;

module part() {
  difference() {
    union(){
      triangle();
      translate([-TRIANGLE_SIDE/8, -TRIANGLE_SIDE/4, 0]) {
        translate([0, 0, TRIANGLE_THICKNESS/2]) {
          rotate(-45, [1, 0, 0]) {
            translate([0, -TRIANGLE_THICKNESS/2, -TRIANGLE_THICKNESS/2]) {
              hinge();
            }
          }
        }
      }
      translate([-TRIANGLE_SIDE/8*3, -TRIANGLE_SIDE/4, 0]) {
        translate([0, 0, TRIANGLE_THICKNESS/2]) {
          rotate(-45, [1, 0, 0]) {
            translate([0, -TRIANGLE_THICKNESS/2, -TRIANGLE_THICKNESS/2]) {
              clip();
            }
          }
        }
      }
      translate([TRIANGLE_SIDE/4, 0, 0]) {
        rotate(135, [0, 0, 1]) {
          translate([0, -TRIANGLE_THICKNESS/2, 0]) {
            hinge();
          }
        }
      }
      translate([-TRIANGLE_SIDE/4, 0, 0]) {
        rotate(-135, [0, 0, 1]) {
          translate([0, -TRIANGLE_THICKNESS/2, 0]) {
            clip();
          }
        }
      }
    }
    translate([0, 0, -TRIANGLE_THICKNESS]) {
      cube([TRIANGLE_SIDE*2, TRIANGLE_SIDE*2, TRIANGLE_THICKNESS], center=true);
    }
  }
}

color(COLOR, 1) {
  part();
}