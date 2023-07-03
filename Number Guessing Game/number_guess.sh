#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

LIMIT=1000
RND_NUMBER=$((1 + $RANDOM % $LIMIT))

read_guess () {
  read GUESS
  until [[ $GUESS =~ ^[0-9]+$ ]]
  do
    echo "That is not an integer, guess again:"
    read GUESS
  done
}

echo "Enter your username:"
read USERNAME

USER=$($PSQL "SELECT * FROM users WHERE username='$USERNAME'")
if [[ -z $USER ]]; then
  ADD_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  if [[ $? -ne 0 ]]; then exit 1; fi
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
  USER=$($PSQL "SELECT * FROM users WHERE username='$USERNAME'")
else
  echo $USER | while IFS='|' read USERNAME GAMES_PLAYED BEST_GAME
  do
    echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  done
fi

echo -e "\nGuess the secret number between 1 and 1000:"
read_guess

GUESSES_COUNT=1
until [[ GUESS -eq RND_NUMBER ]] 
do
  (( GUESSES_COUNT++ ))
  if [[ GUESS -lt RND_NUMBER ]]; then
    echo "It's higher than that, guess again:"
  else
    echo "It's lower than that, guess again:"
  fi
  read_guess
done

UPDATE_GAMES_PLAYED_RESULT=$($PSQL "UPDATE users SET games_played = games_played + 1 WHERE username='$USERNAME'")

if [[ -z $BEST_GAME || $GUESSES_COUNT -lt $BEST_GAME ]]; then
  UPDATE_BEST_GAME_RESULT=$($PSQL "UPDATE users SET best_game = $GUESSES_COUNT WHERE username='$USERNAME'")
fi

echo "You guessed it in $GUESSES_COUNT tries. The secret number was $RND_NUMBER. Nice job!"
