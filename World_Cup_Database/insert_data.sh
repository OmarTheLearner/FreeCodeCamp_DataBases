#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

TABLES_EMPTY="$($PSQL "truncate teams, games")"
if [[ $TABLES_EMPTY == "TRUNCATE TABLE" ]]; then
  echo Tables teams and games are both cleared.
else
  echo error while clearing tables
fi

cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  # Enter the Teams into the teams table
  if [[ $YEAR != "year" ]];then
    #enter unique winners
    get_team_id="$($PSQL "select team_id from teams where name='$WINNER'")"
    if [[ -z $get_team_id ]];then
      insert_team="$($PSQL "insert into teams(name) values('$WINNER')")"
      if [[ $insert_team == "INSERT 0 1" ]]; then
        team_id="$($PSQL "select team_id from teams where name='$WINNER'")"
        echo new team inserted: $WINNER, with id: $team_id
        else
      team_id="$($PSQL "select team_id from teams where name='$WINNER'")"
      echo team: $WINNER exists, with id: $team_id
      fi
    fi
    #enter unique opponents
    get_team_id="$($PSQL "select team_id from teams where name='$OPPONENT'")"
    if [[ -z $get_team_id ]];then
      insert_team="$($PSQL "insert into teams(name) values('$OPPONENT')")"
      if [[ $insert_team == "INSERT 0 1" ]]; then
        team_id="$($PSQL "select team_id from teams where name='$OPPONENT'")"
        echo new team inserted: $OPPONENT, with id: $team_id
        else
      team_id="$($PSQL "select team_id from teams where name='$OPPONENT'")"
      echo team: $OPPONENT exists, with id: $team_id
      fi
    fi
  #Enter the game entries into the games table
    WINNER_ID="$($PSQL "select team_id from teams where name='$WINNER'")"
    OPPONENT_ID="$($PSQL "select team_id from teams where name='$OPPONENT'")"
    if [[ -n $WINNER_ID && -n $OPPONENT_ID ]]; then
      insert_game="$($PSQL "INSERT into games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) values($YEAR, '$ROUND', '$WINNER_ID', '$OPPONENT_ID', $WINNER_GOALS, $OPPONENT_GOALS)")"
      if [[ $insert_game == "INSERT 0 1" ]]; then
        GAME_ID="$($PSQL "select game_id from games where year=$YEAR and round='$ROUND'")"
        echo new game inserted: year: $YEAR, $ROUND with id: $GAME_ID.
        else
          echo error entring the game with year: $YEAR, $ROUND
      fi
    else
     echo team id for game not found.
    fi
  fi
done
