%% import image
clear;
clc;

obj = imread('Car_No_Plate.PNG');  %name of image file with extension.
%obj is mXnX3 matrix as it has 
%no. of pixels horizontally X no. of pixels horizontally X 3(R,G,B)

figure(1)
imshow(obj) %display image for confirmation.
title('Original image')

%% converting RGB image to a grayscale image

gray_scale = rgb2gray(obj);
%grayscale image is a 1D image carying only shades of gray.
%we convert RGB image to a grayscale image because color increases
%complexity of image.

figure(2)
imshow(gray_scale)
title('grayscale image')

%% edge detection using sobel operator

%edge detection is done using sobel operator, this is necessary to separate
%the rectangular number plate from the image.

esobel= edge( gray_scale , 'sobel');

figure(3)
imshow(esobel)
title('Edge detection by sobel method')

%there are other operators such as "canny" and "prewitt".
%NOTE: sobel operator is widely prefered for its accuracy.
%in this image too, sobel method worked best.
%but for your choosen image if the rectangle is not recognised well,
%other edge detection methods can be used and choose which edge
%detection method works best for you.

% it is very important to get a well defined boundary of the numberplate to
% go further.

edge_detected_image = esobel;

%%  isolating the number plate 

%imclearborder() suppresses structures that are lighter than their
%surroundings and that are connected to the image border.
figure(4)
clear_border_image = imclearborder( edge_detected_image );
imshow(clear_border_image)
title('clear border image')

% a hole is a set of background pixels that cannot be reached by filling 
%in the background from the edge of the image.
%NOTE: the imfill options in MATLAB only fill in white color.
figure(5)
filled_image = imfill( edge_detected_image , 'holes');
imshow(filled_image)
title('Holes - Filled Binary image')

%there are still many small black spots on the ball surface.
%they are removed by performing morphological image processing operations.
%strel function creates a structure, here a disk of radius 15 pixels.
%imopen smoothens by making all regions of disks < 15 pixels smooth.
se = strel( 'disk' , 15 );
final_image = imopen(filled_image , se );
figure(6)
imshow(final_image)
title('Final image after morphological processing')

%% getting the numbers on the numberplate

%once the number plate is fully isolated, we must retrive the numbers on it
%back to read them. This is done by using the function immultiply, 
%immultiply(X,Y) multiplies each element in array X by the corresponding 
%element in array Y

no_plate = immultiply(final_image, gray_scale);

figure(7)
imshow(no_plate)
title('number plate')


%% reading the number plate

%We will use ocr function from computer vision toolbox.
%ocr function recognises text using optical character recognition.

%initialize the string reg_no, this string will hold the value of the
%registration number of the number plate.

reg_no = '';

result = ocr(no_plate, 'TextLayout', 'Line');

%returns an ocrText object containing optical character recognition 
%information from the input image, I. The object contains recognized text, 
%text location, and a metric indicating the confidence of the 
%recognition result.
%the name value argument treats the characters as a single line text.

string=result.Text;

%returns the text recognized by the ocr function.

for i = 1 : length(string)
    
    %loop ensures only the alpha-numeric text is stored in the string
    %variable reg_no.
    
    if (string(i) >= '0' &&  string(i) <= '9' ) || (string(i) >= 'A' &&  string(i) <= 'Z' )
        reg_no = [reg_no string(i)];
    else
        continue;
    end
end

%display the registration number of the car.
fprintf("The registration number of the car is found to be: %s\n",reg_no);
    
