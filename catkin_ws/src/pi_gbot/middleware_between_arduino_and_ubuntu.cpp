#include "ros/ros.h"
#include "std_msgs/String.h"
#include <sstream>

//******keyboard******
#include<stdio.h>
#include <termios.h>            //termios, TCSANOW, ECHO, ICANON
#include <unistd.h>     //STDIN_FILENO
const int wKey = 119;
const int  sKey = 115;
const int  aKey = 97;
const int  dKey = 100;
const int minusKey = 45;
const int plusKey =   43;
bool isItOkayToPublish = false;
//std::string dataToArduino ("default);
std_msgs::String msgtoArduino;

//******keyboard******



char getInputChar(){
//http://stackoverflow.com/questions/421860/capture-characters-from-standard-input-without-waiting-for-enter-to-be-pressed?#comment46623559_912796
        char buf = 0;
        struct termios old = {0};
        if (tcgetattr(0, &old) < 0)
                perror("tcsetattr()");
        old.c_lflag &= ~ICANON;
        old.c_lflag &= ~ECHO;
        old.c_cc[VMIN] = 1;
        old.c_cc[VTIME] = 0;
        if (tcsetattr(0, TCSANOW, &old) < 0)
                perror("tcsetattr ICANON");
        if (read(0, &buf, 1) < 0)
                perror ("read()");
        old.c_lflag |= ICANON;
        old.c_lflag |= ECHO;
        if (tcsetattr(0, TCSADRAIN, &old) < 0)
                perror ("tcsetattr ~ICANON");
        return (buf);
}
std_msgs::String sendKeyBoardInputData(char inputKey){
    std_msgs::String msg;

    std::stringstream ss;
    ss << inputKey;
    msg.data = ss.str();

    ROS_INFO("%s", msg.data.c_str());
return msg;
    //chatter_pub.publish(msg);
}








void chatterCallback(const std_msgs::String::ConstPtr& msg) {
     ROS_INFO("I heard: [%s]", msg->data.c_str());
//FooMsg copy = callbackMsg;
//msgtoArduino copy = msg;


std_msgs::String msgToBeSent;

std::stringstream ss;
    ss << msg->data.c_str();
msgtoArduino.data = ss.str();
   // msg.data = ss.str();




isItOkayToPublish = true;



//std::string msgString = msg->data.c_str();
/*
std::string stringUP ("w");

  //std::string str1 ("green apple");
 // std::string str2 ("red apple");

if (stringUP.compare(msg->data.c_str()) == 0){
ROS_INFO("I heard: [%s]", "up detected");
dataToArduino = "w";
isItOkayToPublish = true;
}
	
*/




   }






int main(int argc, char **argv)
{
  ros::init(argc, argv, "middleware_between_arduino_and_ubuntu"); //this is the name to run in console

  ros::NodeHandle n;

  ros::Publisher chatter_pub = n.advertise<std_msgs::String>("pi_msg_to_arduino", 1000); //topic
  //qt_chatter_topic
 

 //subscribe here
  ros::Subscriber sub = n.subscribe("qt_chatter_topic", 1000, chatterCallback);




 ros::Rate loop_rate(10);

   





  /**
   * A count of how many messages we have sent. This is used to create
   * a unique string for each message.
   */
  int count = 0;
  int KB_code=0;
  while (ros::ok())
  {

//std_msgs::String msg;

/*
KB_code = getInputChar();
            printf("KB_code = %i \n",KB_code);
std_msgs::String msg;
bool isItCorrectToPublish = false;
            switch (KB_code)
            {
                case wKey:
                          
		msg = sendKeyBoardInputData (wKey);
		isItCorrectToPublish = true;
                break;

                case sKey:
                 msg =sendKeyBoardInputData (sKey);
		isItCorrectToPublish = true;                    
                break;

         	case aKey:
                 msg = sendKeyBoardInputData (aKey); 
                 isItCorrectToPublish = true;
                break;

          	case dKey:
                msg =sendKeyBoardInputData (dKey);
                isItCorrectToPublish = true;  
                break;

        	case minusKey:
                msg =sendKeyBoardInputData (minusKey);
                isItCorrectToPublish = true;  
                break;

		case plusKey:
                msg =sendKeyBoardInputData (plusKey);
                isItCorrectToPublish = true;  
                break;
		
            }        	

if  (isItCorrectToPublish){
  chatter_pub.publish(msg);
}
*/

if  (isItOkayToPublish){
isItOkayToPublish = false;
//std_msgs::String msg;

  //  std::stringstream ss;
  //  ss << dataToArduino;
  //  msg.data = ss.str();




  chatter_pub.publish(msgtoArduino);
}





    ros::spinOnce();

    loop_rate.sleep();
    ++count;
  }


  return 0;
}














