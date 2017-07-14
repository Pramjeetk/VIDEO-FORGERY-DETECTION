cover = load('E:\PROJECTS\VideoForgery\example\cover_1.mat');
stego = load('E:\PROJECTS\VideoForgery\example\stego_1.mat');

% Both loaded structures contain fields 'd' and 'names'. F is a feature
% matrix with individual samples in rows and individual features in
% columns, i.e., the number of columns corresponds to the feautre-space
% dimensionality. Field 'names' contains image filenames of the
% corresponding cover (or stego) images. Note that this format is
% consistent with the previous version of our ensemble implementation.

% Restriction only to images that have both cover and stego features (only
% those will be considered)
names = intersect(cover.names,stego.names);
names = sort(names);
names(strcmp('',names)) = [];

% Prepare cover features C
cover_names = cover.names(ismember(cover.names,names));
[cover_names,ix] = sort(cover_names);
C = cover.d(ismember(cover.names,names),:);
C = C(ix,:);

% Prepare stego features S
stego_names = stego.names(ismember(stego.names,names));
[stego_names,ix] = sort(stego_names);
S = stego.d(ismember(stego.names,names),:);
S = S(ix,:);

% At this point, we have the cover features C and the corresponding
% stego features S. They are correctly synchronized, i.e., the i-th row of
% the stego matrix S comes from the stego image that was created from the
% cover image with features in the i-th row of the cover matrix C.

training_set = linspace(1,size(names,1),size(names,1));
training_names = names(training_set);

% Prepare training features
TRN_cover = C(training_set,:);
TRN_stego = S(training_set,:);

% Train ensemble with all settings default - automatic stopping criterion for
% the number of base learners (L)
[trained_ensemble,results] = ensemble_training(TRN_cover,TRN_stego)
save E:\PROJECTS\VideoForgery\trained_ensemble2.mat trained_ensemble -v7.3;
%disp(results);