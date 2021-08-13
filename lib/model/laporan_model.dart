class ListLaporan {
  final List<LaporanModel> laporan;
  ListLaporan({required this.laporan});

  factory ListLaporan.fromJson(List<dynamic> parsedJson) {
    List<LaporanModel> laporan = <LaporanModel>[];
    laporan = parsedJson.map((i) => LaporanModel.fromJson(i)).toList();

    return ListLaporan(laporan: laporan);
  }
}

class LaporanModel {
  LaporanModel(
      {required this.id,
      required this.judul,
      required this.url,
      required this.created_at,
      required this.isi});

  final String id;
  final String judul;
  final String url;
  final String created_at;
  final String? isi;

  factory LaporanModel.fromJson(Map<String, dynamic> object) {
    return LaporanModel(
      id: object['id'],
      judul: object['judul'],
      url: object['url'],
      created_at: object['created_at'],
      isi: object['isi'],
    );
  }
}
