#!/bin/sh

until cd /app/backend
do
    echo "Waiting for mysiteback volume..."
done

until ./manage.py migrate
do
    echo "Waiting for db to be ready..."
    sleep 2
done

./manage.py collectstatic --noinput

gunicorn mysiteback.wsgi --bind 0.0.0.0:8000 --workers 4 --threads 4

#####################################################################################
# Options to DEBUG Django mysiteback
# Optional commands to replace abouve gunicorn command

# Option 1:
# run gunicorn with debug log level
# gunicorn mysiteback.wsgi --bind 0.0.0.0:8000 --workers 1 --threads 1 --log-level debug

# Option 2:
# run development mysiteback
# DEBUG=True ./manage.py run mysiteback 0.0.0.0:8000