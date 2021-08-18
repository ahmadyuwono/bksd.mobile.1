class KerjasamaModel {
  KerjasamaModel({
    required this.berkasId,
    required this.userId,
    required this.id,
    required this.name,
    required this.alamat,
    required this.email,
    required this.validatePenawaran,
    required this.validatePersiapan,
  });

  dynamic berkasId;
  dynamic userId;
  String id;
  String name;
  dynamic alamat;
  String email;
  dynamic validatePenawaran;
  dynamic validatePersiapan;

  factory KerjasamaModel.fromJson(Map<String, dynamic> json) => KerjasamaModel(
        berkasId: json["berkas_id"],
        userId: json["userId"],
        id: json["id"],
        name: json["name"],
        alamat: json["alamat"],
        email: json["email"],
        validatePenawaran: json["validate_penawaran"],
        validatePersiapan: json["validate_persiapan"],
      );

  Map<String, dynamic> toJson() => {
        "berkas_id": berkasId,
        "userId": userId,
        "id": id,
        "name": name,
        "alamat": alamat,
        "email": email,
        "validate_penawaran": validatePenawaran,
        "validate_persiapan": validatePersiapan,
      };
}
