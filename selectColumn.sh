function selectColumn {
  echo -e "Enter Table Name: \c"
  read tableName
  echo -e "Enter Column Number: \c"
  read columnName
    echo -e "\n\n"
  awk 'BEGIN{FS="|"}{print $'$columnName'}' $tableName
    echo -e "\n\n"
  selectMenu
}