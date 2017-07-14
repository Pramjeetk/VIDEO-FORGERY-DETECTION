%Give the path of the Feature Extracted file for which the Forging needs to be tested.
Test_File = load('E:\PROJECTS\VideoForgery\example\TESTING_SET\test_2_stego.mat');

%Store the names of the Frames for reference to its feature vector
Test_File_names = Test_File.names;


emptyCells = cellfun('isempty', Test_File_names); 
Test_File_names(emptyCells) = [];

%Store the Feature values for each frame of the given input
T = Test_File.d(ismember(Test_File.names,Test_File_names),:);

%Create the testing set
testing_set = linspace(1,size(T,1),size(T,1));

TST_Features = T;
%Finally, now call the ensemble_testing function which gives the output as
%whether a particular frame is forged(1) or original(-1).
load('E:\PROJECTS\VideoForgery\trained_ensemble2.mat');
test_results = ensemble_testing(TST_Features,trained_ensemble);

c1=0;
c2=0;
for i=1:size(test_results.predictions,1)
    if test_results.predictions(i) == 1
        c1 = c1+1;
    else
        c2 = c2+1;
    end
end
disp(['Total Frames ' num2str(size(test_results.predictions,1))]);
disp(['Forged       ' num2str(c1)]);
disp(['Non-Forged   ' num2str(c2)]);
if (c2>c1)
    disp('Video is Non-Forged');
else
    disp('Video is Forged');
end
%disp(test_results.predictions);