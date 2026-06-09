# 🛰️ MikroTik Toolkit — Check-Host & Network Control

**مجموعة سكربتات MikroTik RouterOS منظّمة بمجلدات: توجيه/كشف مواقع الـ IP / ISP / فحص السرعة، حظر منافذ، حظر واتساب، حظر Starlink، وقواعد RAW.**

> A modular MikroTik RouterOS toolkit: detect & policy-route IP / ISP / speed-test sites, block ports, block WhatsApp, block Starlink, and RAW firewall rules.

> 🚧 **المشروع في تطوّر مستمر** — تُضاف ملفات ومجلدات بشكل دوري / Continuously evolving.

---

<div dir="rtl">

## 📁 هيكل المشروع

```
.
├── BLOCK/
│   └── BLOCK-PORT            # حظر منافذ (ports) معيّنة
├── CHECK-HOST/
│   ├── Layer7.rsc            # بصمة Layer7 لمواقع كشف IP/ISP/سرعة (SNI)
│   ├── CHECK-HOST.rsc        # قائمة عناوين ~390 موقع (address-list)
│   └── BLOCK-IP(STARLINK)    # حظر نطاقات IP الخاصة بـ Starlink
├── PORT/
│   └── watsapp-not           # حظر مكالمات/خدمة واتساب
├── RAW/
│   └── RAW.rsc               # قواعد RAW بالجدار الناري (قبل connection-tracking)
└── README.md
```

| المجلد / الملف | الوظيفة | يُستخدم مع |
|---|---|---|
| `CHECK-HOST/Layer7.rsc` | يتعرّف على مواقع الكشف/السرعة من اسم الموقع (SNI) | كود الـ Mangle بالأسفل |
| `CHECK-HOST/CHECK-HOST.rsc` | قائمة ثابتة ~390 دومين | Filter للحظر أو Mangle للتوجيه |
| `CHECK-HOST/BLOCK-IP(STARLINK)` | حظر/معالجة عناوين Starlink | Filter / Address-list |
| `BLOCK/BLOCK-PORT` | حظر منافذ محددة | Filter (forward) |
| `PORT/watsapp-not` |  واتساب (منافذ/عناوين) | Filter / Address-list |
| `RAW/RAW.rsc` | قواعد RAW الاستخراج التلقائي | Firewall RAW |

> 💡 **ملاحظة استيراد:** أمر `/import` يحتاج امتداد `.rsc`. الملفات بدون امتداد (مثل `BLOCK-PORT` و `watsapp-not`) إمّا تعيد تسميتها بـ `.rsc` أو تنسخ محتواها وتلصقه في الـ Terminal.

---

## 📦 الوحدة الأساسية: CHECK-HOST

### المكوّنات
- **`Layer7.rsc`** → بصمة `regexp` تمسك كل مواقع كشف الـ IP/ISP وفحص السرعة من الـ SNI (محمّلة باسم `speedtest`).
- **`CHECK-HOST.rsc`** → قائمة عناوين ثابتة (`Check-Host`) فيها ~390 دومين.
- **`BLOCK-IP(STARLINK)`** → حظر نطاقات Starlink.

### 🔁 كود التوجيه (Mangle) — انسخه مباشرة

> **متى يُستخدم؟** بعد استيراد `Layer7.rsc`. وظيفته: **توجيه** ترافيك مواقع الكشف/السرعة عبر الخط العراقي (IQ) بدل الخط الافتراضي.

```
/ip firewall mangle
# (أ) Layer7 يتعلّم IPات مواقع السرعة ويحطها بقائمة
add chain=prerouting protocol=tcp dst-port=80,443 layer7-protocol=speedtest \
    connection-mark=no-mark action=add-dst-to-address-list \
    address-list=Speedtest-IPs address-list-timeout=1d comment="Learn speedtest IPs"

# (ب) أي اتصال رايح لهذي الـ IPات نوسمه
add chain=prerouting dst-address-list=Speedtest-IPs connection-mark=no-mark \
    action=mark-connection new-connection-mark=speedtest-conn passthrough=yes

# (ج) الاتصال الموسوم نوجّهه عبر الخط العراقي
add chain=prerouting connection-mark=speedtest-conn \
    action=mark-routing new-routing-mark=via-IQ passthrough=no
```

### 🔗 يعتمد على (لازم تكون موجودة وإلا ما يشتغل)

| المتطلب | الكود |
|---|---|
| **Layer7** باسم `speedtest` | من ملف `CHECK-HOST/Layer7.rsc` |
| **قائمة** `Speedtest-IPs` | تُنشأ تلقائياً من القاعدة (أ) |
| **جدول التوجيه + المسار** | شوف الكود تحت — **بدّل gateway** |
| **NAT** | شوف الكود تحت |

```
# جدول التوجيه + المسار (RouterOS 7) — بدّل 10.10.10.1 بـ gateway خطك العراقي

> 💡 **لتوحيد القائمة الثابتة مع المتعلّمة:** بدّل `Speedtest-IPs` بـ `Check-Host` في القاعدتين (أ) و(ب)، حتى تُوجَّه الـ 390 موقع الثابتة أيضاً (مو بس المتعلّمة).
>
> 🧱 **للحظر بدل التوجيه:** بدّل القاعدة (ج) بقاعدة Filter:
> `/ip firewall filter add chain=forward dst-address-list=Speedtest-IPs action=drop`

---

## 🧩 باقي الوحدات (بتطوّر مستمر)

- **BLOCK / BLOCK-PORT** — قواعد Filter لحظر منافذ معيّنة (forward chain).
- **PORT / watsapp-not** — حظر واتساب عبر منافذه/عناوينه.
- **RAW / RAW.rsc** — قواعد RAW (تنفّذ قبل connection-tracking، مفيدة للأداء والحماية).
- **CHECK-HOST / BLOCK-IP(STARLINK)** — قائمة/قواعد لحظر نطاقات Starlink.

---

## ⚙️ الإعداد قبل الاستيراد

1. **بدّل عنوان البوابة** `gateway=10.10.10.1` بـ IP بوابة خطك العراقي (Winbox → IP → Routes).
2. تأكد **DNS مفعّل** على الراوتر (`/ip dns`) حتى تتحوّل دومينات القائمة إلى IP.
3. **RouterOS v7** مطلوب لجزء التوجيه (الباقي يعمل على v6 أيضاً).

## 🚀 طريقة الاستخدام

1. Winbox → **Files** → ارفع الملفات (وأعطها امتداد `.rsc`).
2. **New Terminal** ونفّذ بالترتيب:
```
/import file-name=Layer7.rsc
/import file-name=CHECK-HOST.rsc
```
3. الصق كود **Mangle + Route + NAT** من فوق (بعد تعديل الـ gateway).
4. استورد باقي الوحدات حسب حاجتك (BLOCK-PORT، watsapp-not، RAW.rsc، STARLINK).

> أو ببساطة: افتح أي ملف، انسخ محتواه، والصقه في الـ Terminal.

## 🔍 كيف يعمل (وحدة CHECK-HOST)

```
المستخدم يفتح موقع كشف/سرعة
        │
        ▼
[Layer7=speedtest] يقرأ SNI ──► يضيف IP إلى قائمة Speedtest-IPs
        │
        ▼
[Mangle] يوسم الاتصال ──► routing-mark = via-IQ
        │
        ▼
[Route] يطلّع الترافيك من الخط العراقي  ──►  [NAT] masquerade
```

## ✅ التحقق

- **IP → Firewall → Address Lists** → قائمة `Speedtest-IPs` تمتلئ.
- **IP → Routes** → عدّاد `via-IQ` يزيد.
- **IP → Firewall → Mangle** → العدّادات تتحرّك.

## ⚠️ ملاحظات

- داخل ملفات `.rsc` / الـ Terminal اكتب النقطة `\\.` (شرطتين)؛ في حقل Winbox الرسومي `\.` (شرطة وحدة).
- تأكد اسم Layer7 (`speedtest`) **يطابق** اللي بالـ Mangle.
- مواقع Cloudflare/CDN تشترك بالـ IP — التوجيه بالـ IP قد يؤثر على مواقع أخرى.

</div>

---

## 🇬🇧 English (summary)

Modular MikroTik RouterOS toolkit (🚧 evolving):

| Folder/File | Purpose |
|---|---|
| `CHECK-HOST/Layer7.rsc` | Layer7 SNI signature for IP/ISP/speed sites (named `speedtest`) |
| `CHECK-HOST/CHECK-HOST.rsc` | Static address-list (~390 domains) |
| `CHECK-HOST/BLOCK-IP(STARLINK)` | Block Starlink IP ranges |
| `BLOCK/BLOCK-PORT` |  specific ports |
| `PORT/watsapp-not` |  WhatsApp |
| `RAW/RAW.rsc` | RAW firewall rules |

**Mangle (policy-route detected traffic via the IQ uplink) — used together with `Layer7.rsc` (`speedtest`), a `via-IQ` routing table/route, and a masquerade NAT rule.** See the Mangle block above. Requires RouterOS 7 for routing; replace the gateway IP before importing.

> `.rsc` extension is required for `/import`; rename extensionless files or paste their content into the Terminal.

### Disclaimer
For networks you own or administer, for legitimate network-management and traffic-engineering purposes only.

### License
[MIT](LICENSE)
