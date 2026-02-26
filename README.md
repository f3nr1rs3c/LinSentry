# 🔐 LinSentry — Linux Privilege Escalation Audit Tool

Linux sistemlerde **yetki yükseltme (Privilege Escalation)** risklerini hızlı ve güvenli şekilde analiz etmek için geliştirilmiş hafif bir denetim aracıdır.

> 🎯 Amaç: Exploit çalıştırmak değil, potansiyel riskleri **tespit etmek ve raporlamak**.

---

## 🚀 LinSentry Nedir?

**LinSentry**, Linux sistemlerde yaygın PrivEsc vektörlerini otomatik olarak tarayan Bash tabanlı bir güvenlik denetim aracıdır.

Red Team, Pentest ve sistem güvenliği analizleri için tasarlanmıştır.

### Özellikler:

- ✔️ SUID / SGID analiz eder  
- ✔️ Sudo yetkilerini kontrol eder  
- ✔️ PATH zafiyetlerini inceler  
- ✔️ Capabilities tarar  
- ✔️ Cron job misconfig kontrol eder  
- ✔️ Docker breakout riskini işaretler  
- ✔️ Kernel sürümünü raporlar  
- ✔️ World-writable dosyaları listeler  

---

## 🛠️ Neden LinSentry?

Piyasadaki benzer araçlardan farklı olarak:

- ✅ Exploit önermez  
- ✅ Zararsızdır  
- ✅ Güvenli audit yaklaşımı benimser  
- ✅ Eğitim ve laboratuvar ortamları için idealdir  

---

## 🔍 Taradığı Başlıca Alanlar

### 1️⃣ Kullanıcı ve Yetki Bilgileri
- `whoami`
- `id`

### 2️⃣ Sudo Yetkileri
- `sudo -l` çıktısı analiz edilir

### 3️⃣ SUID Dosyaları
- Root yetkisiyle çalışan dosyalar listelenir  
- Sonuçlar `/tmp/suid_list.txt` dosyasına kaydedilir

### 4️⃣ SGID Dosyaları
- Grup yetkisiyle çalışan dosyalar tespit edilir  
- `/tmp/sgid_list.txt` dosyasına yazılır

### 5️⃣ World Writable Dosyalar
- Herkes tarafından yazılabilir dosyalar kontrol edilir

### 6️⃣ PATH Güvenlik Analizi
- PATH içindeki yazılabilir dizinler tespit edilir  
- Olası PATH hijacking riskleri belirlenir

### 7️⃣ Linux Capabilities
- `getcap -r /` ile capability taraması yapılır

### 8️⃣ Cron Jobs
- Yanlış yapılandırılmış zamanlanmış görevler incelenir

### 9️⃣ NFS Misconfiguration
- Local export kontrolü yapılır

### 🔟 Container Riskleri
- Docker yüklü mü kontrol edilir  
- Olası container breakout riskleri işaretlenir

### 1️⃣1️⃣ Kernel Bilgisi
- Kernel sürümü raporlanır  
- Manuel exploit analizine temel oluşturur

### 1️⃣2️⃣ /etc Yazılabilir Dosyalar
- Kritik konfigürasyon dosyalarının yazılabilir olup olmadığı kontrol edilir

---

## 🧪 Kullanım

```bash
chmod +x linsentry.sh
./linsentry.sh
```

Audit tamamlandığında aşağıdaki dosyalar oluşturulur:

```
/tmp/suid_list.txt
/tmp/sgid_list.txt
```

---

## 🧠 Kimler Kullanmalı?

- Siber Güvenlik Öğrencileri  
- Kırmızı Takım Uzmanları
- Sızma Testi Uzmanları
- Linux Sistem Yöneticileri

---

## ⚠️ Güvenlik ve Etik

LinSentry:

- Exploit içermez
- Otomatik saldırı gerçekleştirmez
- Sisteme zarar vermez
- Yalnızca yetkili ortamlarda kullanılmalıdır

---

## 👨‍💻 Geliştirici

**Sirius — Doğukan ISPIRLI**

Red Team & Privilege Escalation odaklı geliştirilmiştir.

---

## 🔮 Gelecek Planları (BAKIM AŞAMASINDA)

- JSON çıktısı
- Otomatik risk skorlaması
- HTML rapor üretimi
- CVE eşleştirme sistemi
- MITRE ATT&CK mapping

---
