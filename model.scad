$fn = 10;
triangleSide = 40; // Triangle side size
triangleThickness = 4; // Triagle thickness
corner = 0.8;
hollow = true;

function pitagor(a, b) = sqrt(pow(a, 2) + pow(b, 2));


//
// --- hinge
module hinge(){
  width = triangleSide/4;
  size = triangleThickness;
  side = width/6*0.9;
  echo(side);
    
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

//
// --- clip
module clip(){
  width = triangleSide/4;
  size = triangleThickness;
    
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
//
// --- triangle
module triangle(){
  translate([0, 0, -triangleThickness/2]) {
    linear_extrude(triangleThickness) {
      polygon([[-triangleSide/2, -triangleSide/4], [0, triangleSide/4], [triangleSide/2, -triangleSide/4]]);
    }
  }
}
//
// --- part itself
module part() {
  color("LimeGreen", 1.0) {
    difference() {
      union(){
        triangle();
        translate([-triangleSide/8, -triangleSide/4, 0]) {
          translate([0, 0, triangleThickness/2]) {
            rotate(-45, [1, 0, 0]) {
              translate([0, -triangleThickness/2, -triangleThickness/2]) {
                hinge();
              }
            }
          }
        }
        translate([-triangleSide/8*3, -triangleSide/4, 0]) {
          translate([0, 0, triangleThickness/2]) {
            rotate(-45, [1, 0, 0]) {
              translate([0, -triangleThickness/2, -triangleThickness/2]) {
                clip();
              }
            }
          }
        }
        translate([triangleSide/4, 0, 0]) {
          rotate(135, [0, 0, 1]) {
            translate([0, -triangleThickness/2, 0]) {
              hinge();
            }
          }
        }
        translate([-triangleSide/4, 0, 0]) {
          rotate(-135, [0, 0, 1]) {
            translate([0, -triangleThickness/2, 0]) {
              clip();
            }
          }
        }
      }
      translate([0, 0, -triangleThickness]) {
        cube([triangleSide*2, triangleSide*2, triangleThickness], center=true);
      }
    }
  }
}
//
// --- demo assembly
module assembly() {
  translate([0, triangleSide/2/2 + pitagor(triangleThickness, triangleThickness) / 2, -triangleThickness/2]) {
    part();
  }

  rotate(18, [1,0,0]) {
    translate([-triangleSide/2, triangleSide/2/2 + pitagor(triangleThickness, triangleThickness) / 2, triangleThickness/2]) {
      rotate(180, [0,0,1]) {
        rotate(180, [1,0,0]) {
          part();
        }
      }
    }
  }
}


part();
//triangle();
//assembly();
//hinge();
//clip();










