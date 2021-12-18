#!/bin/sh

set -o errexit
set -o nounset

# We need this line to make sure that this container is started
# after the one with postgres:
if [ "$DATABASE" = "postgres" ]
then
    echo "Waiting for postgres..."

    while ! nc -z $POSTGRES_HOST $POSTGRES_PORT; do
      sleep 0.1
    done

    echo "PostgreSQL started"
fi

echo "Migrating database..."
python /code/manage.py migrate --run-syncdb
# python manage.py shell
# from django.contrib.contenttypes.models import ContentType
# ContentType.objects.all().delete()
# quit()
python manage.py loaddata datadump.json

# echo "Collect static files..."
# python /code/manage.py collectstatic --noinput

cd /code
python manage.py runserver 0.0.0.0:8000
