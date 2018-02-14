include <vars.scad>;

module triangle(){
  translate([0, 0, -TRIANGLE_THICKNESS/2]) {
    linear_extrude(TRIANGLE_THICKNESS) {
      polygon([[-TRIANGLE_SIDE/2, -TRIANGLE_SIDE/4], [0, TRIANGLE_SIDE/4], [TRIANGLE_SIDE/2, -TRIANGLE_SIDE/4]]);
    }
  }
}

color(COLOR, 1) {
  triangle();
}