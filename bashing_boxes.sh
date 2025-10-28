#!/bin/bash
# Faucet, Dump truk, Pinata, Robe, Hanger, Dumbel, Ketchup, Wallet, Pillow, Lotion
echo "Welcome to the list of random items"

objects=("Faucet" "Dump truk" "Pinata" "Robe" "Hanger" "Dumbel" "Ketchup" "Wallet" "Pillow" "Lotion")


while true; do

	echo " "
	echo "Type 1 if you would like to see the options to view"
	echo "Type 2 if you would like to see the options to add"
	echo "Type 3 if you would like to see the options to remove"
	echo "Type 4 if you would like to save"
	echo "..Or just type X to leave"
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
				echo "Number not in range"
				exit
			fi
			echo "item at index $index is: ${objects[$index]}"

		elif [ "$choiceview" == "3" ]; then
			continue

		else
			echo "Syntax error, your going to have to restart"

		fi
		sleep 2
		continue

	elif [ "$choice" == "2" ]; then
		echo " "
		echo "You have chosen to add an item"
		echo "Type 1 if you want to add an item at a certian position on the list"
		echo "Type 2 if you want to add an item to the end of the list"
		echo "Type 3 if you just want to go back"
		read choiceadd

		if [ "$choiceadd" == "1" ];then
			read -p "You want to add an item somewhere on the list, where do you want to add it (0-$((${#objects[@]} - 1 ))): " number
			if ! [[ "$number" =~ ^[0-9]+$ ]] || (( number < 0 || number >= ${#objects[@]} )); then
				echo "that number isnt in range"
				exit
			fi
			echo "You have chosen $number as the position, what would you like to call this object?"
			read addedobject
			echo "You have added $addedobject to $number."
			objects=( "${objects[@]:0:$number}"  "$addedobject" "${objects[@]:$number}")

		elif [ "$choiceadd" == "2" ]; then
			echo "You want to add an item to the last position on the list, what will it be?"
			read newobject
			objects+=( "$newobject" )
			echo "You have added ${objects[@]}"

		elif [ "$choiceview" == "3" ]; then
			continue

		else
			echo "Syntax erorr, your going to have to restart"

		fi
		sleep 2
		continue

	elif [ "$choice" == "3" ]; then
		echo " "
		echo "Type 1 if you want to remove an item on a certain position on the list"
		echo "Type 2 if you want to remove the first item on the list"
		echo "Type 3 if you just want to go back"
		read choiceremove
		if [ "$choiceremove" == "1" ]; then
			read -p "You have chosen to remove and item from the list, pick a number between (0-$((${#objects[@]} - 1))): " removalnumber
			if ! [[ "$removalnumber" =~ ^[0-9]+$ ]] || (( removalnumber < 0 || removalnumber >= ${#objects[@]} )); then
				echo "Syntax error, your going to have to restart"
				continue
			fi	
			unset objects[$removalnumber]
			echo "Object has succesfully been removed"
		elif [ "$choiceremove" == 2 ]; then
			unset objects[0]
			echo " "
			echo "First item has been removed!"
		else
			echo "Syntax error, you will have to restart"
		fi
		sleep 2
		continue
	elif [[ "$choice" == "X" || "$choice" == "x" ]]; then
		echo " "
		echo "You have chosen to exit, goodbye!"
		break

	else
		echo "Syntax error, please try again"
		continue
	fi
elif [[ "$choice" == "4" ]]; then
	echo "you have chosen to save your progress!"
done
