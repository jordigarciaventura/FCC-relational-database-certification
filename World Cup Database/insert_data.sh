#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Get team_id (by name) from existing team or from new one if it not exists in teams table
function getTeamId() {
  TEAM_NAME=$1
  TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$TEAM_NAME'")
  if [[ -z $TEAM_ID ]]
  then
    OUTPUT=$($PSQL "INSERT INTO teams(name) VALUES('$TEAM_NAME')")
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$TEAM_NAME'")
  fi
  echo $TEAM_ID
}

tail -n +2 games.csv | while IFS=',' read -r YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  WINNER_ID=$(getTeamId "$WINNER")
  OPPONENT_ID=$(getTeamId "$OPPONENT")

  echo $WINNER_ID $OPPONENT_ID

  # Add game row
  $PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)"
done