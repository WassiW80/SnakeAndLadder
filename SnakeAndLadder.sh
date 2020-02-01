##!/bin/bash -x
echo "Welcome to Snake And Ladder"
#Constant
INITIAL_POSITION=0
WINNING_POSITION=100
NO_PLAY=0
LADDER=1
SNAKE=2
#Variable
player1=$INITIAL_POSITION
counter=0
function ladderSnakeOrNoPlayChecking() {
	option=$((RANDOM%3))
	case $option in
		$NO_PLAY)
			player1=$player1
			;;
		$LADDER)
			player1=$(($player1+$numberOnDie))
			if [ $player1 -gt 100 ]
			then
				player1=$(($player1-$numberOnDie))
			fi
			;;
		$SNAKE)
			player1=$(($player1-$numberOnDie))
			if [ $player1 -lt 0 ]
			then
				player1=0
			fi
			;;
	esac
}

function dieRoll() {
	numberOnDie=$(($RANDOM%6+1))
	ladderSnakeOrNoPlayChecking
	((counter++))
}
dieRoll

while [ $player1 -lt $WINNING_POSITION ]
do
	dieRoll
	echo "Die Count is : $counter"
	echo "Player 1 position : $player1"
done


