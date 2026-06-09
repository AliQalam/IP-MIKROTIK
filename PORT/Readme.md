# 🔌 PORTS — مرجع منافذ الألعاب والتطبيقات

مرجع منظّم لمنافذ أشهر الألعاب والتطبيقات (TCP / UDP) + طريقة استخدامها في MikroTik.
🚧 بتطوّر مستمر — تُضاف ألعاب وتطبيقات باستمرار.

## 📁 الملفات
| الملف | المحتوى |
|------|---------|
| [`GAMES.md`](GAMES.md) | منافذ الألعاب (PC / Console / Mobile) |
| [`APPS.md`](APPS.md) | منافذ التطبيقات (مراسلة / بث / VPN / أدوات) |

---

## ⚙️ كيف تستخدم المنافذ في MikroTik

### 🧱 1) حظر لعبة/تطبيق (Filter)
TCP و UDP **قاعدتين منفصلتين**:
```
/ip firewall filter
add chain=forward protocol=udp dst-port=50000-65535 action=drop comment="Block Discord voice (UDP)"
add chain=forward protocol=tcp dst-port=5938 action=drop comment="Block TeamViewer (TCP)"
```

### 🚀 2) تمييز/أولوية للألعاب (QoS عبر Mangle)
```
/ip firewall mangle
add chain=forward protocol=udp dst-port=3074,27000-27031 action=mark-connection \
    new-connection-mark=game-conn passthrough=yes comment="Mark game (UDP)"
add chain=forward connection-mark=game-conn action=mark-packet \
    new-packet-mark=game-pkt passthrough=no
# بعدها سوّ Queue للـ packet-mark=game-pkt بأولوية عالية
```

### 🧭 3) توجيه لعبة عبر خط معيّن (Policy Routing)
```
/ip firewall mangle
add chain=prerouting protocol=udp dst-port=10000-29999 connection-mark=no-mark \
    action=mark-routing new-routing-mark=via-IQ passthrough=no comment="Route PUBG-M via IQ"
```

---

## ⚠️ قواعد ذهبية (اقرأها)

1. **`dst-port` يحتاج `protocol`** — لازم `protocol=tcp` أو `protocol=udp`. لتغطية الاثنين = قاعدتين.
2. **443 و 80 مشتركة** — تستخدمها كل المواقع. حظرها يقفل الإنترنت كله، مو التطبيق. للتطبيقات اللي كلها على 443 استخدم **address-list** (عناوين سيرفراتها) أو **Layer7 (SNI)**.
3. **ألعاب الموبايل منافذها متغيّرة** — الأفضل تمسكها بـ address-list أو Layer7.
4. **اقفل QUIC (UDP/443)** لو تريد فحص/حظر المتصفح يشتغل بدقة.
5. عدّة منافذ بقاعدة وحدة: افصلها بفاصلة `dst-port=80,443,5222` ونطاق `dst-port=27000-27031`.

---

## 🧩 ربط مع باقي المشروع
- `PORT/watsapp-not` → نفس الفكرة (حظر تطبيق بمنافذه).
- `BLOCK/BLOCK-PORT` → حظر منافذ عامة.
- `CHECK-HOST/` → كشف/توجيه مواقع الـ IP والسرعة.

---

## 📌 ملاحظة مهمة جداً

> ⚠️ **لا يُنصح باستخدام (حظر/توجيه) المنفذ `443` أو المنافذ المشتركة الشائعة — إلا للضرورة القصوى.**
>
> منافذ مثل `443` (HTTPS)، `80` (HTTP)، `53` (DNS)، `3478` (STUN)، `8080` تستخدمها **أغلب المواقع والتطبيقات**. حظرها أو توجيهها يقطع خدمات كثيرة **غير مقصودة** (مواقع، تحديثات، خدمات النظام...).
>
> ✅ **البديل الصحيح:** استهدف التطبيق/الموقع بدقة عبر **address-list** (عناوين سيرفراته) أو **Layer7 (SNI)** بدل المنفذ المشترك.
