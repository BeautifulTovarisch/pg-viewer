#!/bin/bash

set -euo pipefail

# Initialization script for basic dataset.
# Creates non-root database role with restricted privileges
# for use with TUI application.
#

# Load example.sql
psql -v -U postgres -f /docker-entrypoint-initdb.d/sql/example.sql

# Revoke and whitelist privileges
psql -v ON_ERROR_STOP=1 -U postgres --set=db_viewer_pass=${USER_PASSWORD} <<EOSQL
  CREATE USER db_viewer PASSWORD :'db_viewer_pass';
  REVOKE ALL ON ALL TABLES IN SCHEMA public FROM db_viewer;
  GRANT USAGE ON SCHEMA public TO db_viewer;
  GRANT SELECT ON ALL TABLES IN SCHEMA public TO db_viewer;
EOSQL
