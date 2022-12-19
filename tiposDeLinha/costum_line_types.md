AutoCAD linetype customizing facilities Sep 1, 1999By:Bill FaneCadalyst Once upon a time, a long time ago, in an AutoCAD release very far away, someone decided that AutoCAD should draw using a variety of noncontinuous linetype styles. Someone further decided that the people at Autodesk, as smart as they were, could not forsee every possible type of noncontinuous linetype that users might desire or require, so in their great wisdom they allowed users to create their own custom line definitions. AutoCAD has 46 standard linetypes defined. For the most part, the 46 cover every conceivable situation. We will begin by looking at the current ones and then investigate the need for and method of defining other styles. 

What's available
As usual these days, AutoCAD has umpteen different ways start a specific command. Whenever I mention a specific way in a column, I get inundated with e-mail telling me about the other umpteen minus one ways. I know, but I don't have space to list them all here. 

Anyway, issue either the Layer or Linetype command from the Command prompt, or go to Format|Layer, or Format|Linetype, or use the Object properties toolbar and pick Layer or Linetype, or whatever.

Pick the Linetype tab of the Layer and linetype dialog box to see the 46 linetypes. 

What 46? I see only three.

You're right. Initially, new drawings show only three types. First, the explanation of continuous is pretty obvious. In fact, its definition is built in by default.

Two other names also turn up, but they are not really linetypes. Bylayer simply means that the object takes on the linetype properties of the layer on which it resides. Byblock means that if you use an object in a block definition, the object within the block takes on the linetype properties of the layer in which you insert the block. 

To see the other 45 linetypes, load the definitions from an external file. From the Linetype tab of the Layer and Linetype dialog box, pick Load. This defaults to the linetype definitions stored in the external file called ACAD.LIN, as shown in figure 1 below. 
 
Figure 1. Each linetype definition has a name and a description in ACAD.LIN.Each linetype definition has a name and a description. The description includes a series of dashes and dots that show approximately what the linetype looks like. As you can see, linetypes cover ISO (metric) styles and Imperial styles for things such as hidden, section, center, and phantom lines. Most are also available in regular, half, and double scales. 

You usually use the Ltscale and Celtscale commands to set a specific linetype scale for all objects globally or for specific objects within the drawing, but you can also select fine and coarse variants of linetypes. 

Select one or more linetypes, click OK, and the selected linetypes become available in your drawing.

Cool, but for drawing schematic drawings I need linetypes to indicate different line contents such as pneumatic, hydraulic, hot water, cold water, and so on. 

Season of our dis-contents
Note that you had to load the desired linetypes from an external file. That file is a simple text file. To add or create custom linetype definitions, you can either edit the external file with Notepad or create your own separate file. If you edit the standard ACAD.LIN file, save an original copy somewhere so you can go back. If you don't, the file is always available from the install CD-ROM. The standard ACAD.LIN file resides in the AutoCAD Program files\……\Support directory. In Notepad you;ll see that the first portion looks almost exactly like this: 


<br>
;;
;; AutoCAD Linetype Definition file
;; Version 2.0
;; Copyright 1991, 1992, 1993, 1994, 1996 by Autodesk
;;
*BORDER,Border __ __ . __ __ . __ __ . __ __ . __ __ .
A,.5,-.25,.5,-.25,0,-.25
*BORDER2,Border (.5x) __.__.__.__.__.__.__.__.__.__.__.
A,.25,-.125,.25,-.125,0,-.125
*BORDERX2,Border (2x) ____ ____ . ____ ____ . ___
A,1.0,-.5,1.0,-.5,0,-.5
*CENTER,Center ____ _ ____ _ ____ _ ____ _ ____ _ ____
A,1.25,-.25,.25,-.25
*CENTER2,Center (.5x) ___ _ ___ _ ___ _ ___ _ ___ _ ___
A,.75,-.125,.125,-.125
*CENTERX2,Center (2x) ________ __ ________ __ _____
A,2.5,-.5,.5,-.5AutoCAD ignores anything that follows a semicolon (;) and blank lines. 

The basic format of a linetype definition is simple—they always consist of two lines. The first line exists mostly for the benefit of humans while the second line does the work. Let's start by studying the Center linetype and its first line. 
*CENTER,Center ____ _ ____ 
____ _ ____ _ ____ _ As cribbed straight from the AutoCAD Help function, "This line must begin with an asterisk and must be immediately followed by the linetype name. If the description is provided, it must be separated from the name by a comma and be no more than 47 characters. The description is not used by AutoCAD; it is intended to help you visualize the appearance of the linetype." The description is the words and/or dash-dot symbols in the dialog box. 

The second line does the work:
A,2.5,-.5,.5,-.5The first character is an alignment code. It is mandatory, but since day one the only allowable value has been "A". Hmm, a mandatory option—sounds like something government would do. The rest of this line includes the actual definition of the linetype segments. The definition of each segment is a simple numeric value, separated by a comma (no spaces) from its neighbors, that indicates its nominal length. Positive values indicate pen down, or draw a line. Negative values indicate pen up, or leave a blank segment. A length of zero indicates a dot. The definition for a Center linetype thus indicates that it consists of a line 2.5 units long followed by a space of 0.5 units, then a line of 0.5 units, and a space of 0.5 units. The pattern repeats automatically to fill the allocated total line length, so that although the file defines only two lines and two spaces, a center line looks like this:
—- - ——- - ——- - ——- - ——- - —-In line definitions, the "A" alignment code indicates that:
A specific line always ends with a repeat of one of the first segments.
The first and last segments are always at least half as long as the number specified in the definition.The number of other segment repetitions are adjusted accordingly to fill the available space.A line that is too short to contain at least one repetition and an end segment become continuous.

Great! I want to define a linetype that consists of a long segment, a short gap, a medium segment, a tiny gap, a dot, a large gap, a medium line, a. . . 

Note a couple of limitations. A linetype definition cannot exceed 12 segments and 80 characters, whichever comes first. It is also normal to end up with a space segment so the terminating segment is the correct length. 

And that is all there is to it! You can edit any of the existing definitions, add your own to ACAD.LIN, or create one or more separate files to hold them. If you use a file other than ACAD.LIN , you must specifically browse for it when you load it into your drawing.

Get it right the first time
Hold it! I just had a terrible thought. Do I have to load linetypes manually each time? And what happens if I send a drawing file to someone else? 

They both have the same solution. Linetype definitions read in from the *.LIN file become part of the current drawing. The *.LIN file needs to be present only when you load the linetypes the first time. Any drawings you send elsewhere or any existing drawings you reopen later carry their custom linetype definitions with them and don't need the *.LIN pattern file. The only time you need the *.LIN file for an existing drawing is if you want to change the definition. Simply load the new definition, and all existing lines update. 

You can also load your usual definitions into a drawing template file so that every drawing you start from that template will have the linetypes defined without need for the *.LIN file.
Be sure to come back next time when I promise to cover the text and symbols that you see in seven of the linetypes. 

And now for something completely different
If you buy a used Hobie Cat sailboat, be sure to check out the rudder settings before you go sailing. The previous owner may have taken them apart and then swapped them right for left when reassembling them. The rudder heads are not quite symmetrical. If they are backwards, the two rudder blades splay outwards. This makes it almost impossible to keep the boat the right way up in gusty weather.