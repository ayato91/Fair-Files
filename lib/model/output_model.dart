class OutputModel {
  String message;
  OutputModel({required this.message});

  factory OutputModel.fromJson(Map<String, dynamic> json) {
    return OutputModel(message: json['message'] as String);
  }
}
