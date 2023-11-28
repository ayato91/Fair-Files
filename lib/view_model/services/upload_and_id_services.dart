import 'dart:convert';

import 'package:http/http.dart';

class UploadAndGetId {
  final endpoint = 'https://draconyan.xyz:3000/upload';
  Future<String> getId(file) async {
    MultipartRequest request =
        await MultipartRequest('POST', Uri.parse(endpoint));
    request.files.add(await MultipartFile.fromPath('FileInput', file.path));
    try {
      StreamedResponse res = await request.send();
      if (res.statusCode == 200) {
        print('uploaded');
        final jsonResponse = json.decode(await res.stream.bytesToString());
        return jsonResponse['id'];
      } else {
        print('Error Upload');
        return 'Error!';
      }
    } catch (e) {
      print('Error : $e');
      return e.toString();
    }
  }
}
