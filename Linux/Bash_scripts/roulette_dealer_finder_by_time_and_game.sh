#/bin bash

# Use this script to determine which dealer was running specified game and specified time. 

# Script Begins

##############################################################################################

clear
echo
read -p "Enter the Date [MMDD] : " date
read -p "Enter the Time [HH:MM:SS AM/PM] : " fulltime
read -p "Enter Game Number (1-BlackJack, 2-Roulette, 3-Texas Hold Em): " gamenum
echo
echo
echo -n "[Date:" $date
grep -i "$fulltime" "$date"_Dealer_schedule |
case "$gamenum" in
        "1") awk '{print " Time: " $1, $2 "] BlackJack Dealer: "$3, $4}'
        ;;
        "2") awk '{print " Time: " $1, $2 "] Roulette Dealer: "$5, $6}'
        ;;
        "3") awk '{print " Time: " $1, $2 "] Texas Hold Em Dealer: "$7, $8}'
        ;;
esac
echo
