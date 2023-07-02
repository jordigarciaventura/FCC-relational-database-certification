#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=salon --no-align --tuples-only -c"
SERVICES=$($PSQL "SELECT * FROM services")

echo -e "\n ~~~~~ MY SALON ~~~~~\n"

echo -e "Welcome to My Salon, how can I help you?\n"

service_selection () {
  echo "$SERVICES" | while IFS='|' read PARSED_SERVICE_ID PARSED_NAME
  do
    echo "$PARSED_SERVICE_ID) $PARSED_NAME"
  done

  read SERVICE_ID_SELECTED
  SERVICE=$($PSQL "SELECT * FROM services WHERE service_id=$SERVICE_ID_SELECTED")
  
  if [[ -z $SERVICE ]]; then
    echo -e "\nI could not find that service. What would you like today?"
    service_selection
  fi
}

customer_identification () {
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

  # if new customer -> add new customer
  if [[ -z $CUSTOMER_ID ]]; then
    # get required fields
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    # add to table
    CUSTOMER_CREATION=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
    # set customer_id
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  fi
}

appointment_creation () {
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE customer_id='$CUSTOMER_ID'")
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")

  echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
  read SERVICE_TIME

  # add to table
  APPOINTMENT_CREATION=$($PSQL "INSERT INTO appointments(customer_id, time, service_id) VALUES($CUSTOMER_ID, '$SERVICE_TIME', $SERVICE_ID_SELECTED)")

  echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME.\n"
}

service_selection
customer_identification
appointment_creation

