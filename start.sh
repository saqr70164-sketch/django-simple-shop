#!/usr/bin/env bash
set -e

# ترحيل قواعد البيانات
echo "Running migrations..."
python manage.py migrate --noinput

# جمع ملفات static
echo "Collecting static files..."
python manage.py collectstatic --noinput

# تشغيل الخادم
echo "Starting Gunicorn..."
exec gunicorn shop_project.wsgi:application --bind 0.0.0.0:8000 --workers 3
