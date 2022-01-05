#!/bin/bash
function ConnectToDatabases {
  echo "enter the name of datebase"     
  read dbName 
  cd ./DBMS/$dbName   2> /dev/null
  if [[ $? == 0 ]]
  then
    echo "Database opened Successfully"
    showTables
  else
  echo -e "----------------\n"
    echo "Database $dbName not found" 
  echo -e "\n try again \n----------------"
    main
  fi
  
}
#menu for tables 
function showTables {
  select var in "Create Table" "List Tables" "Drop Table"  "insert Into" "Ubdate Table" "delete from table" "select" "Exit";
do
case $var in 
   "Create Table")
    echo "create Table" 
    createTable
      break ;;
    
  "List Tables" )
    echo "List Tables" 
    listTables
    break ;;
    
    
     "Drop Table" )
    echo "Drop Table" 
    dropTable
    break ;;

     "insert Into" )
    echo "insert Into" 
    insert
    break ;;

    "Ubdate Table" )
    echo "update:"
    updateTable
    break ;;

    "delete from table" )
    echo "Delete from Spacefic table:"
    deleteFromTable
    break ;;


    "select" )
    echo "Select Menu"
    selectMenu
    break ;; 

    "Exit" )
    echo "bye"
    exit
    break ;;

    
    
    
   *) echo -e "Wrong choice \c" ;;
    esac
    done
}