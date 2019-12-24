#!/bin/bash

#COLORS_GLOBAL
GREEN='\e[0;32m'
BROWN='\e[0;33m'
NC='\e[0m'
BOLD=$(tput bold)
NORMAL=$(tput sgr0)
BLINK=$(tput blink)
SURPRISE=$()
#What type of tree do ya need?
row=19
line=1
pillar=$(($(tput cols)/2))
lights=5


#Put some lights on the tree please
function putSomeLightsLeaves(){
  if [[ $(($RANDOM % $1)) == 1 ]]
  then
     #tput cup $2 $(($3 - 1))
     echo -ne "${BOLD}${BLINK}$(tput setaf $((($RANDOM + 1) % 8)))o${NORMAL}"
  else
    echo -ne "${GREEN}${BOLD}*${NORMAL}${NC}"
  fi
}

function buyMeATree()
{
  #buyMeATree row line pillar
  local lines=$2
  local pillars=$3
  for (( i=0; i<=$1; i+=2 ));
  do
   tput cup $lines $((pillars - 1))
   for (( j=0; j<=i; j++ ));
   do
     echo -ne "${GREEN}${BOLD}*${NORMAL}${NC}"
      #Put some leaves or lights there!
      #putSomeLightsLeaves $lights
   done
   ((lines++));
   ((pillars--));
  done
  #reassign to shared variables.
  line=$lines
  pillar=$pillars
}

function dontMissTheTrunk()
{
  #usage dontMissTheTrunk line pillar
  local lines=$1
  local pillars=$2
  for (( i=0; i<=2; i++ ));
  do
   tput cup $lines $((pillars - 2))
   echo -ne "${BROWN}${BOLD}uWu${NORMAL}${NC}"
   ((lines++));
  done
  echo 
  #reassign shared variables.
  line=$lines
}

function decorateMyTree(){
 #get center of the screen
 #arg1 = light
 #
  local lines=$2
  local pillars=$3
  for (( i=0; i<=$1; i+=2 ));
  do
   tput cup $lines $((pillars - 1))
   for (( j=1; j<=i; j++ ));
   do
     putSomeLightsLeaves $lights
      #Put some leaves or lights there!
      #putSomeLightsLeaves $lights
   done
   ((lines++));
   ((pillars--));
  done
}

function cleanTheMess() {
  ##Handler for the ctrl+C 
 tput sgr0;
 tput cnorm;
 tput clear;
 echo ByeBye;
 exit;
  
}
#Clean the Corner honey!
tput clear
tput civis
trap cleanTheMess INT
#Buy Me A Tree
buyMeATree $row $line $pillar 
#Where'd the trunk go dad?
pillar=$(($(tput cols)/2))
dontMissTheTrunk $line $pillar
##Put lights on my tree please?
row=19
line=1
pillar=$(($(tput cols)/2))
while true; 
do
  decorateMyTree $row $line $pillar
  sleep 1
done





