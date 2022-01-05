#!/bin/bash
function deleteFromTable {
  echo -e "Enter Table Name: \c"
  read tableName
  echo -e "Enter Condition Column name: \c"
  read field
  fid=$(awk 'BEGIN{FS="|"}{if(NR==1){for(i=1;i<=NF;i++){if($i=="'$field'") print i}}}' $tableName)
  if [[ $fid == "" ]]
  then
    echo "Not Found"
    showTables
  else
    echo -e "Enter Condition Value: \c"
    read val
    res=$(awk 'BEGIN{FS="|"}{if ($'$fid'=="'$val'") print $'$fid'}' $tableName 2>>./.error.log)
    if [[ $res == "" ]]
    then
      echo "Value Not Found"
      showTables
    else
      NR=$(awk 'BEGIN{FS="|"}{if ($'$fid'=="'$val'") print NR}' $tableName 2>>./.error.log)
      sed -i ''$NR'd' $tableName 2>>./.error.log
      echo "Row Deleted Successfully"
      showTables
    fi
  fi
}
