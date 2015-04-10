#!/bin/bash
#How to run
#source setupws.sh

function SetNetWorkAddress {

#Pass IP address to 'IP_LOCAL' variable
IP_LOCAL=$(hostname  -I | cut -f1 -d' ')

#To let ROS know that it is one IP address to receive node info
export ROS_IP=${IP_LOCAL}

#print variable on a screen
echo "Local IP Address: ${IP_LOCAL}"

#To see the effect of change
export | grep ROS

}


#echo 'Which one do you want to setup first?'

#echo "1. to setup environment"
#echo "2. to setup network environment"
#echo "3. to setup master network environment"


CONTINUE_TO_LOOP=1

while [ $CONTINUE_TO_LOOP -eq 1 ]

do 



echo 'Which one do you want to setup?'
echo "1. to setup environment"
echo "2. To setup enviroment for installed package"
echo "3. to setup network environment"
echo "4. to setup master network environment"
echo "5. to quit"


read CHOICE

if [ $CHOICE -eq 5 ]; then 
CONTINUE_TO_LOOP=0
echo "Bye Bye"
fi


#Integer comparison:
if [ $CHOICE -eq 1 ]; then 
source /opt/ros/indigo/setup.bash
source ./devel/setup.bash
echo "!!-------Enviroment has been set -------!!"
fi


if [ $CHOICE -eq 2 ]; then
#only if you installed certaion package
#using for rosserial 
source install/setup.bash
echo "!!-------Enviroment for installed packages has been set-------!!"
fi

if [ $CHOICE -eq 3 ]; then 
SetNetWorkAddress
echo "!!-------NetWork Has Been Set-------!!"
fi


if [ $CHOICE -eq 4 ]; then 
echo "1. to setup this current PC as master network"
echo "2. to setup this current PC as part of master network"
read CHOICEFORMASTER



if [ $CHOICEFORMASTER -eq 1 ]; then 

IP_LOCAL=$(hostname  -I | cut -f1 -d' ')
export ROS_MASTER_URI=http://${IP_LOCAL}:11311
export | grep ROS
echo "!!-------Master NetWork Address has been set-------!!"
fi


if [ $CHOICEFORMASTER -eq 2 ]; then 
echo "Please supply the network address to be part of the master network"
read IP_ADDRESS
export ROS_MASTER_URI=http://${IP_ADDRESS}:11311
export | grep ROS
echo "!!-------Master NetWork Address has been set-------!!"
fi


fi


done
