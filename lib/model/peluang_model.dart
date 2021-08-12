class ListPeluang {
  final List<PeluangModel> peluang;
  ListPeluang({required this.peluang});

  factory ListPeluang.fromJson(List<dynamic> parsedJson) {
    List<PeluangModel> peluang = <PeluangModel>[];
    peluang = parsedJson.map((i) => PeluangModel.fromJson(i)).toList();

    return ListPeluang(peluang: peluang);
  }
}

class PeluangModel {
  PeluangModel({
    required this.id,
    required this.jenis_id,
    required this.negara_id,
    required this.judul,
    required this.file,
  });

  final String id;
  final String jenis_id;
  final String negara_id;
  final String judul;
  final String file;

  factory PeluangModel.fromJson(Map<String, dynamic> object) {
    return PeluangModel(
      id: object['id'],
      jenis_id: object['jenis_id'],
      negara_id: object['negara_id'],
      judul: object['judul'],
      file: object['file'],
    );
  }
}
