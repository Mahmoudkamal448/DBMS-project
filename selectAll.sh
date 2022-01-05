function selectAll {
  echo -e "please Enter Table Name: \c"
  read tableName
  echo -e "\n\n"
  column -t -s '|' $tableName 2>>./.error.log
    echo -e "\n\n"
  if [[ $? != 0 ]]
  then
    echo "Error To Show The Table: $tableName"
  fi
  selectMenu
}