# 🛍️ Tadamon Shop - Multi-Vendor E-commerce Platform

مشروع **تضامن (Tadamon)** هو منصة تجارة إلكترونية متكاملة تربط بين الموردين والعملاء في بيئة برمجية احترافية. تم بناء النظام باستخدام **Flutter** لتطبيقات الجوال و **Laravel/PHP** للخلفية البرمجية ولوحة التحكم.

---

## 🏗️ هيكلة المشروع (Architecture)

يتبع التطبيق معايير **Clean Architecture** لضمان فصل المسؤوليات وتسهيل العمل الجماعي:

- **Core Layer:** تحتوي على الأدوات المشتركة، معالجة الأخطاء، وإعدادات الثيمات.
- **Domain Layer:** القلب النابض للمشروع، ويحتوي على الـ Entities و الـ Repositories والـ Use Cases.
- **Data Layer:** المسؤولة عن جلب البيانات من **Laravel API** وتحويلها إلى Models برمجية.
- **Presentation Layer:** تشمل واجهات المستخدم (Screens & Widgets) وإدارة الحالة باستخدام **Bloc**.

---

## 🛠️ التقنيات المستخدمة (Tech Stack)

- **Frontend:** Flutter (Mobile, Tablet, Desktop).
- **State Management:** Flutter Bloc.
- **Dependency Injection:** GetIt (Service Locator).
- **Localization:** Flutter Intl (دعم كامل للعربية والإنجليزية).

---

## 🚀 تعليمات البدء والتشغيل للفريق (Getting Started)

لكي يعمل المشروع لديك بنظام الـ Git الجديد وبدون أخطاء، يرجى اتباع هذه الخطوات بالترتيب:

### 1. المتطلبات الأساسية (Prerequisites)
- تثبيت **Flutter SDK** (أحدث إصدار مستقر).
- استخدام **VS Code** مع تثبيت إضافات: **Flutter Intl**، **Dart/Flutter**، و **Git Graph**.

### 2. خطوات الفتح لأول مرة (Initial Setup Steps) ⚙️

1. **تحميل المشروع (Clone):**
    ```bash
    git clone [https://github.com/Ahmed-sherif11/tadamon_shop.git](https://github.com/Ahmed-sherif11/tadamon_shop.git)
    cd tadamon_shop
    ```

2. **الانتقال لفرع التطوير (Switch to Dev Branch):** ⚠️
    **هام جداً:** نحن لا نعدل على فرع `main`. يجب الانتقال فوراً لفرع `dev`:
    ```bash
    git checkout dev
    ```
    *إذا لم يكن الفرع موجوداً عندك، استخدم:* `git checkout -b dev origin/dev`

3. **تحميل المكتبات البرمجية:**
    ```bash
    flutter pub get
    ```

4. **توليد ملفات اللغة والترجمة (Localization):**
    ```bash
    flutter gen-l10n
    ```

5. **تشغيل التطبيق:**
    ```bash
    flutter run
    ```

---

## 🔄 روتين العمل اليومي الآمن (Safe Workflow)

لضمان عدم حدوث تضارب في الأكواد، اتبع هذا التسلسل يومياً:

### 1️⃣ قبل البدء (Morning Update):
تأكد أنك على فرع `dev` واسحب آخر تحديثات زملائك:
```bash
git pull origin dev
 ```


2️⃣ عند الانتهاء (End of Work):
ارفع شغلك لفرع dev فقط:

```bash
git add .
git commit -m "وصف واضح للتعديل الذي قمت به"
git push origin dev
 ```



👥 قواعد العمل الجماعي (Team Guidelines)
حماية الـ Main: ممنوع الرفع المباشر على فرع main. الدمج يتم فقط عبر مدير المشروع.

مجلد Generated: ممنوع التعديل يدوياً على ملفات lib/generated.

إضافة نصوص: النصوص تضاف في ملفات الـ .arb داخل مجلد l10n.

حقن التبعيات: أي كلاس جديد يجب تسجيله في injection_container.dart باستخدام GetIt.

Tadamon Shop Project - Update: January 2026
