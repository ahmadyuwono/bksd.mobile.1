class ListProgram {
  final List<ProgramModel> program;
  ListProgram({required this.program});

  factory ListProgram.fromJson(List<dynamic> parsedJson) {
    List<ProgramModel> program = <ProgramModel>[];
    program = parsedJson.map((i) => ProgramModel.fromJson(i)).toList();

    return ListProgram(program: program);
  }
}

class ProgramModel {
  ProgramModel(
      {required this.id,
      required this.judul,
      required this.url,
      required this.created_at,
      required this.negara_id});

  final String id;
  final String judul;
  final String url;
  final String created_at;
  final String? negara_id;

  factory ProgramModel.fromJson(Map<String, dynamic> object) {
    return ProgramModel(
      id: object['id'],
      judul: object['judul'],
      url: object['url'],
      created_at: object['created_at'],
      negara_id: object['negara_id'],
    );
  }
}
