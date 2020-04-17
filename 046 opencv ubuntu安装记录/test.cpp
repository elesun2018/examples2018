#include <cv.h>  
#include <highgui.h>  

using namespace cv;  

int main(int argc, char* argv[])  
{  
    Mat image;  
    image = imread("1.jpg");  
    namedWindow("Display Image", CV_WINDOW_AUTOSIZE);  
imshow("Display Image", image);  
 waitKey(0);  
    return 0;  
}