# VIDEO-FORGERY-DETECTION

-----------------------------------------------------------------------------------------
				READ ME FOR RUNNING OF VIDEO FORGERY DETECTION MATLAB CODE
-----------------------------------------------------------------------------------------


1. Install Matlab R2012a or above on your PC running any of the standard Operating System(Windows 7,8,8.1,10).

2. Include the 'jpeg_read' library in your matlab to run the files included in the package.

3. Run the 'feature_original.m' file to extract and store the 'ccpev548' extracted features in a 'cover.mat' file of the non-forged videos.

4. Run the 'feature_forged.m' file to extract and store the 'ccpev548' extracted features in a 'stego.mat' file of the forged videos.

5. Run the 'trainer.m' file to train the system on your training set which creates a 'trained_ensemble.mat' file, which stores the data in this variable to be used further in the testing purposes.

6. Finally, run the 'tester.m' file to test on a particular video by giving input the feature extracted matrix (.mat) file for that video and also the 'trained_ensemble' variable to give as input, formed in the previous file (trainer.m).


Code Designers:

Pramjeet Kumar (IIT2014040)
Parth Goel (IIT2014052)
Yashwant (IIT2014051)
Preshit Gupta (IIT2014095)
Aman Mehrotra (IIT2014096)
