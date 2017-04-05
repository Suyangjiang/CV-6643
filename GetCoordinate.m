clc;
picture = imread('1.jpg');
%imshow(picture);
%imagecoordinate = ginput; %get image coordinate from image saved as imagecoordinate

%import data from excel to get world coordinate

worldcoordinate = xlsread('world coordinate.xls');

image = [imagecoordinate,[1;1;1;1;1;1]];

world = [worldcoordinate,[1;1;1;1;1;1]];

%bonus part
%{
newworldcoordinate = xlsread('bonusworldcoordinates.xls');
newworld = [newworldcoordinate,[1;1;1;1;1;1]];

newworldimage = imread('newimage.JPG');
%imshow(newworldimage);
%bonusimagecoordinate = ginput;
bonusimage = [bonusimagecoordinate,[1;1;1;1;1;1]];

%}
