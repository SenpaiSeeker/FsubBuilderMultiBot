# Fsub Builder Bot

Sebuah platform canggih yang dirancang untuk **membuat dan mengelola seluruh armada bot Force Subscribe (Fsub)**. Bot utama berfungsi sebagai pusat kontrol di mana pengguna dapat membeli langganan menggunakan Telegram Stars untuk meluncurkan bot Fsub mereka sendiri. Setiap bot yang dibuat beroperasi secara independen dengan database, kanal Fsub, dan panel pengaturannya masing-masing.

## ⭐ Fitur Unggulan

- **Sistem Pembuatan Bot Berbasis Langganan**:
  - **Bot Induk (Main Bot)**: Pusat untuk menjual langganan dan mengelola semua bot yang dibuat pengguna.
  - **Pembayaran via Telegram Stars**: Pengguna dapat membeli langganan (1 hingga 12 bulan) secara otomatis menggunakan Telegram Stars (⭐).
  - **Manajemen Langganan**: Owner utama dapat memberikan akses atau perpanjangan manual kepada pengguna (`/akses`).
  - **Fitur Refund**: Owner utama dapat melakukan pengembalian dana (refund) Stars langsung dari notifikasi pembayaran, **hanya jika pengguna belum membuat bot**.

- **Fungsionalitas Bot Fsub (Clone Bot)**:
  - **Force Subscribe Dinamis**: Setiap pemilik bot dapat menambah, menghapus, dan melihat daftar kanal yang wajib di-subscribe oleh pengguna akhir.
  - **Pembuatan Link Aman**: Ubah file, video, atau pesan apa pun menjadi link `t.me` yang dilindungi. Pengguna akhir harus bergabung dengan kanal yang ditentukan sebelum bisa mendapatkan konten.
  - **Dukungan Batch Link**: Gabungkan beberapa file, atau bahkan seluruh album, ke dalam satu link tunggal.
  - **Auto-Link di Channel Database**: Kirim file atau media ke channel database yang telah diatur, dan bot akan otomatis membalas dengan link Fsub yang sudah jadi.

- **Peralatan Admin yang Lengkap**:
  - **Panel Owner Per-Bot**: Setiap pemilik bot memiliki panel kontrol untuk mengelola kanal Fsub, melihat statistik, dan melakukan broadcast.
  - **Fitur Broadcast**: Kirim pesan massal ke semua pengguna yang pernah memulai bot Fsub Anda.
  - **Manajemen Member**: Lihat daftar semua pengguna bot Anda dalam format halaman (10 per halaman) yang rapi, lengkap dengan tombol untuk mengirim pesan pribadi langsung dari panel.

- **Manajemen Terpusat untuk Owner Utama**:
  - **Panel `/allbots`**: Lihat daftar semua bot yang aktif dengan sistem halaman. Informasi mencakup nama bot, ID, username, dan masa aktif.
  - **Kelola Bot Individual**: Dari panel `/allbots`, owner utama dapat langsung **menghapus bot** atau **menambah masa aktif** (1-12 bulan) untuk bot mana pun.
  - **Backup & Restore**: Bot akan secara otomatis mengirimkan file backup `database.zip` secara berkala. Untuk memulihkan, balas file tersebut dengan perintah `/restore`. **PENTING: Restart bot setelah restore berhasil.**
  - **Pengaturan Kurs**: Atur nilai tukar Bintang (Star) ke Rupiah (`/setrate`) untuk memberikan estimasi harga kepada pengguna.
  - **Pemeriksaan Kadaluwarsa Otomatis**: Sistem secara otomatis memeriksa dan menghapus bot yang masa langganannya telah habis, serta mengirimkan notifikasi kepada pemiliknya.

## 🚀 Pengaturan dan Instalasi

Ikuti langkah-langkah ini untuk menjalankan platform bot Anda.

### 1. Prasyarat

- Python 3.8 atau lebih tinggi.
- Token Bot Telegram untuk **Bot Utama (Induk)**.
- API ID dan API Hash dari [my.telegram.org](https://my.telegram.org).

### 2. Kloning Repositori

Pertama, kloning repositori ini ke mesin lokal atau server Anda.
```bash
git clone https://github.com/<your-username>/FsubBuilderMultiBot.git
cd FsubBuilderMultiBot
```

### 3. Instalasi Dependensi

Instal semua pustaka Python yang diperlukan menggunakan file `requirements.txt`.
```bash
pip3 install -r requirements.txt
```

### 4. Konfigurasi Environment

Buat file bernama `.env` di direktori utama proyek dan isi dengan format berikut. Ganti nilainya dengan kredensial Anda.

```env
API_ID=12345678
API_HASH=your_api_hash_here
BOT_TOKEN=your_main_bot_token_here
OWNER_ID=your_telegram_user_id
DB_NAME=fsub_database
DB_KEY=your_secret_encryption_key_here
```

- `API_ID` & `API_HASH`: Diambil dari [my.telegram.org](https://my.telegram.org).
- `BOT_TOKEN`: Token untuk bot utama yang akan menjadi pabrik bot.
- `OWNER_ID`: ID pengguna Telegram numerik Anda.
- `DB_NAME`: Nama file database yang akan dibuat (misal: `fsub_database`).
- `DB_KEY`: Kunci rahasia (bisa diisi acak) untuk enkripsi data.

### 5. Menjalankan Bot

Setelah file `.env` selesai dikonfigurasi, jalankan bot dengan perintah berikut:

```bash
python3 main.py
```

Bot utama akan dimulai, dan Anda akan melihat pesan konfirmasi di terminal.

## 📖 Panduan Penggunaan

### Untuk Owner Utama (Super Admin)

Anda adalah administrator tertinggi dengan kontrol penuh atas sistem.

1.  **Mulai Bot**: Kirim `/start` ke bot utama Anda.
2.  **Memberikan Akses Manual**: Jika diperlukan, Anda bisa memberikan langganan secara manual:
    ```
    /akses <user_id atau @username> <jumlah_bulan>
    ```
3.  **Mengatur Kurs Stars**: Untuk menampilkan estimasi harga dalam Rupiah kepada pengguna:
    ```
    /setrate <jumlah_rupiah_per_star>
    # Contoh: /setrate 450
    ```
4.  **Mengelola Semua Bot**: Gunakan `/allbots` untuk membuka panel manajemen. Dari sini Anda bisa:
    - Menjelajahi semua bot yang aktif menggunakan tombol navigasi.
    - Menekan **"➕ Tambah Masa Aktif"** untuk memperpanjang durasi bot.
    - Menekan **"🗑️ Hapus Bot"** untuk menghapus bot secara permanen.
5.  **Refund Pembayaran**: Saat pengguna membayar langganan, Anda akan menerima notifikasi. Jika pengguna belum membuat bot, tombol **"🔙 Kembalikan Dana"** akan tersedia di notifikasi tersebut.
6.  **Memulihkan Database**: Balas (reply) ke file backup `.zip` yang dikirim bot secara berkala dengan perintah `/restore`. **Pastikan untuk me-restart bot setelah prosesnya berhasil**.

### Untuk Pengguna (Pelanggan)

Pengguna berinteraksi dengan bot utama untuk membeli langganan dan membuat bot mereka.

1.  **Beli Langganan**: Tekan tombol **"🛒 Beli Langganan 🛒"**, pilih durasi, lalu bayar menggunakan Telegram Stars.
2.  **Buat Bot**: Setelah langganan aktif, tekan tombol **"🤖 Buat Bot Fsub 🤖"** dan ikuti instruksi 4 langkah untuk memasukkan:
    - `API_ID`
    - `API_HASH`
    - `BOT_TOKEN` (untuk bot Fsub baru Anda)
    - `ID Channel Database`
3.  Setelah berhasil, bot Fsub akan langsung aktif sesuai durasi langganan yang dibeli.

### Untuk Pemilik Bot Fsub (Clone Owner)

Setelah bot Anda dibuat, Anda dapat mengelolanya.

1.  **Mulai Bot Anda**: Kirim `/start` ke bot Fsub **milik Anda**.
2.  **Panel Pengaturan**:
    - **"⚙️ Pengaturan"**: Kelola semua aspek bot Anda di sini.
    - **Tambah/Hapus/Lihat Channel Fsub**: Atur kanal mana yang harus di-subscribe pengguna.
    - **Buat Link / Buat Batch**: Generate link aman untuk konten Anda.
    - **Auto-Link**: Cukup kirim pesan/file ke channel database yang Anda atur saat pembuatan bot, maka bot akan otomatis membalas dengan link Fsub-nya.
    - **Daftar Member**: Lihat siapa saja yang menggunakan bot Anda dan kirim pesan jika perlu.
    - **Broadcast**: Kirim pengumuman ke semua pengguna bot Anda.

#### ⭐️ Dibuat oleh: [@NorSodikin](https://t.me/NorSodikin)
