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
- **Backend:** Laravel / PHP (REST API).
- **State Management:** Flutter Bloc.
- **Dependency Injection:** GetIt (Service Locator).
- **Localization:** Flutter Intl (دعم كامل للعربية والإنجليزية).

---

## 🚀 تعليمات البدء والتشغيل للفريق (Getting Started)

لكي يعمل المشروع لديك بنظام الـ Git الجديد وبدون أخطاء، يرجى اتباع هذه الخطوات بالترتيب:

### 1) المتطلبات الأساسية (Prerequisites)

- تثبيت **Flutter SDK** (أحدث إصدار مستقر).
- استخدام **VS Code** مع تثبيت إضافات: **Flutter Intl**، **Dart/Flutter**، و **Git Graph**.
- تثبيت **Git** على جهازك.

> **ملاحظة مهمة:** GitHub لم يعد يدعم تسجيل الدخول بكلمة المرور في أوامر Git.  
> استخدم **Personal Access Token (PAT)** بدل الباسورد، أو استخدم **SSH Keys**.

### 2) خطوات الفتح لأول مرة (Initial Setup Steps) ⚙️

1. **تحميل المشروع (Clone):**
    ```bash
    git clone https://github.com/Ahmed-sherif11/tadamon_shop.git
    cd tadamon_shop
    ```

2. **الانتقال لفرع التطوير (Switch to Dev Branch):** ⚠️  
   **هام جداً:** نحن لا نعدل على فرع `main`. يجب الانتقال فوراً لفرع `dev`:
    ```bash
    git checkout dev
    ```

   إذا لم يكن الفرع موجوداً عندك محليًا (وموجود على الريموت):
    ```bash
    git fetch --all
    git checkout -b dev origin/dev
    ```

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

### 1️⃣ قبل البدء (Morning Update)

تأكد أنك على فرع `dev` واسحب آخر تحديثات زملائك:

```bash
git checkout dev
git pull origin dev
```

### 2️⃣ أثناء الشغل (Working)

**الخيار A (سريع وبسيط):** اشتغل على `dev` مباشرة.  
**الخيار B (المفضل والأكثر أمانًا):** اعمل فرع خاص بشغلك:

```bash
git checkout -b feature/<short-name>
```

مثال:

```bash
git checkout -b feature/login-ui
```

> لو اشتغلت على `feature/*`، ارفع الفرع وافتح **Pull Request** إلى `dev`.

### 3️⃣ عند الانتهاء (End of Work)

ارفع شغلك (حسب الطريقة اللي اشتغلت بيها):

#### ✅ لو شغال على `dev` مباشرة
```bash
git add .
git commit -m "وصف واضح للتعديل الذي قمت به"
git push origin dev
```

#### ✅ لو شغال على `feature/*` (المفضل)
```bash
git add .
git commit -m "وصف واضح للتعديل الذي قمت به"
git push origin dev
```
ثم افتح **Pull Request** على GitHub من `feature/<short-name>` إلى `dev`.

---

## 👥 قواعد العمل الجماعي (Team Guidelines)

- **حماية الـ Main:** ممنوع الرفع المباشر على فرع `main`. الدمج يتم فقط عبر مدير المشروع / Pull Requests.
- **مجلد Generated:** ممنوع التعديل يدوياً على ملفات `lib/generated`.
- **إضافة نصوص:** أي نص جديد يُضاف في ملفات `.arb` داخل `lib/l10n/` ثم تشغيل `flutter gen-l10n`.
- **الالتزام بالطبقات:** يمنع كتابة أي منطق API داخل الـ UI؛ مكانه الصحيح هو الـ `Data Sources / Repositories`.
- **حقن التبعيات:** أي كلاس جديد يجب تسجيله في `injection_container.dart` باستخدام **GetIt**.

---

**Tadamon Shop Project - Update: January 2026**
