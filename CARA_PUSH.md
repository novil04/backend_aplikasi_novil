# Cara Push Backend ke GitHub

## 📌 **Cara 1: Menggunakan Script PowerShell (RECOMMENDED)**

### Push dengan pesan custom:
```powershell
cd backend
.\push.ps1 "Fix bug di notifikasi"
```

### Push dengan pesan default:
```powershell
cd backend
.\push.ps1
```
(Akan menggunakan pesan default: "Update backend")

---

## 📌 **Cara 2: Menggunakan Git Alias**

### Setup (Hanya sekali):
```powershell
cd backend
git config --local alias.quick '!f() { git add -A && git commit -m "$1" && git push origin main; }; f'
```

### Penggunaan:
```powershell
cd backend
git quick "Fix bug di notifikasi"
```

---

## 📌 **Cara 3: Manual (Standard Git)**

```powershell
cd backend
git add -A
git commit -m "Pesan commit Anda"
git push origin main
```

---

## 🔗 **Repository Backend**
- **GitHub**: https://github.com/novil04/backend_aplikasi_novil
- **Railway**: Auto-deploy setelah push (2-5 menit)

---

## ⚠️ **Catatan Penting**

1. **Selalu bekerja di folder backend**
   ```powershell
   cd c:\Users\abilh\aplikasi_novil\backend
   ```

2. **Cek status sebelum push**
   ```powershell
   git status
   ```

3. **Lihat history commit**
   ```powershell
   git log --oneline -5
   ```

4. **Jangan lupa file .env**
   - File `.env` TIDAK akan ter-push (sudah di .gitignore)
   - Atur variabel environment langsung di Railway dashboard

5. **Cek Railway setelah push**
   - Buka Railway dashboard
   - Tunggu build & deploy selesai
   - Cek logs jika ada error

---

## 🚀 **Quick Reference**

| Tujuan | Command |
|--------|---------|
| Push cepat | `.\push.ps1 "pesan"` |
| Cek perubahan | `git status` |
| Lihat log | `git log --oneline -5` |
| Batal commit terakhir | `git reset --soft HEAD~1` |
| Pull update terbaru | `git pull origin main` |

---

## 🆘 **Troubleshooting**

### Error: "Push rejected"
```powershell
# Pull dulu, lalu push lagi
git pull origin main
git push origin main
```

### Error: "Permission denied"
```powershell
# Pastikan sudah login GitHub
# Atau gunakan Personal Access Token
```

### Script tidak jalan
```powershell
# Enable execution policy (run as Administrator)
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```
