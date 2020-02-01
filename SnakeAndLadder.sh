#!/bin/bash -x
echo "Welcome to Snake And Ladder"
#Constant
INITIAL_POSITION=0
NO_PLAY=0
LADDER=1
SNAKE=2
#Variable
player1=$INITIAL_POSITION

function ladderSnakeOrNoPlayChecking() {
	option=$((RANDOM%3))
	case $option in
		$NO_PLAY)
			player1=$player1
			;;
		$LADDER)
			player1=$(($player1+$numberOnDie))
			;;
		$SNAKE)
			player1=$(($player1-$numberOnDie))
			;;
	esac
}

function dieRoll() {
   numberOnDie=$(($RANDOM%6+1))
	ladderSnakeOrNoPlayChecking
}
dieRoll

