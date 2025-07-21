#!/bin/bash

echo "=== Anastasya Vocal CMS - Backend Server Starter ==="
echo ""

# Check if PHP is installed
if ! command -v php &> /dev/null; then
    echo "❌ PHP tidak ditemukan. Silakan install PHP terlebih dahulu."
    echo "   Download dari: https://www.php.net/downloads"
    echo "   Atau install XAMPP: https://www.apachefriends.org/"
    exit 1
fi

echo "✅ PHP ditemukan: $(php --version | head -n 1)"
echo ""

# Check if we're in the right directory
if [ ! -d "backend" ]; then
    echo "❌ Folder 'backend' tidak ditemukan."
    echo "   Pastikan Anda menjalankan script ini dari root folder project."
    exit 1
fi

echo "✅ Folder backend ditemukan"
echo ""

# Check if database.sql exists
if [ ! -f "backend/database.sql" ]; then
    echo "⚠️  File database.sql tidak ditemukan di backend/"
    echo "   Database mungkin belum disetup."
else
    echo "✅ File database.sql ditemukan"
fi

echo ""
echo "🚀 Memulai PHP Development Server..."
echo "   URL: http://localhost:8000"
echo "   API Base: http://localhost:8000/api/"
echo ""
echo "   Tekan Ctrl+C untuk menghentikan server"
echo ""

# Start PHP server in backend directory
cd backend
php -S localhost:8000

echo ""
echo "Server dihentikan."
