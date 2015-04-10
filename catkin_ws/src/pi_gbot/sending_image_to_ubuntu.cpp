#include <ros/ros.h>
#include <image_transport/image_transport.h>
#include <opencv2/highgui/highgui.hpp>
#include <cv_bridge/cv_bridge.h>


//added for picam
#include <ctime>
#include <iostream>
#include <raspicam/raspicam_cv.h>
using namespace std;
//end: added for picam


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
  cv::Mat image;
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
    Camera.grab();
    Camera.retrieve (image);
    sensor_msgs::ImagePtr msg = cv_bridge::CvImage(std_msgs::Header(), "bgr8", image).toImageMsg();
    
//end of pi cam
    pub.publish(msg);
    ros::spinOnce();
    loop_rate.sleep();
  }
}

