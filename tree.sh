#!/bin/bash

#COLORS_GLOBAL
GREEN='\e[0;32m'
NC='\e[0m'

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
     echo -n "o";
  else
     echo -n "*";
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
     #Put some leaves or lights there!
     putSomeLightsLeaves $lights
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
   echo -n "uWu"
   ((lines++));
  done
  #reassign shared variables.
  line=$lines
}

#Clean the Corner honey!
tput clear

#Buy Me A Tree
buyMeATree $row $line $pillar

#Where'd the trunk go dad?
pillar=$(($(tput cols)/2))
dontMissTheTrunk $line $pillar

##Put lights on my tree please?




