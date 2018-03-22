include <vars.scad>;

module triangle() {
    difference() {
      translate([0, 0, -TRIANGLE_THICKNESS/2])
        linear_extrude(TRIANGLE_THICKNESS)
          polygon([[-TRIANGLE_SIDE/2, -TRIANGLE_SIDE/4], [0, TRIANGLE_SIDE/4], [TRIANGLE_SIDE/2, -TRIANGLE_SIDE/4]]);
        
      translate([0, 0, -TRIANGLE_THICKNESS/2 + FLEX_THICKNESS])
        linear_extrude(TRIANGLE_THICKNESS)
          polygon([ [0 - FLEX_WIDTH / 2, -20], [FLEX_WIDTH / 2, -20], [FLEX_WIDTH / 2, 20], [0 - FLEX_WIDTH / 2, 20] ]);
   }
}

color("LimeGreen", 1)
  triangle();
