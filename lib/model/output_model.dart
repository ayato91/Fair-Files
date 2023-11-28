class OutputModel {
  bool output;
  OutputModel({required this.output});

  factory OutputModel.fromJson(Map<String, bool> json) {
    return OutputModel(output: json['output'] as bool);
  }
}
