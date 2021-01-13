  //  This program is free software: you can redistribute it and/or modify
  //  it under the terms of the GNU General Public License as published by
 ///   the Free Software Foundation, either version 3 of the License, or
 //   (at your option) any later version.
//
 //   This program is distributed in the hope that it will be useful,
  //  but WITHOUT ANY WARRANTY; without even the implied warranty of
  //  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 //   GNU General Public License for more details.

 //   You should have received a copy of the GNU General Public License
 //   along with this program.  If not, see <https://www.gnu.org/licenses/>.

//FILAMENT SPOOL HOLDER DESIGNED FOR USE WITH MMU2S HARDWARE
//Designed by osimmac


//Dont mess with these variables
// Global resolution
$fs = 0.01;  // Don't generate smaller facets than 0.01 mm
$fa = 1;    // Don't generate larger angles than 5 degrees



//CONSTANTS FOR REFERENCE!
//bearing diameter = 22mm
//rod diameter = 7.85mm
//rod hole diameter = 6mm


//User Variables
//MAIN ARM VARIABLES
//Rod Hole size
  //changing the value below will change the size of the hole the rod is inserted to. try changing the size in 0.05 or 0.1mm increments. 
 holediameter = 8.2;
 
 //Rod peg size
  //changes size of peg that goes into rod
  pegdiameter = 5.7;
  
  
  //ROLLER VARIABLES
 //changes hole diameter for bearing
bearingdiameter = 22.08;


  //CAP VARIABLES
   //changes size of peg that goes into other end of rod, should be more snug than rodpegsize
  cappegdiameter = 5.75;


//RENDERING / OUTPUT BEGIN
//Leave only 1 uncommented to render and get STL for that object only. alter and print just the test piece if you need to adjust fitment for rod. If you just edit the fitment for the hole, then you can use orignal cap and roller stl and just render a new Main Arm. if not, do this  for each of the 3 pieces. spollroller(); should stay commented as its depricated.
//spoolroller();

//Test  Piece!!
translate([-50,0,0])testpiece();

//Roller Piece
 spoolroller2();
 
 //Cap Piece
rotate(180,[0,1,0])translate([0,0,-108])spoolcap();
 //Main Arm Piece
translate([0,0,-2])spoolarm();

//once setup, press f6 to render and then f7 to export as stl. these actions are also at the top of application. may need to add .stl to end of file when exporting.

//RENDERING /OUTPUT END!!!




//BEGINNGING OF ACTUAL CODE
//This spool holder is spilt up into modules/parts, these parts are:
//---Test Piece (for testing fitment)
//---Spool Roller 2 (it has the angled center)
//---Spool Rolled (depricated and lame)
//---Spool Cap (cap on the end)
//---Spool Arm (main structure)

//Test piece to test fitment of rod.
//Should be hard to insert but not impossible, it should go in around 1cm and feel secure
//NOTE: there is a 1.7 degree tilt in the hole to counter act sag when loaded with filament
module testpiece(){

    union(){
       
    rotate(1.7,[0,1,0])translate([0,0,-13])color("DarkGreen")cylinder(h=20,r=pegdiameter/2);
    difference(){
    translate([-12,-10,-14])color("Green")cube([25,20,15]);
     //changing the radius (r) of the cyclinder below will change the size of the hole the rod is inserted to. try changing the size in .05 or .1mm increments. 
    rotate(1.7,[0,1,0])translate([0,0,-11.8])cylinder(h=13,r=holediameter/2);
    }
    }

  
   }

//high tech self stablizing roller 
 //this is created by making a long thin polygon with 3 bends in it, requiring 10 points, translating it away from the origin by the radius of bearing and rotate extruding it around the z axis.
   
   //polygons start at the origin and work their way from there. its basically 2 lines with 5 points, offset with thickness of walls desired.
module spoolroller2(){

     color("Purple")rotate_extrude(angle=360) {
         translate([bearingdiameter/2,0,0])rotate([0,0,0])polygon([[0,0],[0,7.05],[-6.325,106/2],[0,106-7.05],[0,106],[1.175,106],[1.175,106-7.05],[-5.15,106/2],[1.175,7.05],[1.175,0]]);
     }
}

//deprecated flat roller
module spoolroller(){
    difference(){
    color("Blue")cylinder(h=106,r=bearingdiameter+2.4/2);
    translate([0,0,-.05])color("Red")
                            cylinder (h=106.1,r = bearingdiameter/2);
}
}   


//cap that goes on other end of rod and acts as safeguard preventing spool from coming off
module spoolcap(){
    union(){
    color("Cyan")cylinder(h=15,r=cappegdiameter/2);
    color("LightBlue")cylinder(h=1.6,r=22.05);
    }
}


//This is the main arm that the
//rod is pushed into
module spoolarm(){
    union(){
    union(){
 //union for angled cube and cube with hole
    union(){
 //union for peg and cube with hole
    union(){
 
        
   
    rotate(2,[0,1,0])translate([0,0,-13])color("DarkGreen")cylinder(h=20,r=pegdiameter/2);
   //difference to make cube with hole
    difference(){
   //cube that rod inserts to and extends it the x direction
    translate([-12,-10,-14])color("Green")cube([110,20,15]);
    //hole for rod
    rotate(2,[0,1,0])translate([0,0,-11.8])cylinder(h=13,r=holediameter/2);
    }
    }
    
   //angled cube 
  rotate(315,[0,1,0])translate([59,-10,-79])cube([85,20,15]);
    
    }


//EVERYTHING BELOW THIS COMMENT IS RELATED TO THE HALFPIPE/ PART SECURING THE ARM!
    //difference for zip tie holes
    difference(){
     
     //difference for cube that cuts pipe into halfpipe
    difference(){
       //difference that creates hollow tube / pipe
    difference(){
   translate([180,0,-14])cylinder(h=120, r= 24.8);
    translate([180,0,-14.01])cylinder(h=121, r= 22);
    } 
    //cube that cuts pipe in half
    translate([180,-30,-20])cube([200,200,200]);
}   
    //union for ziptie holes to be 1 object for difference
    union(){
    //Holes for Zipties
    //Change translate of both below to move them around
    translate([174,-50,0])cube([1.6,100,3.4]);
    translate([174,-50,88])cube([1.6,109,3.8]);
    }
}
    //cubes that connects halfpipe to rest of arm, the first one if for a bit of extra support
    rotate(0,[0,1,0])translate([145,-10,42])cube([5,20,15]);
}
translate([147,-10,42])cube([11,20,15]);
}
}
