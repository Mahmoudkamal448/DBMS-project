#!/bin/bash
function insert {
  echo -e "Table Name: \c"
  read tableName
  if ! [[ -f $tableName ]]; then
    echo "Table $tableName isn't existed ,choose another Table"
    main
  fi
  colsNum=`awk 'END{print NR}' .$tableName` #number of lines 
  sep="|"     #serator 
  rSep="\n"   #rSerator
  for (( i = 2; i <= $colsNum; i++ )); do
    colName=$(awk 'BEGIN{FS="|"}{ if(NR=='$i') print $1}' .$tableName) 
    colType=$( awk 'BEGIN{FS="|"}{if(NR=='$i') print $2}' .$tableName)
    colKey=$( awk 'BEGIN{FS="|"}{if(NR=='$i') print $3}' .$tableName)
    echo -e "$colName ($colType) = \c"
    read value

    # Validate Input
    if [[ $colType == "int" ]]; then
      while ! [[ $value =~ ^[0-9]*$ ]]; do
        echo -e "invalid valueType !!"
        echo -e "$colName ($colType) = \c"
        read value
      done
    fi

    if [[ $colKey == "PK" ]]; then
      while [[ true ]]; do
        if [[ $value =~ ^[`awk 'BEGIN{FS="|" ; ORS=" "}{if(NR != 1)print $(('$i'-1))}' $tableName`]$ ]]; then
          echo -e "invalid input for Primary Key !!"
        else
          break;
        fi
        echo -e "$colName ($colType) = \c"
        read value
      done
    fi

    #Set row
    if [[ $i == $colsNum ]]; then
      row=$row$value$rSep
    else
      row=$row$value$sep
    fi
  done
  echo -e $row"\c" >> $tableName
  if [[ $? == 0 ]]
  then
    echo "value Inserted Successfully"
  else
    echo "Error Inserting value into Table $tableName"
  fi
  row=""
  main
}

