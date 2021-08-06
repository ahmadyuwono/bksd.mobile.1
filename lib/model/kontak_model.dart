class ListKontak {
  final List<KontakModel> kontak;
  ListKontak({required this.kontak});

  factory ListKontak.fromJson(List<dynamic> parsedJson) {
    List<KontakModel> kontak = <KontakModel>[];
    kontak = parsedJson.map((i) => KontakModel.fromJson(i)).toList();

    return ListKontak(kontak: kontak);
  }
}

class KontakModel {
  KontakModel({
    required this.id,
    required this.foto,
    required this.telepon,
    required this.email,
    required this.alamat,
    required this.no_wa,
    required this.facebook,
  });

  final String id;
  final String foto;
  final String telepon;
  final String email;
  final String alamat;
  final String no_wa;
  final String facebook;

  factory KontakModel.fromJson(Map<String, dynamic> object) {
    return KontakModel(
        id: object['id'],
        foto: object['foto'],
        telepon: object['telepon'],
        email: object['email'],
        alamat: object['alamat'],
        no_wa: object['no_wa'],
        facebook: object['facebook']);
  }
}
