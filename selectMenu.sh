#!/bin/bash

function selectMenu {
select var in "Select All" "Select Column"  "Back To Tables Menu" "Drop Database" "Exit";
do
case $var in 
   "Select All" )
    echo "All" 
    selectAll
      break ;;
    
 "Select Column" )
    echo "Select Column"
    selectColumn
    break ;;
    
    
     "Back To Tables Menu" )
    echo -e "\nTable Menu\n" 
    showTables
    break ;;

     "Back To Main Menu" )
    echo -e "\nMain\n" 
    main
    break ;;

    "Exit" )
    echo "bye"
    exit
    break ;;
    
   *) echo -e "Wrong choice \c" ;;
    esac
    done
    }
