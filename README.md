# 🛰️ MikroTik Check-Host Router

**تصنيف وتوجيه (Policy-Routing) لكل مواقع كشف الـ IP / ISP / الموقع الجغرافي / تسريب البيانات / فحص السرعة على راوتر MikroTik — عبر Layer7 (بصمة SNI) + قائمة عناوين ضخمة (~390 موقع) تُحدِّث نفسها تلقائياً.**

> Classify & policy-route every IP / ISP / geolocation / leak / speed-test website on MikroTik using a Layer7 (TLS SNI) signature plus a large self-updating address-list (~390 domains).

> RouterOS 7 · Layer7 · Policy-Based Routing · ~390 domains · MIT License

---

<div dir="rtl">

## 📖 نظرة عامة

هذا المشروع مجموعة سكربتات `.rsc` جاهزة للاستيراد على **MikroTik RouterOS**، تقوم بـ:

- 🔎 **التعرّف** على أكثر من **390 موقعاً** لكشف الـ IP والـ ISP والموقع الجغرافي وفحص السرعة (مثل `speedtest.net`, `fast.com`, `wifiman`, `ipinfo.io`, `whoer.net` ...).
- 🧠 استخدام **Layer7 (بصمة SNI)** بكلمات مفتاحية ليمسك حتى المواقع **غير المدرجة** بالقائمة — تغطية عملياً لا نهائية تشمل المواقع الجديدة مستقبلاً.
- 🧭 **توجيه** هذا الترافيك عبر خط إنترنت محدّد (مثلاً الخط المحلي / IQ) باستخدام Policy-Based Routing.
- 🔁 **بناء القائمة تلقائياً** من ترافيك المستخدمين الحقيقي (`add-dst-to-address-list`).
- 🔒 **حظر** الوصول إلى صفحات إعدادات المودم/الراوتر (`192.168.100.1` و `192.168.1.1`).

## ✨ المميزات

| | |
|---|---|
| 🌐 قائمة ضخمة | ~390 دومين حقيقي، منظّم ونظيف |
| 🧠 Layer7 ذكي | كلمات مفتاحية = يغطي المواقع الجديدة بلا تحديث |
| 🔁 تعلّم تلقائي | القائمة تكبر من الترافيك الفعلي |
| 🧭 توجيه مرن | Policy Routing عبر خط مخصّص (RouterOS 7) |
| 🔒 حماية البوابات | حظر صفحات إدارة المودم/الراوتر |
| 🧩 ملفات منفصلة | استيراد كامل أو جزئي |

## 📋 المتطلبات

- **MikroTik RouterOS v7** (لأجل التوجيه). الـ Layer7 والقائمة يعملان على v6 أيضاً.
- خط إنترنت ثانٍ (WAN) مع **IP بوابة (gateway)** معروف — لأجل التوجيه.
- خدمة DNS مفعّلة على الراوتر (`/ip dns`) حتى تتحوّل الدومينات إلى IP.

## 📁 محتويات المشروع
متغيرة كل فترة

## ⚙️ الإعداد (مهم قبل الاستيراد)

افتح `route.rsc` و `full-setup.rsc` وبدّل عنوان البوابة:
## 🚀 طريقة الاستخدام

### الطريقة 1 — رفع الملفات للراوتر (موصى بها)
1. في Winbox افتح **Files** واسحب ملفات `.rsc` كلها.
2. افتح **New Terminal** 
### الطريقة 3 — نسخ ولصق
افتح أي ملف، انسخ محتواه، والصقه في **New Terminal**.

> 💡 ملاحظة: داخل ملفات `.rsc` نستخدم `\\.` (شرطتين). إذا أدخلت الـ regex يدوياً في حقل Winbox اكتب `\.` (شرطة واحدة).

## 🔍 كيف يعمل

```
المستخدم يفتح موقع كشف/سرعة
        │
        ▼
[Layer7] يقرأ اسم الموقع من SNI  ──►  يضيف IP إلى قائمة "Check-Host"
        │
        ▼
[Mangle] يوسم الاتصال  ──►  routing-mark = via-IQ
        │
        ▼
[Route]  يرسل الترافيك عبر خط IQ
        │
        ▼
[NAT]    masquerade على خط IQ
```
وبشكل منفصل: **[Filter]** يحظر صفحات إدارة `192.168.100.1` و `192.168.1.1`.

## ✅ التحقق من العمل

- **IP → Firewall → Address Lists**: راقب قائمة `Check-Host` تمتلئ بالـ IPات.
- **IP → Routes**: عدّاد المسار `via-IQ` يزداد.
- **IP → Firewall → Mangle**: عدّادات القواعد (Packets/Bytes) تتحرّك.

## 🩺 حل المشاكل

| المشكلة | الحل |
|--------|------|
| CPU مرتفع | Layer7 ثقيل؛ قسّمه على عدة قواعد أو اعتمد على القائمة فقط |
| لا يوجد توجيه | تأكد أن `gateway` صحيح، وأن DNS يعمل، والإصدار v7 |
| موقع يتجاوز الفحص | المتصفح يستخدم QUIC (UDP/443)؛ اقفل UDP/443 لإجباره على TLS/TCP |
| أول اتصال يتسرّب | طبيعي — يُوجَّه ابتداءً من الاتصال الثاني بعد تعلّم الـ IP |

## ⚠️ ملاحظات وتحذيرات

- بعض المواقع على **Cloudflare/CDN** تتشارك نفس الـ IP مع مواقع كثيرة؛ التوجيه بالـ IP قد يؤثر عليها — لذلك **Layer7 (SNI) أدق** لأنه يفرّق بالاسم.
- سيرفرات قياس السرعة (**Ookla / m-lab**) أسماؤها متغيّرة؛ القائمة الثابتة لا تمسكها كلها، لكن **Layer7 يمسكها**.
- **STUN** يعمل على **UDP 3478**؛ يحتاج قاعدة منفصلة لو أردت توجيهه.
- استخدم هذا المشروع على **شبكتك الخاصة** فقط ولأغراض **إدارة الشبكة وهندسة الترافيك المشروعة**.

</div>

---

## 🇬🇧 English

### Overview
Ready-to-import MikroTik RouterOS `.rsc` scripts that:
- Detect **390+** IP / ISP / geolocation / leak / speed-test websites.
- Use **Layer7 (TLS SNI)** keyword matching to also catch sites **not** in the list (future-proof, effectively unlimited).
- **Policy-route** that traffic through a chosen WAN uplink (RouterOS 7).
- **Auto-grow** the address-list from real user traffic.
- **Block** access to gateway/modem admin pages.

### Requirements
- **RouterOS v7** for the routing part (Layer7 + list also work on v6).
- A second WAN uplink with a known **gateway IP**.
- DNS enabled on the router (`/ip dns`).

### How it works
Layer7 reads the SNI → the IP is added to the `Check-Host` address-list → mangle marks the connection with routing-mark `via-IQ` → it is routed via the chosen uplink → masqueraded. Gateway admin pages are blocked separately by the filter rules.
### Notes
- CDN-hosted sites share IPs — Layer7 (SNI) is more precise than IP-based routing.
- Ookla/m-lab speed-test servers use dynamic hostnames — Layer7 catches them, the static list can't.
- STUN uses UDP 3478 — add a separate rule if you need it.

### Disclaimer
Intended for networks you **own or administer**, for legitimate traffic-engineering and network-management purposes only.

### License
[MIT](LICENSE)
