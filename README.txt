Wave Farm Simulation GUI - Fall 2014

Prerequisites for Deployment 

. Verify the MATLAB Compiler Runtime (MCR) is installed and ensure you    
  have installed version 8.3 (R2014a).   

. If the MCR is not installed, do the following:
  (1) enter
  
      >>mcrinstaller
      
      at MATLAB prompt. The MCRINSTALLER command displays the 
      location of the MCR Installer.

  (2) run the MCR Installer.

Or download the Windows 64-bit version of the MCR for R2014a 
from the MathWorks Web site by navigating to

   http://www.mathworks.com/products/compiler/mcr/index.html
   
For more information about the MCR and the MCR Installer, see 
Distribution to End Users in the MATLAB Compiler documentation  
in the MathWorks Documentation Center.    

How-to-Run:
1) Ensure that you have Matlab or MCR installed via the prerequisite instructions above
2) Put the "wavePrototypeGUI.exe" in a runable directory
3) Double click to run
4) Once the GUI loads, adjust the sensor, WECS, and Wave Elevation sliders based on your input
5) Add XY coordinates for each sensor and WECS 
	- Additional coordinates will be ignored and invalid coordinates will be place the point at 1,1
6) Press "Calculate" to create a wave graph(This action will erase the current graph)


Future Additions:
- Complete wave animations
	* Full body of water
	* Sand
	* Better sensor and WECS points
- Implementation of an accurate wave function
- More user input and specifications
- More to come...
