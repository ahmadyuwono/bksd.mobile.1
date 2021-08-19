import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:muba/utilities/const.dart';

class ListPersiapan {
  final List<PersiapanModel> persiapan;
  ListPersiapan({required this.persiapan});

  factory ListPersiapan.fromJson(List<dynamic> parsedJson) {
    List<PersiapanModel> persiapan = <PersiapanModel>[];
    persiapan = parsedJson.map((i) => PersiapanModel.fromJson(i)).toList();

    return ListPersiapan(persiapan: persiapan);
  }
}

class PersiapanModel {
  PersiapanModel({
    required this.userId,
    required this.isValidate,
    required this.jenis,
    required this.fasilitas,
    required this.email,
  });

  final String userId;
  final String isValidate;
  final String jenis;
  final String fasilitas;
  final String email;

  factory PersiapanModel.fromJson(Map<String, dynamic> object) {
    return PersiapanModel(
        userId: object['userId'],
        isValidate: object['isValidate'],
        jenis: object['jenis'],
        fasilitas: object['fasilitas'],
        email: object['email']);
  }

  static Future<bool> integrateAPI(
    String token,
    String fasilitas,
    String jenis,
    String nama_daerah,
    String nama_kepaladaerah,
    String no_sk,
    String alamat,
    String uud,
    String peraturan_pemerintah,
    String peraturan_presiden,
    String peraturan_menteri,
    String peraturan_daerah,
    String pertimbangan,
    String maksud,
    String tujuan,
    String objek_kerjasama,
    String ruang_lingkup,
    String pelaksanaan,
    String alamat_surat,
    String email,
    String no,
    String nama_narahubung,
    String jabatan,
    String user_id,
    String atas_nama,
    String jangka_waktu,
    String pembiayaan,
  ) async {
    String apiURL = "${Constants.baseUri}/api/tahapan_persiapan/create";
    var response = await http.post(Uri.parse(apiURL),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        },
        body: jsonEncode(<String, dynamic>{
          "fasilitas": fasilitas,
          "jenis": jenis,
          "nama_daerah": nama_daerah,
          "nama_kepaladaerah": nama_kepaladaerah,
          "no_sk": no_sk,
          "alamat": alamat,
          "uud": uud,
          "peraturan_pemerintah": peraturan_pemerintah,
          "peraturan_presiden": peraturan_presiden,
          "peraturan_mentri": peraturan_menteri,
          "peraturan_daerah": peraturan_daerah,
          "pertimbangan": pertimbangan,
          "maksud": maksud,
          "tujuan": tujuan,
          "objek_kerjasama": objek_kerjasama,
          "ruang_lingkup": ruang_lingkup,
          "pelaksanaan": pelaksanaan,
          "alamat_surat": alamat_surat,
          "email": email,
          "no": no,
          "nama_narahubung": nama_narahubung,
          "jabatan": jabatan,
          "user_id": user_id,
          "atas_nama": atas_nama,
          "jangka_waktu": jangka_waktu,
          "pembiayaan": pembiayaan,
        }));
    print(response.statusCode);
    if (response.statusCode != 200) {
      return false;
    } else {
      return true;
    }
  }
}
