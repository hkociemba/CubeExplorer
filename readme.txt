Unzip all files into a folder of your choice and start Cube Explorer. No files outside of this folder
will be added or altered, so if you want to uninstall Cube Explorer just delete this folder.

The memory requirements for Cube Explorer:

Main program features: 128 MB
Solve cubes with twisted centers: 600 MB
Run the Huge Optimal Solver: 3 GB


Have fun!

Herbert Kociemba


Version History:

2019-10-07  Cube Explorer 5.14
            - The search for incomplete cube did not work correctly when using slice turns. The fixed version
              also has the possibility to exclude faces in this case now.

2017-23-04  Cube Explorer 5.13
            - Fixed some issues with Run|Start Autorun feature
	    - Fixed issues with the display when using Cube Explorer with multiple monitors. 
	    - Timing problems with the webservers ?scanX command which gave wrong output. Fixed.
	    - Symmetry information was not updated for selected cube when switching to the symmetry tab. Fixed.  

2014-08-29  Cube Explorer 5.12
            -Two-phase-algorithm for QTM with center-twisted cubes needed a higher
             value for the maximal maneuver length.
            -Two-phase-algorithm option dialog needed higher values for the automatic
             search stop value.       


2014-08-26  Cube Explorer 5.10
            -Version for the Half Turn Metric HTM and Quarter Turn Metric QTM supplied.
            -"Exactly this Symmetry/Antisymmetry" checkboxes in the Symmetry Editor
            -Text in messagebox for Huge Solver adopted to current hardware and software 


2013-04-28  Cube Explorer 5.01
            -Loading maneuvers from file did not set correct maneuverlength. Bug fixed.
            -Maneuvers like D'S were interpreted wrong in the "Apply" box. Bug fixed.
            -Possibility to scramble only edges or corners
            -Possibility to multiply a cube in the Main Window with the cube in the Facelet Editor.
            -When loading a maneuver file, empty lines generated an id-Cube. Now these lines are ignored.
            -On Webcam Tab Hue, Sat and Val now are grayed out in interactive mode, which is consistent with
             the display.
            -Save Interactive/Automatic Webcam settings for next program start.


2010-03-22  Cube Explorer 5.00
            -Possibility to use *slice moves* in all parts of the program.
		 This involved changes at many locations of the source code.
             Hopefully I did not forget too many dependencies.
            -The Delphi built in Random Generator is poor and gives only a small
             fraction of  all possible cubes. I replaced it with the
             Mersenne-Twister MT 19937.
            -A basic interface for robot builders who do not want to use the
             webserver interface: alt-s triggers the "scan" button and alt-v 
             triggers the "Solve Scanned Cube" button, ctrl-f saves the computed
             maneuver to the file ctrlFsave.txt. There are possibilities to send
             these keyboard commands to the application.
            -The webserver dialog was simplified. You just set the port and 
             the option to save the result to a file.
            -There were some issues with the parity of the center orientations
             when solving partially defined cubes. Bug fixed.

2009-01-15  Cube Explorer 4.64
            -Removed the autotime feature for the Two-Phase-Autorun solver.
            -File menu now unaccessible during generation of the Huge Optimal
             Solver tables to prevent crashes in certain situations.
            -Small changes in the webcam recognition procedure.
            -?status command implemented into the webserver.
            -Some errors in helpfile fixed.

2008-12-26  Cube Explorer 4.63
            -The autorun feature of Cube Explorer for solving many cubes takes
             advantage of machines with more than one processor (phyical or virtual).
             With a Core i7 920 CPU (8 physical and virutal processors) and the 4.63s
             version about 490 cubes are solved optimally per hour.

2008-09-25  Cube Explorer 4.62
            -Small changes in the user interface for webcam colour definition.
            -Preview for interactive mode while scanning for better visual control
             over the scanning procedure.

2008-09-20  Cube Explorer 4.60
            -Interactive Mode for webcam colour recognition. Learn modus to distinguish
             between orange and red facletes. 

2008-09-10  Cube Explorer 4.59
            -WebCam colour recognition routines rewritten. If correctly adjusted, the recognition
             of the colours works very reliable now.

2008-09-06  Cube Explorer 4.54
            - Printing did not work correctly since version 4.50. Error fixed.

2008-08-24  Cube Explorer 4.53
            -Solving cubes with twisted centers now also works with incomplete cubes.
            -Help file updated.

2008-08-15  Cube Explorer 4.52
            -Edit|Arrange Selected Symmetric Cubes and Edit|Add Symmetry Info for Selected Cubes
             did not work correctly for twisted center facelets.
            -Some changes ins Search routine of Two-Phase-Algorithm for cubes with twisted centers
             improves perfomance.
            -WCA scramble menu simplified  

2008-08-12  Cube Explorer 4.50
           -Many program-parts rewritten to support cubes with twisted center facelets
            (Supergroup problem).
           -Saving cubes as HTML now works with Josef Jelineks JAVA Applet which has better
            configuration possibilities than the applet I used before.
           -Pausing the optimal solver is now taken into account when computing the cpu-time
            for the optimal solution.

2008-07-22   Cube Explorer 4.33
            -Some changes in the "Keep Center Facelet Orientations" routine.
            -Improved readability of hatched patterns in the facelet editor.
            -Fixed a bug which crashed Cube Explorer while searching for patterns
             and the webserver activated.
            -Removed the RAM-size check when loading the Huge Optimal Solver because
             it was reported that it fails with RAM-sizes > 4GB.   

2008-03-22  Cube Explorer 4.30
            -Complete redesign of the webcam interface. Now Uses the DirectShow 
             interface instead of the outdated WfW (Video for Windows) interface.
             Hopefully will work with more input-devices now.
             Helpfile not yet updated.
            -Generating new WCA-scrambles first clears the Main-Window.  

2007-11-20  Cube Explorer 4.20
            -In Vista the program did not close correctly, error is fixed now.
            -Size of font in printing maneuvers increased, printing of pattern name added.
            -Added some scramble routine for the WCA (World Cube Association).

2007-08-09  Cube Explorer 4.15
            -Filter function added to solver for incomplete cubes.
           
2007-04-14  Cube Explorer 4.11
            -Small change in the "Options|Autorun Trigger Time" Trackbar behaviour.
            -Fixed an error in the random cube generator. 

2007-02-20 Cube Explorer 4.10
           -Possibility to disable the automatic error correction feature
            of the facelet editor.
           -Increased speed for solving partially defined cubes in certain
            standard situations like OLL (orient last layer) or PLL (permute last layer).
           -Moved some commands to the new "Run"-menu.
           -Helpfile updated. 

2006-10-23 Cube Explorer 4.00
           -Support for solving incomplete cubes is implemented:
            Gray facletes define cubies with unknown orientation and
            unknown colors.
            Shift-Mouseclick defines cubies with unknown orientation and given colors.
            Ctrl-Mouseclick defines cubies with known orientation but and unknown colors.   

2006-09-25 Cube Explorer 3.85
           -Some improvementsin the Web-interface done:
            With the ?clear command you can clear the main window.
            The ?connect command connects the webcam.
            If something goes wrong during the scanning procedure, an error
            message is returned to the web-browser and not only a 'Done!' as
            previously. 

2006-09-06 Cube Explorer 3.84
           -When loading a large number of cubes from file, the number of
            already loaded files is displayed.
           -Improvement in the "Arrange Selected Symmetric Cubes" feature.
           -Possibility to fix the center facelets if possible.
           -Cubes can be sorted by maneuverlength or by patter name.
           -Error in the "Add nonisomorphic inverse cubes" routine fixed.

2006-08-22 Cube Explorer 3.82
           -Fixed error when loading files.
           -Some minor new features added.
           -updated helpfile

2006-05-09 Cube Explorer 3.81
           -Improved readability of UNIX text file format.

2006-05-09 Cube Explorer 3.80
           -Coset Explorer integrated, but only in the version 3.80s. About 279 million
            cubes can be solved optimally(!) within a couple of hours.
           -Cubes are loaded and saved in Singmaster notation if there yet is
            no maneuver string computed. 
           -Changed the labeling of the symmetric subgroups according to my homepage.
           -Some changes in the Options menu.

2006-03-11 Cube Explorer 3.79
           -Option to include inverse cubes in the isomorphy-definition.
           -Loading of long maneuver files can be canceled by pressing ESC.  

2006-03-02 Cube Explorer 3.78
           -Better recognition of different formats when reading maneuver strings.
           -When loading cubes from file it is possible to ignore isomorphic cubes now.
           -Bug changed pattern name of some cubes when deleting other cubes.
           -Autorun for Optimal Solver did not start correctly.
           -Symmetries and antisymmetries were not displayed correctly in the
            Symmetry Editor when using the Edges Odd or Corners Odd feature.
           -Internal data structure changes (not visible to user)

2006-19-02 Cube Explorer 3.77
           -Finally fixed a scrolling problem which produced a glitch at the
            end of the scrolling process in the Main Window. 
           -Loading maneuvers from a file was very slow for more than about
            50000 cubes.
           -Exception when loading more than 200000 cubes. Bug fixed.
           -Mousewheel did not work if numbers of cube was too high.

2006-12-02 Cube Explorer 3.76
           -When loading maneuvers from a file, the last one was dropped
            under some circumstances. Bug fixed.
           -much faster routine to find isomorphic cubes in symmetry editor.This allows
            the computation of all classes which have at least 3 symmetries
            within a reasonable time.
           -Current cube number solved with the automodus is displayed.
           -Helpfile not yet updated

2006-02-02 Cube Explorer 3.73
           -batch run module for optimal solver implemented
           -batch run module for two-phase-solver implemented

2006-01-23 Cube Explorer 3.71
           -Fixed a few memory leaks.
           -Better behaviour if there are many cubes (>10000) in the Main Window when
           -adding or deleting cubes.
           -Because a windows program  "only" can have 10000 process handles, there is
           -an option to terminate threads after finding the first solution. 

2006-01-20 Cube Explorer 3.70
           -Fixed some strange behaviour concerning mouse-wheel-scrolling.
           -Possibility to add more than 1 Random Cube.
           -Possibility to start and stop maneuver searches for selected cubes, so it is
            not necessary any more to click the "Run"-Button for each cube.   

2006-01-08 Cube Explorer 3.69
           -Fixed a thread problem when solving hundreds of cubes at the same time.

2005-12-12 Cube Explorer 3.68
           -Fixed a small bug in the contextsensitive helpsystem.
           -Loading cubes from file discarded isomorphic cubes. Bug fixed.
           -Replaced Borlands memory manager with the Fast Memory Manager 4.48
            (http://fastmm.sourceforge.net), which also allows memory usage above 2 GB.


2005-26-06 Cube Explorer 3.67
           -New format of helpfile.

2005-16-06 Cube Explorer 3.66
           -Helpfile updated.

2005-14-06 Cube Explorer 3.65
           -Improved recognition of Strings in the Facelet Editor maneuver box.
           -Antisymmetries and Symmetries are displayed as raised and pressed
            buttons in the Symmetry Editor.
           -Antisymmetries can be defined by rightclicking on a Symmetry Button.

2005-05-06 Cube Explorer 3.62
           -Facelet Editor Input now also possible with maneuver string.
           -Copy To Clipboard function for generated maneuvers.

2005-05-02 Cube Explorer 3.61
           -Option for selfinverse cubes in Symmetry Editor
           -Right click on symmetry buttons in Symmetry Editor gives pop-up menu.

2005-04-20 Cube Explorer 3.60
           -Anti-Symmetry Editor implemented.
           -Still missing: updated helpfile for Symmetry and Antisymmetry Editor
           -Changed naming convention for the symmetry groups.

2004-10-26 Cube Explorer 3.56
           -Type Info added to Symmetry Editor, Symmetry Types are ordered by Group size now.
           -The Optimal Solver uses symmetry information now. This dramatically increases the 
            speed of the computation when a pattern is symmetric.
           -Still missing: updated helpfile. 	

2004-10-17 Cube Explorer 3.50
           - Symmetry Editor implemented (without updated helpfile)
           - better GUI-response while running patternsearch thread.
           
2004-08-26 Cube Explorer 3.22
           - Fixed some multithreading problems with the webserver.

2004-04-11 Cube Explorer 3.20
           - Extended support for programmers to use the webcam-interface with their robot.
             All necessary steps can be controlled by the webserver.
 
2004-04-11 Cube Explorer 3.19
           - Small fixes in the context sensitive help.
           - Added a Cancel-Button in the Exit-Messagebox.
           - Changes in the Options|Two Phase Algorithm... menu.

2004-04-06 Cube Explorer 3.18
           - Adding a "Last-Modified"-HTTP header fixed some caching problems with *.gif files
             when using Internet Explorer with the online solver.
           - Added an option to control the CPU-time used by the webserver when computing maneuvers.
           - Helpfile updated

2004-03-27 Cube Explorer 3.17
           -disabled some forgotten debugging code

2004-03-27 Cube Explorer 3.16
           -improved error handling in online cube-solver modul. Seems to run stable now.
           -Option settings are saved in cube.ini now.

2004-03-21 Cube Explorer 3.15
           - webinterface completely rewritten - is multithreaded now

2004-03-13 Cube Explorer 3.12
           - wrong input to webcam could crash Cube Explorer
           - webinterface rewritten
           - javascript page added, which allows online cubesolving without downloading
             and installing Cube Explorer. 

2004-02-23 Cube Explorer 3.11
           - Some bugs with web interface fixed which could crash Cube Explorer.

2004-02-22 Cube Explorer 3.10
           - simple webserver-interface implemented to support programmers
             who want to build a cube-solving robot for example.

2004-02-16 Cube Explorer 3.02
           - Helpfile for webcam interface updated

2003-09-02 Cube Explorer 3.01
           - Some changes in the user-interface for the webcam.
           - Mousewheel support for Main Window.
           - some minor bugs fixed.

2003-07-31 Beta-Version of Cube Explorer 3 released
           - Webcam support for scanning of cube-faces implemented.
 
2002-09-01 Cube Explorer 2.25
           - Type of Metric displayed behind maneuver length now(f: Face Turn Metric,
             q: Quarter Turn Metric).
           - Source Code support to compile a Quarter Turn Metric version of
             Cube Explorer (in cubedefs.pas).
           - Possibility to find more than one optimal maneuver with the Optimal Solvers.
	   - Current filename displayed in caption of window.
           - Description of the mathematics behind Cube Explorer in the Help File.
           - Some routines rewritten, source code documentation improved.

2002-02-09 Cube Explorer 2.21
           - Improved help file
           - Two-Phase algorithm about 50% faster.
           - Possibility to toggle Multiple Direction Search

2002-02-02 Cube Explorer 2.20
           - A basic context-sensitive help is now available - finally!
           - Speed of the Huge Optimal increased by about 40%.

2002-01-14 Cube Explorer 2.14
           - The "Simple Modification" from Version 2.13 is not possible with
             the Huge Optimal Solver and had to be removed again for this solver.
           - Additional information about the number of generated nodes and the
             computing time for an Optimal Search, accessible when moving the mouse
             over the Optimal-Checkbox during the search.

2002-01-13 Cube Explorer 2.13
           - Right mouse button usage for faceturns in the Facelet Editor.
           - Simple modification of the algorithm increases the speed of the
             Optimal Solver(s) by about 35% (thanks Michiel de Bondt!).
           - Bug fixed which occasionally crashed the program on closing.

2001-11-20 Cube Explorer 2.12
           - Optimized storage of the pattern databases with 1.6 bit/pattern
             reduces the size of the big tables by 20%.

2001-10-20 Cube Explorer 2.11
           - The Source Code did not compile properly under Delphi 6 due to
             changes in the TThread class.
           - Improved texts for several Messageboxes.

2001-10-04 Cube Explorer 2.1
           - Improved pruning table generation algorithm doubles the speed
             on first start (9min instead of 19 minutes on my P550MHz system).
           - Additional implementation of a very fast optimal solver for power
             users with 1 GB of RAM.          

2001-09-23 Cube Explorer 2.04
           - File|Exit did not work. Never used this feature before...
		
2001-09-09 Cube Explorer 2.03
           - Double buffering bug fixed.
           - Output of Cube Explorer can now generate a HTML file displaying a
             Java Applet for 3D-view of the cubes.

2001-09-08 Cube Explorer 2.02
           - Double buffering the Output Window to reduce flickering on scrolling

2001-09-01 Cube Explorer 2.01      
           - 2 minor bugs concerning the Two-Phase-Algorithm removed.
           - Faster generation of the 34.5 MB Pruning Table.
           - Minimum Size for the Main Window.
           - Physical Memory Detection. The program terminates if there is less than
             90 MB of RAM installed.


2001-08-19 Release of Cube Explorer 2.0



