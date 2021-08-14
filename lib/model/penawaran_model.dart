import 'dart:convert';

import 'package:http/http.dart' as http;

class PenawaranModel {
  PenawaranModel(
      {required this.fasilitas,
      required this.jenis,
      required this.nomor_surat,
      required this.tanggal,
      required this.penawaran_ksdd,
      required this.alamat,
      required this.atas_nama,
      required this.user_id});

  final String fasilitas;
  final String jenis;
  final String nomor_surat;
  final String tanggal;
  final String penawaran_ksdd;
  final String alamat;
  final String atas_nama;
  final String user_id;

  factory PenawaranModel.createPenawaranModel(Map<String, dynamic> object) {
    return PenawaranModel(
        fasilitas: object['fasilitas'],
        jenis: object['jenis'],
        nomor_surat: object['nomor_surat'],
        tanggal: object['tanggal'],
        penawaran_ksdd: object['penawaran_ksdd'],
        alamat: object['alamat'],
        atas_nama: object['atas_nama'],
        user_id: object['user_id']);
  }

  static Future<void> integrateAPI(
      String token,
      String fasilitas,
      String jenis,
      String tanggal,
      String nomor_surat,
      String penawaran_ksdd,
      String alamat,
      String atas_nama,
      String user_id) async {
    String apiURL = "https://muba.socketspace.com/api/tahapan_penawaran";
    var response = await http.post(Uri.parse(apiURL), headers: {
      'Authorization': 'Bearer $token',
    }, body: {
      "fasilitas": fasilitas,
      "jenis": jenis,
      "nomer_surat": nomor_surat,
      "tanggal": tanggal,
      "penawaran_ksdd": penawaran_ksdd,
      "alamat": alamat,
      "atas_nama": atas_nama,
      "user_id": user_id
    });
    var jsonObject = jsonDecode(response.body);
    print(response.statusCode);
  }
}
