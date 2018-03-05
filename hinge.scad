include <vars.scad>;

FACE_ANGLE = 360/$fn;

module hinge() {
  width = JOINT_WIDTH-JOINT_TOLLERANCE;
  size = TRIANGLE_THICKNESS;
  side = width/6;
  corner = 0.9;
  
  echo("hinge widths (all, side, cylinder):", width, side, width-side*2);
    
  hull() {
    translate([-(width/2)+side/2, size, 0])
      cube([side, size, size], center=true);
    
    translate([-(width/2)+side/2, -size/2+corner, size/2-corner])
      rotate(90, [0, 1, 0])
        cylinder(h=side, r=corner, center=true);
    
    translate([-(width/2)+side/2, -size/2+corner, -size/2+corner])
      rotate(90, [0, 1, 0])
        cylinder(h=side, r=corner, center=true);
  }
  
  hull() {
    translate([width/2-side/2, size, 0])
      cube([side, size, size], center=true);
    
    translate([width/2-side/2, -size/2+corner, size/2-corner])
      rotate(90, [0, 1, 0])
        cylinder(h=side, r=corner, center=true);
    
    translate([width/2-side/2, -size/2+corner, -size/2+corner])
      rotate(90, [0, 1, 0])
        cylinder(h=side, r=corner, center=true);
  }
  
  rotate(FACE_ANGLE/2, [1, 0, 0]) // Required so that cylinder face is parallel to plane
    rotate(90, [0, 1, 0])
      cylinder(h=width, r=size/2*0.7/2, center=true);
} 

color("LimeGreen", 1)
  hinge();
