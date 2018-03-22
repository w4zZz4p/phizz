include <vars.scad>;
use <triangle.scad>;

STEP = 0.2;
SCALE_STEP = 1 - STEP;
ITERATIONS = 5;

module base() {
  difference() {
    triangle();
    
    for(i=[1:ITERATIONS])
      translate([0, 0 - STEP * 4, TRIANGLE_THICKNESS - STEP * i * 2])
       scale([0.5 - STEP * i / 4, 0.5 - STEP * i / 4, 1])
          triangle();
  }
}

color("LimeGreen", 1)
  base();
