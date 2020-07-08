"Measure from image" 

The first script added allows user to measure the diameter of the object in an image in "pixels". 

The steps followed are: 

i. import image.(object should be easily identifiable in the image.) 

![Figure 1](https://github.com/VibaRUdupa/Image_Processing_MATLAB/blob/master/Image_for_linking/figure%201.PNG)


ii. split the image into primary colors Red, Green, Blue. After observing the output, the image with maximum contrast is selected. 
This is done to ensure that the binary image we will produce in next step is of best possible quality. 

![Figure 1](https://github.com/VibaRUdupa/Image_Processing_MATLAB/blob/master/Image_for_linking/figure%201.PNG)


iii. create a threshold value by trial and error method and binarize the image. 
If the main object in the image is of dark shade, then the image must be complemented. 
Note: It is advisable to always have the object of importance in white shade as the MATLAB functions imfill() always fills in dark shade. 

![Figure 2](https://github.com/VibaRUdupa/Image_Processing_MATLAB/blob/master/Image_for_linking/figure%202.PNG)


iv. All noise must be removed. This is done by filling in holes and clearing the boundary and using morpological image processing techniques. 
Finally a smooother image is obtained. This is important as it makes it easier for MATLAB to recognise the major object in the image and measure its major axis lenght. 

![Figure 3](https://github.com/VibaRUdupa/Image_Processing_MATLAB/blob/master/Image_for_linking/figure%203.PNG)


v. Measure the major axis lenght using regionprops() function. 
It returns a structure, which is sorted in a decreasing fashion so that the first value is the major axis lenght. 
NOTE: an additional distance measuring scale is added to physically measure the maximum distance and compare with computed quantity.

![Figure 4](https://github.com/VibaRUdupa/Image_Processing_MATLAB/blob/master/Image_for_linking/figure%204.PNG)


