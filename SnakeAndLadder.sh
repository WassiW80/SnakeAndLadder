#!/bin/bash -x
echo "Welcome to Snake And Ladder"
INITIAL_POSITION=0
player1=$INITIAL_POSITION

function dieRoll() {
   numberOnDie=$(($RANDOM%6+1))
}
dieRoll

