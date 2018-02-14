include <vars.scad>;
use <part.scad>;

module assembly() {
  function pitagor(a, b) = sqrt(pow(a, 2) + pow(b, 2));

  translate([0, TRIANGLE_SIDE/2/2 + pitagor(TRIANGLE_THICKNESS, TRIANGLE_THICKNESS) / 2, -TRIANGLE_THICKNESS/2]) {
    part();
  }

  rotate(25, [1,0,0]) {
    translate([-TRIANGLE_SIDE/2, TRIANGLE_SIDE/2/2 + pitagor(TRIANGLE_THICKNESS, TRIANGLE_THICKNESS) / 2, TRIANGLE_THICKNESS/2]) {
      rotate(180, [0,0,1]) {
        rotate(180, [1,0,0]) {
          part();
        }
      }
    }
  }
}

color(COLOR, 1) {
  assembly();
}