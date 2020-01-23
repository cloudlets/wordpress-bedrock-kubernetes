#!/bin/bash

# Create .env file
echo -e 'DB_NAME='"$DB_NAME"'\n'\
'DB_HOST='"$DB_HOST"'\n'\
'DB_USER='"$DB_USER"'\n'\
'DB_PASSWORD='"$DB_PASSWORD"'\n'\
'DB_PREFIX='"$DB_PREFIX"'\n'\
'WP_ENV='"$WP_ENV"'\n'\
'WP_HOME='"$WP_HOME"'\n'\
'WP_SITEURL='"$WP_SITEURL"'\n'\
'AUTH_KEY='"$AUTH_KEY"'\n'\
'SECURE_AUTH_KEY='"$SECURE_AUTH_KEY"'\n'\
'LOGGED_IN_KEY='"$LOGGED_IN_KEY"'\n'\
'NONCE_KEY='"$NONCE_KEY"'\n'\
'AUTH_SALT='"$AUTH_SALT"'\n'\
'SECURE_AUTH_SALT='"$SECURE_AUTH_SALT"'\n'\
'LOGGED_IN_SALT='"$LOGGED_IN_SALT"'\n'\
'NONCE_SALT='"$NONCE_SALT"'\n' > /var/www/html/.env
exec "$@"
