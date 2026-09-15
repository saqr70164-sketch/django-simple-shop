FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
WORKDIR /app

# تثبيت تبعيات النظام اللازمة (Pillow, psycopg2)
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       build-essential libjpeg-dev zlib1g-dev libpq-dev curl \
    && rm -rf /var/lib/apt/lists/*

# انسخ متطلبات وثبتها
COPY requirements.txt /app/
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# انسخ المشروع
COPY . /app

# اجعل سكربت التشغيل قابلاً للتنفيذ
RUN chmod +x ./start.sh

EXPOSE 8000

# افتراضي: استدعاء سكربت بدء التشغيل الذي يقوم بالترحيلات وجونّي/ستارت
CMD ["./start.sh"]
