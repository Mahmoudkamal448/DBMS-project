#!/bin/bash

function createTable {
  echo -e "Enter tableName: \c"
  read tableName
  if [[ -f $tableName ]]; then     
    echo "table already existed ,choose another name"
    showTables
  fi
  echo -e "Enter The Number Of Columns \c"
  read colsNum    #to know how much columns will be in our table 
  counter=1       #to calc the iterations 
  separator="|"     #the seprator between every fields 
  rSeparator="\n"      #the seprator to lines or records   
                     
  flagPk=""           #this like flag if we have pk or not

  #header to our meta data
  metaData="Field"$separator"Type"$separator"key"
  while [ $counter -le $colsNum ] 
  do
    echo -e "Name of Column No.$counter: \c"
    read colName
#to define type of column by asking the user
    echo -e "Type of Column $colName: "
    select var in "int" "str"
    do
      case $var in
        int ) colType="int";break;;
        str ) colType="str";break;;
        * ) echo "Wrong Choice" ;;
      esac
    done
    #to define pk    ask the user about pk
    if [[ $flagPk == "" ]]; then
      echo -e "Do You Want To Make a PrimaryKey ? "
      select var in "yes" "no"
      do
        case $var in
          yes ) flagPk="PK";
          metaData+=$rSeparator$colName$separator$colType$separator$flagPk;
          break;;
          no )
          metaData+=$rSeparator$colName$separator$colType$separator""
          break;;
          * ) echo "Wrong Choice" ;;
        esac
      done
    else
      metaData+=$rSeparator$colName$separator$colType$separator"" #store our metadata
    fi
    if [[ $counter == $colsNum ]]; then
      data=$data$colName          #to make the end of the last column does not have separation of the end  
    else
      data=$data$colName$separator   #to store our data for each column in this var 
    fi
    ((counter++))
  done
  touch .$tableName   #make a file for the metadata  
  echo -e $metaData  >> .$tableName  
  touch $tableName
  echo -e $data >> $tableName #make a file for the table  
  if [[ $? == 0 ]]   #To make sure that the file is created
  then
    echo "Table Created Successfully"
    showTables
  else
    echo "Error To Create $tableName Try Again"  
    showTables
  fi
}