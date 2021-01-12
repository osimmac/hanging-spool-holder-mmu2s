# hanging-spool-holder-mmu2s
OpenSCAD design of a hanging spool holder, designed with simplicity, low friction, and reusing parts from MMU2S kit in mind.

--Features
 - Minimalist strong design, no supports needed, simple geometry
 - Reuses MMU2S Spool holder hardware, create up to 10 hanging spool holders!
 - High tech Self Stablizing roller, see this video for an explanation of how it works! (it was also the inspiration for the roller design) https://www.youtube.com/watch?v=Ku8BOBwD4hc
 - low rolling resistance, perfect for flexible filaments in the MMU2S! (ive had success printing 85A hardness filaments!)
 - quiet operation
 
 
 
--Required Hardware
- Rods that came with MMUS2 trays
- Bearings that came with MMUS2 trays
- Zipties that came with printer or MMU2S
- 0.8mm nozzle recommended

--How to get started if new to OpenSCAD
1. Download and install from here (os specific instructions are there): https://www.openscad.org/downloads.html
2. launch openscad and start messing around with the examples, they can be accessed from the launcher or "file" at the top of the application.  most of what i learned if from there. the examples are easy to modify and expand upon.
3. Check out the Basics > CSG-Modules.scad example, this spool holder uses modules. (though it could use them better)
3. Useful cheatsheet once you understand how the commands work: https://www.openscad.org/cheatsheet/index.html


--How to get started if not new to OpenSCAD :)
1. download and open spoolholder.scad from this repository
2. there are many comments within the file that explain whats going on; generally you will need to edit the variables near the top
3. comment out a few lines in the RENDERING /OUTPUT section, start with leaving test piece uncommented if you need to adjust fitment
4. Render (F6)
5. if it looks good, Export to STL (F7)!

--How to Print
Highly Recommend nozzle larger than 0.4mm, especially if using MMU2S. Less layer changes, less filiament swaps, smaller purge blocks with thicker layer heights, Faster Prints. they are cheap and worth it. This spool holder can be printed in under 3 hours while still making a strong print. I dont have settings for anything other than 0.8mm, you are welcome to try and post results as an issue or something.

(*used prusa slicer*)
  
  - PETG filament thats strong and reliable (you dont want 1kg mass falling on your printer)
  - Bed temp 70c, add gluestick, first layer temp 255c, other layers 265c
  - I had my petg set to 12mm^3/s max volumetric speed, its near the limit but allows for fast strong prints. its also why temp is so high.
  - I used a 0.6mm profile as a starting point and scaled all the settings for 0.8mm nozzle.
  - 0.8mm nozzle, recommend tuning extrusion multiplier, mine is set to 1.08
  - retraction for 0.8mm nozzle was set to 0.4mm
  - Extrusion width for 1st layer is 150%
  - all other extrusion width settings set to 0.9mm
  - 0.6mm layer height
  - 3 perimeters
  - 2 top and bottom layers
  - Rectiliear infill, 10% density on the interior
  - fast print speed settings, first layer speed set to 10mm/s
  - no support
  - make sure first layer sticks well
  - min 30% fan max 70%, disabled for first 2 layers, slow down if print speed is below 8 seconds per layer
        -slow down at most 4mm/s for cooling
  
  
--How to assemble
1. First print test piece with settings above
2. Clean out the hole with a razer or something, be careful not to enlarge the hole too much or break the blade. 
3. Get a rod and try push fitting it into the hole, it will require a lot of force
4. Try using a hammer, with plastic part facing down and rod pushing into carpet or something. dont bang the rod and dont do it on tile as the force may break it. gently but firmly hammer the test piece onto the rob. it should go in about 1cm. a full inserted rod will stick out about 10.8cm from the piece. its OK if a bit more sticks out if it feels secured. ideally 9mm or more will enter the part.. 
5. If it doesnt fit properly, try altering the test piece with openscad and generate an updated STL.
6. Repeat steps above until you get a good fitting rod that can hold 1kg without bending a bunch. 
7. Generate a new main arm if you altered the hole size.
8. Print everything
9. Trim parts
10. Press fit bearings into roller, be careful not to break it
11. Press fit rod into main arm, use hammer on plasic piece with rod in carpet.
12. Slide roller on, verify it rolls smoothly
13. press fit cap on, may need to trim peg
14. hang with zipties!


  
  
