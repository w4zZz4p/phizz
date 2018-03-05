include <vars.scad>;
use <base.scad>;
use <hinge.scad>;
use <clip.scad>;

module part() {
  difference() {
    union() {
      base();
      
      translate([TRIANGLE_SIDE/8, -TRIANGLE_SIDE/4, 0])
        translate([0, 0, TRIANGLE_THICKNESS/2])
          rotate(-45, [1, 0, 0])
            translate([0, -TRIANGLE_THICKNESS/2, -TRIANGLE_THICKNESS/2])
              hinge();
      
      translate([TRIANGLE_SIDE/8*3, -TRIANGLE_SIDE/4, 0])
        translate([0, 0, TRIANGLE_THICKNESS/2])
          rotate(-45, [1, 0, 0])
            translate([0, -TRIANGLE_THICKNESS/2, -TRIANGLE_THICKNESS/2])
              clip();
    }
    
    translate([0, 0, -TRIANGLE_THICKNESS])
      cube([TRIANGLE_SIDE*2, TRIANGLE_SIDE*2, TRIANGLE_THICKNESS], center=true);
    
    translate([TRIANGLE_SIDE/4, 0, 0])
      rotate(45, [0,0,1])
        translate([0, -TRIANGLE_SIDE+TRIANGLE_SIDE/4, -TRIANGLE_THICKNESS/2])
          cube([TRIANGLE_THICKNESS, TRIANGLE_SIDE, TRIANGLE_THICKNESS], center=false);
  }
  
  translate([TRIANGLE_SIDE/4, 0, 0])
    rotate(135, [0, 0, 1])
      translate([0, -TRIANGLE_THICKNESS/2-JOINT_TOLLERANCE, 0])
        hinge();
  
  translate([-TRIANGLE_SIDE/4, 0, 0])
    rotate(-135, [0, 0, 1])
      translate([0, -TRIANGLE_THICKNESS/2-JOINT_TOLLERANCE, 0])
        clip();
}

color("LimeGreen", 1)
  part();

