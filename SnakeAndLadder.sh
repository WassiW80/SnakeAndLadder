#!/bin/bash -x
echo "Welcome to Snake And Ladder"
#Constant
INITIAL_POSITION=0
WINNING_POSITION=100
NO_PLAY=0
LADDER=1
SNAKE=2
#Variable
player1=$INITIAL_POSITION
player2=$INITIAL_POSITION
currentPlayer=$INITIAL_POSITION
flag=true

function ladderSnakeOrNoPlayChecking() {
	option=$((RANDOM%3))
	case $option in
		$NO_PLAY)
			currentPlayer=$currentPlayer
			;;
		$LADDER)
			currentPlayer=$(($currentPlayer+$numberOnDie))
			if [ $currentPlayer -gt $WINNING_POSITION ]
			then
				currentPlayer=$(($currentPlayer-$numberOnDie))
			fi
			;;
		$SNAKE)
			currentPlayer=$(($currentPlayer-$numberOnDie))
			if [ $currentPlayer -lt $INITIAL_POSITION ]
			then
				currentPlayer=$INITIAL_POSITION
			fi
			;;
	esac
}

function dieRoll() {
	numberOnDie=$(($RANDOM%6+1))
	ladderSnakeOrNoPlayChecking
}

function playingWithTwoPlayer(){
	if [[ $flag == true ]]
	then
		currentPlayer=$player1
		dieRoll
		player1=$currentPlayer
		flag=false
	else
		currentPlayer=$player2
		dieRoll
		player2=$currentPlayer
		flag=true
	fi
}

function winnerChecking(){
	if [[ $player1 -eq $WINNING_POSITION ]]
	then
		echo "PLAYER 1 WIN!!!"
	else
		echo "PLAYER 2 WIN!!!"
	fi
}

while [ $currentPlayer -lt $WINNING_POSITION ]
do
	playingWithTwoPlayer
done

winnerChecking
