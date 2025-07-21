@echo off
echo === Anastasya Vocal CMS - Backend Server Starter ===
echo.

REM Check if PHP is installed
php --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ PHP tidak ditemukan. Silakan install PHP terlebih dahulu.
    echo    Download dari: https://www.php.net/downloads
    echo    Atau install XAMPP: https://www.apachefriends.org/
    pause
    exit /b 1
)

echo ✅ PHP ditemukan
php --version | findstr /C:"PHP"
echo.

REM Check if we're in the right directory
if not exist "backend" (
    echo ❌ Folder 'backend' tidak ditemukan.
    echo    Pastikan Anda menjalankan script ini dari root folder project.
    pause
    exit /b 1
)

echo ✅ Folder backend ditemukan
echo.

REM Check if database.sql exists
if not exist "backend\database.sql" (
    echo ⚠️  File database.sql tidak ditemukan di backend\
    echo    Database mungkin belum disetup.
) else (
    echo ✅ File database.sql ditemukan
)

echo.
echo 🚀 Memulai PHP Development Server...
echo    URL: http://localhost:8000
echo    API Base: http://localhost:8000/api/
echo.
echo    Tekan Ctrl+C untuk menghentikan server
echo.

REM Start PHP server in backend directory
cd backend
php -S localhost:8000

echo.
echo Server dihentikan.
pause
