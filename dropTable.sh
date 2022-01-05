#!/bin/bash
function dropTable {
   # echo "enter name of database"
  # read dbName
  echo -e "enter the name of table do you want to Drop it \c"
    read tableName
     rm $tableName .$tableName 2>>./.error.log
    if [[ $? == 0 ]]
    then 
    showTables
    echo "table Droped successfully"
    else 
    showTables
    echo "not found"
    fi
}