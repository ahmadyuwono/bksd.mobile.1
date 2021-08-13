class RegulationModel {
  RegulationModel({
    required this.id,
    required this.version,
    required this.attachment,
    required this.registryDate,
  });

  String id;
  String version;
  String attachment;
  DateTime registryDate;

  factory RegulationModel.fromJson(Map<String, dynamic> json) =>
      RegulationModel(
        id: json["id"],
        version: json["version"],
        attachment: json["attachment"],
        registryDate: DateTime.parse(json["registry_date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "version": version,
        "attachment": attachment,
        "registry_date": registryDate.toIso8601String(),
      };
}
