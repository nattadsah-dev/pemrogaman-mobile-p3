TUGAS RUTIN 3 MEMBUAT KALKULATOR PERHITUNGAN IPK MAHASISWA

## Cara menjalankan
menjalankan perintah 'dart run' di terminal

## Contoh sesi dengan input salah
Nama MK : Jaringan Komputer 
SKS     : 6
Nilai   : A
Nama MK : Jaringan Komputer
SKS     : 10
Nilai   : A
Data diabaikan: SKS harus 1-6

## Penjelasan Higher-Order Function
- fold untuk menggabungkan seluruh elemen list menjadi satu nilai. dipakai untuk
  menjumlah SKS dan total mutu (bobot × SKS) pada `hitungIp`.
- where untuk menyaring elemen yang memenuhi syarat. dipakai di
  `perluDiperbaiki` untuk mengambil mata kuliah bernilai C ke bawah.
- sort + comparator berfungsi untuk `bandingkan` sebagai argumen untuk
  menentukan urutan seperti yang nilai menurun lalu nama.

## Penjelasan Error Handling
Fungsi validasi (`parseSks`, `bobotNilai`) melempar `FormatException` saat
input tidak valid. `main` menangkapnya dengan `try`/`catch`, menampilkan
"Data diabaikan", lalu melanjutkan loop tanpa program berhenti. 

## Penggunaan AI
saya menggunakan AI (Claude) untuk menyusun rancangan fungsi dan kode draft awal dan membantu menari penyebab
eror. kemudian kode saya jalankan, uji valid dan tidak valid lalu saya pelajari
supaya dapat saya jelaskan sendiri.
