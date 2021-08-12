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
  PeluangModel(
      {required this.url,
      required this.jenis_id,
      required this.negara_id,
      required this.judul,
      required this.file,
      required this.jenis});

  final String? url;
  final String jenis_id;
  final String negara_id;
  final String judul;
  final String file;
  final String? jenis;

  factory PeluangModel.fromJson(Map<String, dynamic> object) {
    return PeluangModel(
        url: object['url'],
        jenis_id: object['jenis_id'],
        negara_id: object['negara_id'],
        judul: object['judul'],
        file: object['file'],
        jenis: object['jenis']);
  }
}
