clear all;
close all;
clc;

%%Loading the Files
im = dir('./all_faces/faces/*.JPG');
total = length(im); 
im2 = dir('./all_faces/test_faces/*.JPG'); 
clear labels;
labels = {};
org = './all_faces/faces/';
for j = 1:total
    orgFileName = im(j).name;
    files = strcat(org, orgFileName);
    rExp = 'A[0-9][0-9]';
    Ffiles = regexp(files,rExp);
    str1 = files(Ffiles+1);
    str2 = files(Ffiles+2);
    str = strcat(num2str(str1),num2str(str2));
    str = str2num(orgFileName(5:6));
    if (str>=0) && (str <20)
        labels{j} = '[0-19]';
    elseif (str >=20) && (str<30)
        labels{j} = '[20-29]';
    elseif (str >=30) && (str<40)
        labels{j} = '[30-39]';
    elseif(str>=40) && (str<50)
        labels{j} = '[40-49]';
    elseif (str>=50) && (str<=100)
        labels{j} = '[50-100]';    
    end
    save('age.mat','labels');
end

%Preparing the data for faces folder
data = zeros(64 * 64, 130);
for i = 1:total
    orgFileName = im(i).name;
    files = strcat(org, orgFileName);
    im1 = imread(files);
    im1 = im2double(im1);
    im1 = imresize(im1,[64,64]);
    data(:,i) = im1(:);
end

%Preparing the data for test_faces

% performing PCA
coeff= pca(data);
[PC, V] = pca(data);

% ploting eigenfaces
figure,
for i = 1:12
    subplot(1,12,i);
    temp = reshape(PC(:,i),[64 64]);
    imshow(temp,[]);
end

% reducing Dimensions
%reducedDimension = coeff(:,1:12)';
%reducedData = reducedDimension * data;
newreducedData = data'*PC(:,1:12);
% plotting on Parallel Coordinates for faces
newlabels = {'1','2','3','4','5','6','7','8','9','10','11','12'};
%figure, h = parallelcoords(reducedData','Group',labels','Labels',newlabels);
figure, h = parallelcoords(newreducedData,'Group',labels,'Labels',newlabels);

% plotting on Parallel Coordinates for test_faces
data2 = zeros(64 * 64, 3);
for i = 1:6
    %im3 = imread(['./all_faces/test_faces/*.JPG']);
    %im3 = imread(['./all_faces/test_faces/*' num2str(i) '.JPG']);
    im3 = imread([im2(i).name '.JPG']);
    im3 = im2double(im3);
    im3 = imresize(im3,[64,64]);
    data2(:,i) = im3(:);
end
data(:,930)= data2(:,1);
data(:,931)= data2(:,2);
data(:,932)= data2(:,3);
labels{930}='face1';
labels{931}='face2';
labels{932}='face3';
newreducedData2 = data2'*PC(:,1:12);

newreducedData3 = data'*PC(:,1:12);

figure, h = parallelcoords(newreducedData2,'Labels',newlabels);
figure, h = parallelcoords(newreducedData3,'Group',labels,'Labels',newlabels);
h(930).LineWidth = 3;
h(931).LineWidth = 3;
h(932).LineWidth = 3;

