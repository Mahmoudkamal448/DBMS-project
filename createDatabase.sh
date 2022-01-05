#!/bin/bash
function createDatabase {
  echo -e "Enter Database Name: \c" 
  read dbName    
  mkdir ./DBMS/$dbName   2> /dev/null
  if [[ $? == 0 ]]     
  then
    echo "Database Created Successfully"
    main
  else
    echo "Error Creating Database $dbName"
    main
  fi
} 