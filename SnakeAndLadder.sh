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
			if [ $currentPlayer -gt 100 ]
			then
				currentPlayer=$(($currentPlayer-$numberOnDie))
			fi
			;;
		$SNAKE)
			currentPlayer=$(($currentPlayer-$numberOnDie))
			if [ $currentPlayer -lt 0 ]
			then
				currentPlayer=0
			fi
			;;
	esac
}

function dieRoll() {
	numberOnDie=$(($RANDOM%6+1))
	ladderSnakeOrNoPlayChecking
	#((counter++))
}

function playingWith2Player(){
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

while [ $currentPlayer -lt $WINNING_POSITION ]
do
	playingWith2Player
done

function winnerChecking(){
	if [[ $player1 -eq $WINNING_POSITION ]]
	then
		echo "PLAYER 1 WIN!!!"
	elif [[ $player2 -eq $WINNING_POSITION ]]
	then
		echo "PLAYER 2 WIN!!!"
	fi
}
winnerChecking
