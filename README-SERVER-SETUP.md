# Panduan Setup Server Lokal - Anastasya Vocal CMS

## Masalah Umum: "Gagal Terhubung ke Server"

Jika Anda mengalami masalah koneksi server saat menjalankan aplikasi di komputer lokal, ikuti langkah-langkah berikut:

## 1. Setup Backend (PHP Server)

### Opsi A: Menggunakan XAMPP/WAMP
1. **Install XAMPP atau WAMP**
   - Download dari https://www.apachefriends.org/ (XAMPP)
   - Install dan jalankan Apache + MySQL

2. **Letakkan folder project di htdocs**
   ```
   C:\xampp\htdocs\anastasya-vocal-cms\
   ```

3. **Import Database**
   - Buka phpMyAdmin (http://localhost/phpmyadmin)
   - Buat database baru: `anastasya_vocal_cms`
   - Import file `backend/database.sql`

4. **Test API Endpoint**
   - Buka browser: http://localhost/anastasya-vocal-cms/backend/api/theme.php
   - Harus menampilkan JSON response

### Opsi B: Menggunakan PHP Built-in Server
```bash
# Masuk ke folder backend
cd backend

# Jalankan PHP server
php -S localhost:8000

# Test di browser: http://localhost:8000/api/theme.php
```

## 2. Setup Frontend (React/Vite)

1. **Install Dependencies**
   ```bash
   npm install
   ```

2. **Konfigurasi Environment**
   - File `.env` sudah dibuat dengan konfigurasi:
   ```
   VITE_API_URL=http://localhost/anastasya-vocal-cms/backend/api
   ```

3. **Jalankan Development Server**
   ```bash
   npm run dev
   ```

## 3. Troubleshooting Koneksi

### Cek 1: Verifikasi API URL
- Buka Developer Tools (F12) → Network tab
- Lihat request yang gagal
- Pastikan URL API benar

### Cek 2: CORS Issues
Jika muncul error CORS:
- Pastikan origin `http://localhost:8080` ada di `backend/config/cors.php`
- Restart server PHP setelah mengubah konfigurasi

### Cek 3: Database Connection
- Pastikan MySQL berjalan
- Cek kredensial di `backend/config/database.php`:
  ```php
  $host = 'localhost';
  $dbname = 'anastasya_vocal_cms';
  $username = 'root';
  $password = '';
  ```

### Cek 4: Port Conflicts
Jika port 8080 sudah digunakan:
```bash
# Cek port yang digunakan
netstat -an | findstr :8080

# Atau ubah port di vite.config.ts
server: {
  host: "localhost",
  port: 3000,  // ganti ke port lain
}
```

## 4. Error Messages dan Solusi

### "Tidak dapat terhubung ke server"
- **Penyebab**: Server PHP tidak berjalan
- **Solusi**: Jalankan XAMPP/WAMP atau PHP built-in server

### "HTTP 404 Not Found"
- **Penyebab**: Path API salah atau file tidak ada
- **Solusi**: Cek struktur folder dan path di `.env`

### "HTTP 500 Internal Server Error"
- **Penyebab**: Error PHP atau database
- **Solusi**: Cek PHP error log di XAMPP/logs/php_error_log

### "Access-Control-Allow-Origin"
- **Penyebab**: CORS tidak dikonfigurasi dengan benar
- **Solusi**: Update `backend/config/cors.php`

## 5. Struktur Project yang Benar

```
anastasya-vocal-cms/
├── backend/
│   ├── api/
│   │   ├── auth.php
│   │   ├── content.php
│   │   ├── gallery.php
│   │   ├── news.php
│   │   ├── packages.php
│   │   ├── testimonials.php
│   │   └── theme.php
│   ├── config/
│   │   ├── cors.php
│   │   └── database.php
│   └── database.sql
├── src/
├── .env
└── package.json
```

## 6. Test Koneksi Manual

### Test Backend:
```bash
curl http://localhost/anastasya-vocal-cms/backend/api/theme.php
```

### Test Frontend:
1. Buka http://localhost:8080
2. Buka Developer Tools → Console
3. Lihat log API requests

## 7. Bantuan Tambahan

Jika masih mengalami masalah:
1. Cek log error di browser console
2. Cek PHP error log
3. Pastikan semua service (Apache, MySQL) berjalan
4. Restart semua service dan coba lagi

## 8. Konfigurasi untuk Production

Untuk deployment production, update `.env`:
```
VITE_API_URL=https://yourdomain.com/api
```

Dan update CORS di `backend/config/cors.php` dengan domain production Anda.
