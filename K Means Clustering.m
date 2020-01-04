close all;
clear all;
clc;

%prepare data
image = dir('./all_faces/faces/*.JPG');      
nofiles = length(image);
org = './all_faces/faces/';
data = zeros(64*64,nofiles);
for x = 1:nofiles  
  filename1 = image(x).name;
  file = strcat(org,filename1);
  img1 = imread(file);
  img1 = im2double(img1);
  img1 = imresize(img1,[64,64]);
  data(:,x) = img1(:);
end
[idx,C] = kmeans(data',8);
for i = 1:8
    clust = find(idx==i);
     x = length(clust);
     disp(clust);
     for lc = 1:length(clust)
         filename2 = image(clust(lc)).name;
         file1 = strcat(org,filename2);
         img2 = imread(file1);
         img2 = im2double(img2);
         img2 = imresize(img2, [64, 64]);
         figure(i),
         subplot(20,20,lc);
         imshow(img2,[]);
     end
     figure(6),
     subplot(2,5,i);
     plot1 = reshape(C(i,:),[64 64]);
     imshow(plot1,[]);
end