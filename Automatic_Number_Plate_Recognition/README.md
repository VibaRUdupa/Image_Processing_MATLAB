# "Automatic Number Plate Recognition" 

This is a MATLAB script for automatic number plate recognition of vehicles.
This can be used to keep a track of the vehicles that have crossed a particular junction or entered a facility.

### The steps followed are:

i. import image.(Image should have the number plate of the vehicle clearly visible.)

<img src = "https://github.com/VibaRUdupa/Image_Processing_MATLAB/blob/master/Image_for_linking/apn_fig1.PNG" height = 500 width = 500 >

ii. convert the image to grayscale.

<img src = "https://github.com/VibaRUdupa/Image_Processing_MATLAB/blob/master/Image_for_linking/apn_fig2.PNG"  height = 500 width = 500 >

iii. to recognise the registration numbers, first the number plate must be recognized. This is done by using edge detecting operator "sobel". 
     After edge detection, the boundary of the number plate will now be clearly defined.
     
<img src = "https://github.com/VibaRUdupa/Image_Processing_MATLAB/blob/master/Image_for_linking/apn_fig3.PNG" height = 500 width = 500 >

iv. After this, the number plate must be isolated. This is done by:

a. clearing the border of the image, this suppresses the light regions surrounding the image border. This makes improves the quality of the filled image in the next step.
       
<img src = "https://github.com/VibaRUdupa/Image_Processing_MATLAB/blob/master/Image_for_linking/apn_fig4.PNG" height = 500 width = 500 >
       
b. Filling the region inside the number plate with white color.
       
<img src = "https://github.com/VibaRUdupa/Image_Processing_MATLAB/blob/master/Image_for_linking/apn_fig5.PNG" height = 500 width = 500 >
       
c. Preforming morphological image processing on the image to completely darken the background of the number plate.
       
<img src = "https://github.com/VibaRUdupa/Image_Processing_MATLAB/blob/master/Image_for_linking/apn_fig6.PNG" height = 500 width = 500 >
       
v. Now, we must retrieve the characters on the number plate. This is done by multiplying the processed image with the gray scale image to obtain the number plate.

<img src = "https://github.com/VibaRUdupa/Image_Processing_MATLAB/blob/master/Image_for_linking/apn_fig7.PNG" height = 500 width = 500 >

vi. After this, the data on the number plate must be read. This is done using optical character recognition function from the computer vision toolbox of MATLAB. After the text is read, we only take the alpha-numeric readings and display it as the final ressult.

<img src = "https://github.com/VibaRUdupa/Image_Processing_MATLAB/blob/master/Image_for_linking/apn_fig8.PNG" height = 300 width = 1500 >



### Applications: 
 
Automatic Number Plate Recognition has a wide range of applications since the license number is the primary, most widely accepted, human readable, mandatory identifier of motor vehicles. Some of its applications include:

1. Parking automation and Parking security.

2. Journey time measurement.

3. Track vehicle movements.

### Limitations

The vehicle number plate must follow the rules for the number plate by government and the characters must be of standard font. 

There has to be good lighting when the picture is taken.
 
