#!/bin/bash

# Creates additional local users in Postgres so that docker-compose only needs one database instance

#################
## NOTE : This script will *ONLY* be run the first time the "postgres-data/shared" directory is initialised.
##
## If you need it re-run, then delete the "postgres-data/shared" directory.
#################

set -e

# Create databases and users as owner for rails app
psql -v ON_ERROR_STOP=1 <<-EOSQL
    CREATE USER order_user WITH PASSWORD 'order_password';
    ALTER USER order_user CREATEDB CREATEROLE LOGIN;
    CREATE DATABASE order_api WITH OWNER = order_user;
    CREATE DATABASE order_api_test WITH OWNER = order_user;
    GRANT ALL PRIVILEGES ON DATABASE order_api TO order_user;
    GRANT ALL PRIVILEGES ON DATABASE order_api_test TO order_user;

    CREATE USER product_user WITH PASSWORD 'product_password';
    ALTER USER product_user CREATEDB CREATEROLE LOGIN;
    CREATE DATABASE product_api WITH OWNER = product_user;
    CREATE DATABASE product_api_test WITH OWNER = product_user;
    GRANT ALL PRIVILEGES ON DATABASE product_api TO product_user;
    GRANT ALL PRIVILEGES ON DATABASE product_api_test TO product_user;
EOSQL
