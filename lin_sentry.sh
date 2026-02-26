#!/bin/bash

# =============================================================
#  Linux Privilege Escalation Audit Tool 
#  Red Team ve Pentest amaçlıdır.
#  Geliştirici: Sirius - Doğukan ISPIRLI
#  SUDO, SUID, SGID, CAPABILITIES, PATH, ENV vb. analiz eder.
# =============================================================

RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
RESET=$(tput sgr0)

banner() {
echo "${BLUE}"
echo "==============================================="
echo "      LinSentry — Privilege Escalation Audit Tool"
echo "      (Yetki Yükseltme Denetim Aracı)"
echo "      Developed by Sirius"
echo "==============================================="
echo "${RESET}"
}

section() {
    echo ""
    echo "${YELLOW}===== $1 =====${RESET}"
}

warning(){
    echo "${RED}[!] $1${RESET}"
}

info(){
    echo "${GREEN}[+] $1${RESET}"
}

banner

# 1. User Info
section "Kullanıcı Bilgileri"
whoami
id

# 2. Sudo Rights (exploit içermez)
section "Sudo Yetkileri"
sudo -l 2>/dev/null || warning "sudo bilgisi alınamadı (parola isteyebilir)."

# 3. SUID Files
section "SUID Dosyaları"
info "SUID dosyaları taranıyor..."
find / -perm -4000 -type f 2>/dev/null | tee /tmp/suid_list.txt

# 4. SGID Files
section "SGID Dosyaları"
info "SGID dosyaları taranıyor..."
find / -perm -2000 -type f 2>/dev/null | tee /tmp/sgid_list.txt

# 5. Dünya tarafından yazılabilir dosyalar
section "World Writeable Files"
find / -type f -perm -0002 2>/dev/null | head -n 50

# 6. PATH Güvenlik Denetimi
section "PATH Risk Analizi"
echo $PATH
echo $PATH | tr ':' '\n' | while read -r dir; do
    if [ -w "$dir" ]; then
        warning "PATH içinde yazılabilir dizin bulundu: $dir"
    fi
done

# 7. Yetenekler (Capabilities)
section "Linux Capabilities"
getcap -r / 2>/dev/null

# 8. Cron Jobs
section "Cron Taraması"
ls -al /etc/cron* 2>/dev/null

# 9. NFS Misconfig
section "NFS Export Kontrolü"
showmount -e localhost 2>/dev/null

# 10. Docker / LXC PrivEsc Riski
section "Container Yetkileri"
if command -v docker >/dev/null; then
    warning "Docker yüklü → root breakout riski (teorik)."
fi

# 11. Kernel Info
section "Kernel Sürümü"
uname -a

# 12. Yazılabilir /etc dosyaları
section "/etc Yazılabilir Dosyalar"
find /etc -writable -type f 2>/dev/null

echo ""
echo "${BLUE}Audit tamamlandı. Sonuçlar: /tmp/suid_list.txt /tmp/sgid_list.txt${RESET}"
