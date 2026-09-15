# Django Simple Shop

مشروع تجريبي لمتجر إلكتروني بسيط مبني بـ Django.

التشغيل محلياً:

1. أنشئ بيئة افتراضية:
   python -m venv .venv
   source .venv/bin/activate  # أو .venv\Scripts\activate على ويندوز

2. ثبّت المتطلبات:
   pip install -r requirements.txt

3. شغّل الترحيلات وقم بإنشاء ملف قاعدة البيانات:
   python manage.py migrate

4. أنشئ مستخدماً للوصول إلى لوحة الإدارة (اختياري):
   python manage.py createsuperuser

5. شغّل الخادم:
   python manage.py runserver

إعدادات مهمة:
- ملفات الوسائط تُحفظ محلياً في مجلد media/.
- الواجهة عربية مع اتجاه RTL.

محتوى المشروع:
- app: shop
- نماذج: Product
- لوحة إدارة: Django Admin
- سلة مشتريات تعتمد على الجلسة
