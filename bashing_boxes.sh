#!/bin/bash
# Faucet, Dump truk, Pinata, Robe, Hanger, Dumbel, Ketchup, Wallet, Pillow, Lotion
echo "Welcome to the list of random items"

objects=("Faucet" "Dump truk" "Pinata" "Robe" "Hanger" "Dumbel" "Ketchup" "Wallet" "Pillow" "Lotion")

echo " "
echo "Type 1 if you would like to see the options to view"
echo "Type 2 if you would like to see the options to add"
echo "Type 3 if you would like to see the options to remove"
echo "..Or just type X to leave"


while true; do

	read choice

	if [ "$choice" == "1" ]; then
		echo " "
		echo "You have chosen to view items"
		echo "Type 1 if you want to view all items"
		echo "Type 2 if you want to view a item in a specific position"
		echo "Type 3 if you just want to go back"
		read choiceview
		if [ "$choiceview" == "1" ]; then
			echo "you have chosen to view all items"
			echo "${objects[@]}"
		elif [ "$choiceview" == "2" ]; then
			read -p "You have chosen to view specific item at a position, please input a number between (0-$((${#objects[@]} - 1 ))): " index
			if ! [[ "$index" =~ ^[0-9]+$ ]] || (( index < 0 || index >= ${#objects[@]} )); then
				echo "not valid pls try something in range"
				exit
			fi
			echo "item at index $index is: ${objects[$index]}"
		elif [ "$choiceview" == "3" ]; then
			echo " "
			echo "Type 1 if you would like to see the options to view"
			echo "Type 2 if you would like to see the options to add"
			echo "Type 3 if you would like to see the options to remove"
			echo "..Or just type X to leave"
			continue
		else
			echo "Syntax error, your going to have to restart"
		fi
		sleep 1
		echo " "
		echo "Type 1 if you would like to see the options to view"
		echo "Type 2 if you would like to see the options to add"
		echo "Type 3 if you would like to see the options to remove"
		echo "..Or just type X to leave"
		continue
	elif [ "$choice" == "2" ]; then
		echo " "
		echo "You have chosen to add an item"
		echo "Type 1 if you want to add an item at a certian position on the list"
		echo "Type 2 if you want to add an item to the end of the list"
		echo "Type 3 if you just want to go back"
		read choiceadd
		if [ "$choiceadd" == "1" ];then
			echo "You want to add an item somewhere on the list, where do you want to add it?"
		elif [ "$choiceadd" == "2" ]; then
			echo " You want to add an item to the last position on the list, what will it be?"
			read +a objects
			echo "You have added ${objects[@]}"
		fi
		sleep 1
		echo " "
		echo "Type 1 if you would like to see the options to view"
		echo "Type 2 if you would like to see the options to add"
		echo "Type 3 if you would like to see the options to remove"
		echo "..Or just type X to leave"
		continue
	elif [ "$choice" == "3" ]; then
		echo " "
		echo "Type 1 if you want to remove an item on a certain position on the list"
		echo "Type 2 if you want to remove the last item on the list"
		echo "Type 3 if you just want to go back"
		read choiceremove
		break
	elif [[ "$choice" == "X" || "$choice" == "x" ]]; then
		echo " "
		echo "You have chosen to exit, goodbye!"
		break
	else
		echo "Syntax error, please try again"
		continue
	fi
done
