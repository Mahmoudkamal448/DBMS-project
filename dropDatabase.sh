#!/bin/bash
function DropDatabase {
  echo "enter the name of DataBase do you want to Drop it " 
  read dbName
  rm -r  ./DBMS/$dbName    
  if [[ $? == 0 ]]
  then
    echo "Database Droped Successfully"
    main  
  else
    echo "Database $dbName not found"
    main
  fi 
}