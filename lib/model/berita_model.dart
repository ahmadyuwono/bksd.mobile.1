class ListModel {
  final List<BeritaModel> berita;
  ListModel({required this.berita});

  factory ListModel.fromJson(List<dynamic> parsedJson) {
    List<BeritaModel> berita = <BeritaModel>[];
    berita = parsedJson.map((i) => BeritaModel.fromJson(i)).toList();

    return ListModel(berita: berita);
  }
}

class BeritaModel {
  BeritaModel({
    required this.id,
    required this.judul,
    required this.isi,
    required this.tanggal,
    required this.sumber_foto,
    required this.foto,
    required this.admin_id,
    required this.author,
    required this.premium,
  });

  final String id;
  final String judul;
  final String isi;
  final String tanggal;
  final String sumber_foto;
  final String foto;
  final String admin_id;
  final String author;
  final String premium;

  factory BeritaModel.fromJson(Map<String, dynamic> object) {
    return BeritaModel(
      id: object['id'],
      judul: object['judul'],
      isi: object['isi'],
      tanggal: object['tanggal'],
      sumber_foto: object['sumber_foto'],
      foto: object['foto'],
      admin_id: object['admin_id'],
      author: object['author'],
      premium: object['premium'],
    );
  }
}
