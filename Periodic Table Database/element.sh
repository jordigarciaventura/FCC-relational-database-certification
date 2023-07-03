#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ $# -eq 0 ]]; then
  echo "Please provide an element as an argument."
elif [[ $# -eq 1 ]]; then
  if [[ $1 =~ [0-9]+ ]]; then
    ELEMENT=$($PSQL "SELECT * FROM elements WHERE atomic_number = $1")
  else
    ELEMENT=$($PSQL "SELECT * FROM elements WHERE symbol = '$1' OR name = '$1'")
  fi

  if [[ ! -z $ELEMENT ]]; then
    echo $ELEMENT | while IFS='|' read ATOMIC_NUMBER SYMBOL NAME
    do
      PROPERTY=$($PSQL "SELECT * FROM properties LEFT JOIN types USING(type_id) WHERE atomic_number = '$ATOMIC_NUMBER'")
      echo $PROPERTY | while IFS='|' read TYPE_ID ATOMIC_NUMBER ATOMIC_MASS MELTING_POINT_CELSIUS BOILING_POINT_CELSIUS TYPE
      do
        echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."   
      done
    done
  else
    echo "I could not find that element in the database."
  fi
fi