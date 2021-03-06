#include <ros/ros.h>
#include <image_transport/image_transport.h>
#include <opencv2/highgui/highgui.hpp>
#include <cv_bridge/cv_bridge.h>

//for opencv
#include <opencv2/imgproc/imgproc.hpp>

//added for picam
#include <ctime>
#include <iostream>
#include <raspicam/raspicam_cv.h>
using namespace std;
//end: added for picam

//for pi cam
using namespace cv;

//void drawContour
//Mat image, grayScaleImage, thresholdImage, erodedImage;
//int thresh = 100;


Mat getCenter(const Mat inputImage);

void thresh_callback(int, void* );


int main(int argc, char** argv)
{
  ros::init(argc, argv, "image_publisher");
  ros::NodeHandle nh;
  image_transport::ImageTransport it(nh);
  image_transport::Publisher pub = it.advertise("camera/image", 1);

//for picam
  const int FRAME_WIDTH = 320;
  const int FRAME_HEIGHT = 240;
  raspicam::RaspiCam_Cv Camera;
 // cv::Mat image, grayScaleImage, thresholdImage, erodedImage;
  cv::Mat erodeElement = cv::getStructuringElement( cv::MORPH_RECT, cv::Size(4,4));
  Camera.set( CV_CAP_PROP_CONVERT_RGB, CV_8UC3 );
  Camera.set(CV_CAP_PROP_FRAME_WIDTH, FRAME_WIDTH);
  Camera.set(CV_CAP_PROP_FRAME_HEIGHT, FRAME_HEIGHT);

  cout<<"Opening Camera..."<<endl;
  if (!Camera.open()) {cerr<<"Error opening the camera"<<endl;return -1;}
/*wait for a least 5 sec to stablilize the camera before the opening of the camera*/
  sleep(5);
//end: for picam

  ros::Rate loop_rate(5);
  while (nh.ok()) {

//for pi cam
    Mat image;
    Camera.grab();
    Camera.retrieve (image);

    Mat resultantImage = getCenter(image);
    sensor_msgs::ImagePtr msg = cv_bridge::CvImage(std_msgs::Header(), "bgr8", resultantImage).toImageMsg(); //sending image in bgr8 format//"mono8" can be used too.

    pub.publish(msg);
    ros::spinOnce();
    loop_rate.sleep();
  }
}


Mat getCenter(const Mat inputImage){

//Ref: http://docs.opencv.org/doc/tutorials/imgproc/shapedescriptors/bounding_rects_circles/bounding_rects_circles.html
//Ref: http://roboticssamy.blogspot.pt/

//this values have to be tuned base on camera mounting//basically how camera see
 const int imageXcorrd = 0;
 const int imageYcorrd = 200;
 const int imageWidth = 320;
 const int imageHeight = 40;

 Mat grayScaleImage,thresholdImage,erodedImage,dilatedImage;
 Rect region_of_interest = Rect(imageXcorrd, imageYcorrd, imageWidth, imageHeight); //x y w h 
 Mat imageRoi = inputImage(region_of_interest);
 cvtColor( imageRoi, grayScaleImage, CV_RGB2GRAY );

 threshold(grayScaleImage, thresholdImage, 70, 255,THRESH_BINARY_INV); //THRESH_BINARY_INV has better detection than THRESH_BINARY
 Mat erodeElmt = getStructuringElement(MORPH_RECT, Size(3, 3));
 Mat dilateElmt = getStructuringElement(MORPH_RECT, Size(5, 5));
 erode(thresholdImage, erodedImage, erodeElmt);
 dilate(erodedImage, dilatedImage, dilateElmt);

 vector<vector<Point> > contours;
 vector<Vec4i> hierarchy;
 findContours( dilatedImage, contours, hierarchy, CV_RETR_TREE, CV_CHAIN_APPROX_SIMPLE, Point(0, 0) );

  /// Approximate contours to polygons + get bounding rects and circles
 vector<vector<Point> > contours_poly( contours.size() );
 vector<Point2f>center( contours.size() );
 vector<float>radius( contours.size() );

 for( int i = 0; i < contours.size(); i++ )
   { approxPolyDP( Mat(contours[i]), contours_poly[i], 3, true );
     //boundRect[i] = boundingRect( Mat(contours_poly[i]) );
     minEnclosingCircle( (Mat)contours_poly[i], center[i], radius[i] );
   }

   Mat modifiedImage = inputImage.clone();

   cout<<contours.size()<<endl;

   for( int i = 0; i< contours.size(); i++ )
   {
     Scalar color = Scalar(0, 0, 255 ); //Pure red color
     drawContours( modifiedImage, contours_poly, i, color, 1, 8, vector<Vec4i>(), 0, Point(imageXcorrd,imageYcorrd) );
     Mat pointsMat = Mat(center[i]);
     int offsetYcorrdinate = pointsMat.at<float>(1);
     int offsetXcorrdinate = pointsMat.at<float>(0);

     circle( modifiedImage, Point(imageXcorrd+offsetXcorrdinate,imageYcorrd+offsetYcorrdinate), 5, color, 1, 8, 0 );

     cout<<"the X offset is"<<endl;
     cout<<offsetXcorrdinate<<endl;

  /// Show in a window
     namedWindow( "Contours", CV_WINDOW_AUTOSIZE );
     imshow( "Contours", modifiedImage );

     namedWindow( "ROI image", CV_WINDOW_AUTOSIZE );
     imshow( "ROI image", imageRoi );
     waitKey(10);

     return modifiedImage;

   }
 }

















