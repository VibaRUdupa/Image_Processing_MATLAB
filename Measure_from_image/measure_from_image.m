%% import image
clear;
clc;

obj = imread('ball.jpg');  %name of image file with extension.
%obj is mXnX3 matrix as it has 
%no. of pixels horizontally X no. of pixels horizontally X 3(R,G,B)
imshow(obj) %display image for confirmation.

%% image segmentation.

%separate image into its respective RGB counterparts.
red = obj( : , : , 1 );
green = obj( : , : , 2 );
blue = obj( : , : , 3 );

figure(1)   %create new figure window named 'figure 1'.

subplot( 2 , 2 , 1 );   %subplot of grid 2X2 and the position of this is 1.
imshow(obj)
title('original image')

subplot( 2 , 2 , 2 );   %subplot of grid 2X2 and the position of this is 2.
imshow(red)
title('Red image')

subplot( 2 , 2 , 3 );   %subplot of grid 2X2 and the position of this is 3.
imshow(green)
title('Green image')

subplot( 2 , 2 , 4 );   %subplot of grid 2X2 and the position of this is 4.
imshow(red)
title('Blue image') 

%after seeing the output, select the image which has maximum contrast in
%colors for further part of the program.
%for my original picture, green image had maximum contrast.

max_contrast_image = green;

%% Creating threshold value and performing image binarization.

figure(2) %create a new figure window named figure 2.

level = 0.23;   
%this value is decided by taking several trials. start it from 0.0 and 
%increment it by 0.01 until you get a good picture of ball.
%you can use increment and run feature of matlab for efficient analysis.

binary_image = imbinarize(max_contrast_image, level);
subplot( 2 , 1 , 1 );
imshow(binary_image)
title('Binary image')

%% complementing the binary_image (OPTIONAL)

%as the ball in my image is black and the background is white, I will be
%complementing the image. based on your previous output, you can either
%perform this or ommit this step.

complemented_binary_image = imcomplement(binary_image);
figure(2)   %reopen figure 2 and add the below subplot.
subplot( 2 , 1 , 2 );
imshow(complemented_binary_image)
title('Complemented Binary image')

%% removing noise

figure(3)
%imclearborder() suppresses structures that are lighter than their
%surroundings and that are connected to the image border.
clear_border_image = imclearborder( complemented_binary_image );
subplot( 2 , 2 , 1);
imshow(clear_border_image)
title('clear border image')

% a hole is a set of background pixels that cannot be reached by filling 
%in the background from the edge of the image.
%NOTE: the imfill options in MATLAB only fill in white color. Hence, it is
%important to complement image if main object in image is in black shade.
filled_image = imfill(clear_border_image, 'holes');
subplot( 2 , 2 , 2 );
imshow(filled_image)
title('Holes - Filled Binary image')

%there are still many small black spots on the ball surface.
%they are removed by performing morphological image processing operations.
%strel function creates a structure, here a disk of radius 7 pixels.
%imopen smoothens by making all regions of disks < 4 pixels smooth.
se = strel( 'disk' , 4 );
final_image = imopen(filled_image , se );
subplot( 2 , 2 , 3);
imshow(final_image)
title('Final image')

%% measure the object diameter

diameter = regionprops( final_image , 'MajorAxisLength' );

%display original image with measuring line for physical measurement.
figure(4)
imshow(obj)
title('Major Axis Length')
d = imdistline;

%display of calculated diameter.
[~,index] = sortrows([diameter.MajorAxisLength].'); 
diameter = diameter(index(end:-1:1)); 
clear index;
 A = diameter.MajorAxisLength
