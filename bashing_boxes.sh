#!/bin/bash
# Faucet, Dump truk, Pinata, Robe, Hanger, Dumbel, Ketchup, Wallet, Pillow, Lotion
echo "Welcome to the list of random items"

objects={"Faucet","Dump truk","Pinata","Robe","Hanger","Dumbel","Ketchup","Wallet","Pillow","Lotion"}

echo " "
echo "Type 1 if you would like to see the options to view"
echo "Type 2 if you would like to see the options to add"
echo "Type 3 if you would like to see the options to remove"
echo "..Or just type X to leave"

read choice

if $choice == "1" then
	echo " "
	echo "You have chosen to view items"
	echo "Type 1 if you want to view all items"
	echo "Type 2 if you want to view a item in a specific position"
	echo "Type 3 if you just want to go back"
elsif $choice