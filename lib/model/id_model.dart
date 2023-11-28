class IdModel {
  String message = '';
  IdModel({required this.message});

  factory IdModel.fromJson(Map<String, String> json) {
    return IdModel(message: json['message'] as String);
  }
}
