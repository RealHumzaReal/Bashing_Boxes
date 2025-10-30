#!/bin/bash
# Faucet, Dump truk, Pinata, Robe, Hanger, Dumbel, Ketchup, Wallet, Pillow, Lotion
echo "Welcome to the list of random items"

path="/home/gamerwolf4512/Bashing_Boxes/data"

viewallitems1() {
echo "you have chosen to view all items"
echo "${objects[@]}"
}
viewitematposition1() {
read -p "You have chosen to view specific item at a position, please input a number between (0-$((${#objects[@]} - 1 ))): " index
if ! [[ "$index" =~ ^[0-9]+$ ]] || (( index < 0 || index >= ${#objects[@]} )); then
	echo "Number not in range"
	exit
fi
echo "item at index $index is: ${objects[$index]}"
}
listseprately4() {
for e in "${objects[@]}"; do
	echo $e
done

}
findfiletomake4() {
file="load"
extension="sh"
filename=$path/"${file}.${extension}"

count=1
while [[ -f "$filename" ]]; do
	count=$(( count + 1 ))
	filename=$path/"${file}${count}.${extension}"
done
touch $filename
declare -p objects > $filename

echo "Saved new file, file name is $filename"
}

objects=("Faucet" "Dump truk" "Pinata" "Robe" "Hanger" "Dumbel" "Ketchup" "Wallet" "Pillow" "Lotion")


while true; do

	
	echo " "
	echo "Type 1 if you would like to see the options to view"
	echo "Type 2 if you would like to see the options to add"
	echo "Type 3 if you would like to see the options to remove"
	echo "Type 4 if you would like to load a previous save or create a new save"
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
			viewallitems1

		elif [ "$choiceview" == "2" ]; then
			viewitematposition1

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
		elif [ "$choiceremove" == 3 ]; then
			continue
		else
			echo "Syntax error, you will have to restart"
		fi
		sleep 2
		continue
	elif [[ "$choice" == "X" || "$choice" == "x" ]]; then
		echo " "
		echo "You have chosen to exit, would you like to save your progress before leaving? (y/n)"
		read savebeforeleave
		if [[ "$savebeforeleave" == "y" || "$savebeforeleave" == "Y" ]]; then
			echo "Saving before exiting.."
			findfiletomake4
			break
		elif [[ "$savebeforeleave" == "n" || "$savebeforeleave" == "N" ]]; then
			echo "okay goodbye"
			break
		else
			echo "syntax error brahhh, try again"
		fi
	elif [ "$choice" == "4" ]; then
		echo "you have chosen to load a previous save/create a new save!"
		echo "Type 1 if you would like to create a save"
		echo "Type 2 if you would like to load a previous save"
		echo "Type 3 if you would like to overwrite a previous save"
		echo "Type 4 if you would like to remove a save/saves"
		echo "Type 5 if you would like to go back"
		read choicesave
		if [ "$choicesave" == "1" ]; then
			findfiletomake4
			echo "Congrats a new save has been made!"
		elif [ "$choicesave" == "2" ]; then
			echo "What save would you like to load? Here are your options:"
			showfiles=$(ls $path)
			echo -e "$showfiles"
			echo "Type in the number of the save file! "
			read loadoption
			if [[ -e $path/load$loadoption.sh ]]; then
				echo "Loading save file"
				source $path/load$loadoption.sh
				echo "Succesfully loaded file"
			else
				echo "Save file does not exist"
			fi
		elif [ "$choicesave" == "3" ]; then
			echo "What save would you like to overwrite? Here are your options:"
			echo -e "$showfiles"
			echo "Type in the number to overwrite the save file!"
			read overwrite
			if [[ -e $path/load$overwrite.sh ]]; then
				echo "Overwriting.."
				 declare -p objects > $path/load$overwrite.sh
				echo "Save file has been overwritten!"
			else
				echo "Save file does not exist"
			fi
		elif [ "$choicesave" == "4" ]; then
			echo "You have chosen to remove a save/saves"
			echo "Type 1 if you would like to remove a save"
			echo "Type 2 if you would like to get rid of all saves"
			read removesave
			if [ "$removesave" == "1" ]; then
				echo "What save would you like to remove?"
			elif [ "$removesave" == "2" ]; then
				echo "Removing all saves"
			else
				echo "Syntax error, your going to have to restart"
			fi
		elif [ "choicesave" == "5" ]; then
			continue
		else
			echo "Syntax error, your going to have to restart!"
		fi
	else
		echo "Syntax error, please try again"
		continue
	fi
done
