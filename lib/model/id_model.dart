class IdModel {
  String id;
  String fileHash;
  IdModel({required this.id, required this.fileHash});

  factory IdModel.fromJson(Map<String, String> json) {
    return IdModel(
        id: json['id'] as String, fileHash: json['fileHash'] as String);
  }
}
