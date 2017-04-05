newimage = zeros(6,3);
for i = 1:6
    new = M * (world(i,1:4)')/world(i,3);
    new(1) = new(1)/new(3);
    new(2) = new(2)/new(3);
    new(3) = 1;
    newimage(i,1:3) = new';
end

%plot new imageand the original image
%imageplot = plot(image(:,1),image(:,2));
%newimageplot = plot(newimage(:,1),newimage(:,2));

for i = 6
    difference = ((newimage(i,1)-image(i,1))^2+(newimage(i,2)-image(i,2))^2)^0.5;
end


%difference = newimageplot-imageplot;
%plot(difference);
%plot(image(:,1),image(:,2),'g',newimage(:,1),newimage(:,2),'b');

%difference = abs(newimageplot-imageplot);
%percentageDifference = difference ./ imageplot;

