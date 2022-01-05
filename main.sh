#!/bin/bash
. ./createDatabase.sh
. ./ConnectToDatabases.sh
. ./listDatabases.sh
. ./dropDatabase.sh

. ./createTable.sh
. ./listTables.sh
. ./dropTable.sh
. ./insert.sh
. ./updateTable.sh

. ./selectMenu.sh
. ./selectAll.sh
. ./selectColumn.sh
. ./deleteFromTable.sh

PS3="Please Enter Your Selection Number : "
echo -e "\n\n -------------------------\n WELCOME TO OUR FIRST PROJECT  \n -------------------------  \n DBMS Engine \n ------------------------- \n CREATED BY :\n Mahmoud Kamal Said AND Mohamed Ibrahim Elgarhy\n -------------------------\n Open Source Cloud \n Intake 42\n -------------------------\n"
function main {

select var in "Create Database" "Connect To Databases" "List Databases" "Drop Database" "Exit";
do
case $var in 
   "Create Database")
    echo "create Datbase" 
    createDatabase
      break ;;
    
  "Connect To Databases" )
    echo "Connect To Databases" 
    ConnectToDatabases
    break ;;
    
    
     "List Databases" )
    echo "Your Databases" 
    listDatabases
    break ;;

     "Drop Database" )
    echo "Drop Database" 
    DropDatabase
    break ;;

    "Exit" )
    echo "bye"
    exit
    break ;;
    
   *) echo -e "Wrong choice \c" ;;
    esac
    done
    }
    main