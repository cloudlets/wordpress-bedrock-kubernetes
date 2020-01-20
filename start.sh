    # Create .env file
    echo -e 'DB_NAME='"$DB_NAME"'\n'\
'DB_HOST='"$DB_HOST"'\n'\
'DB_USER='"$DB_USER"'\n'\
'DB_PASSWORD='"$DB_PASSWORD"'\n'\

# Optionally, you can use a data source name (DSN)
# When using a DSN, you can remove the DB_NAME, DB_USER, DB_PASSWORD, and DB_HOST variables
# DATABASE_URL=mysql://database_user:database_password@database_host:database_port/database_name

# Optional variables
# DB_HOST=localhost
# DB_PREFIX=wp_

'WP_ENV='"$WP_ENV"'\n'\
'WP_HOME='"$WP_HOME"'\n'\
'WP_SITEURL='"$WP_SITEURL"'\n'\

# Generate your keys here: https://roots.io/salts.html
'AUTH_KEY='"$AUTH_KEY"'\n'\
'SECURE_AUTH_KEY='"$SECURE_AUTH_KEY"'\n'\
'LOGGED_IN_KEY='"$LOGGED_IN_KEY"'\n'\
'NONCE_KEY='"$NONCE_KEY"'\n'\
'AUTH_SALT='"$AUTH_SALT"'\n'\
'SECURE_AUTH_SALT='"$SECURE_AUTH_SALT"'\n'\
'LOGGED_IN_SALT='"$LOGGED_IN_SALT"'\n'\
'NONCE_SALT='"$NONCE_SALT"'\n'
    > .env
exec "$@"
