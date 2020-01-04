close all;
clear all;
clc;

%prepare data
image = dir('./all_faces/faces/*.JPG');      
nofiles = length(image);
org = './all_faces/faces/';
data = zeros(64*64,nofiles);
for j = 1:nofiles   
  files = image(j).name;
  fullName = strcat(org,files);  
  img1 = imread(fullName);
  img1 = im2double(img1);
  img1 = imresize(img1,[64,64]);
  data(:,j) = img1(:);
end
[PC,V] = pca(data);
Dat = data'*PC(:,1:100);
[idx,C] = kmeans(Dat,8,'dist','sqeuclidean');

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
     subplot(2,8,i);
     imgreshape = reshape(PC(:,1:100)*C(i,:)',[64 64]);
     ims = sum(imgreshape,3);
     imshow(ims,[]);
end