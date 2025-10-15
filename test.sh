my_array=("Faucet" "Dump truk" "Pinata" "Robe" "Hanger" "Dumbel" "Ketchup" "Wallet" "Pillow" "Lotion")

read -p "enter the item you want to view (0-$((${#my_array[@]} - 1 ))): " index

if ! [[ "$index" =~ ^[0-9]+$ ]] || (( index < 0 || index >= ${#my_array[@]} )); then
	echo "not valid pls try something in range"
	exit
fi

echo "item is at index $index is: ${my_array[$index]}"