import 'dart:io';

class MataKuliah {
  final String nama;
  final int sks;
  final String nilai;

  MataKuliah(this.nama, this.sks, this.nilai);
}

int praseSks(String input) {
  final sks = int.tryParse(input.trim());
  if (sks == null || sks < 1 || sks > 6) {
    throw FormatException('SKS harus 1-6');
  }
  return sks;
}

double bobotNilai(String nilai) {
  switch (nilai.trim().toUpperCase()) {
    case 'A':
    return 4.0;
    case 'B':
    return 3.0;
    case 'C':
    return 2.0;
    case 'D':
    return 1.0;
    case 'E':
    return 0.0;
    default:
    throw FormatException('Nilai harus A-E');
  }
}

MataKuliah buatMataKuliah({
  required String nama,
  required String sks,
  required String nilai,
}) {
  final sksValid = praseSks(sks);
  bobotNilai(nilai);
  return MataKuliah(nama, sksValid, nilai.trim().toUpperCase());
}

double hitungIp(List<MataKuliah> daftar) {
  final totalSks = daftar.fold<int>(0, (sum, mk) => sum + mk.sks);
  if (totalSks == 0) return 0.0;

  final totalMutu = daftar.fold<double>(
    0.0,
    (sum, mk) => sum + bobotNilai(mk.nilai) * mk.sks,
  );
  return totalMutu / totalSks;
}

String kategoriIp(double ip) {
  if (ip >= 3.5) return 'Sangat Memuaskan';
  if (ip >= 3.0) return 'Memuaskan';
  if (ip >= 2.0) return 'Cukup';
  return 'Kurang';
}

List<MataKuliah> perluDiperbaiki(
  List<MataKuliah> daftar, {
    String batas = 'C',
  }) {
    return daftar
    .where((mk) => bobotNilai(mk.nilai) <= bobotNilai(batas))
    .toList();
  }

  int bandingkan(MataKuliah a, MataKuliah b) {
    final selisih = bobotNilai(b.nilai).compareTo(bobotNilai(a.nilai));
    if (selisih !=0) return selisih;
    return a.nama.compareTo(b.nama);
  }

  void main() {
  final daftar = <MataKuliah>[];

  while (true) {
    stdout.write('Nama MK : ');
    final nama = (stdin.readLineSync() ?? '').trim();
    if (nama.isEmpty) break; // berhenti kalau nama kosong

    stdout.write('SKS     : ');
    final sks = stdin.readLineSync() ?? '';
    stdout.write('Nilai   : ');
    final nilai = stdin.readLineSync() ?? '';

    try {
      daftar.add(buatMataKuliah(nama: nama, sks: sks, nilai: nilai));
    } on FormatException catch (e) {
      print('Data diabaikan: ${e.message}');
    }
  }

  if (daftar.isEmpty) {
    print('Tidak ada data.');
    return;
  }

  final urut = [...daftar]..sort(bandingkan);
  print('\nDaftar (urut nilai):');
  for (final mk in urut) {
    print('- ${mk.nama} (${mk.sks} SKS) : ${mk.nilai}');
  }

  final totalSks = daftar.fold<int>(0, (s, mk) => s + mk.sks);
  final ip = hitungIp(daftar);
  print('\nTotal SKS : $totalSks');
  print('IP        : ${ip.toStringAsFixed(2)} (${kategoriIp(ip)})');

  final perbaikan = perluDiperbaiki(daftar);
  if (perbaikan.isNotEmpty) {
    final namaList = perbaikan.map((mk) => mk.nama).join(', ');
    print('Perlu diperbaiki: $namaList');
  }
}