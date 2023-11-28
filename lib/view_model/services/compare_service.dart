import 'dart:convert';

import 'package:http/http.dart';

class CompareResult {
  final endpoint = 'https://draconyan.xyz:3000/verify';
  Future<String> getResult(file, String id) async {
    MultipartRequest request =
        await MultipartRequest('POST', Uri.parse(endpoint));
    request.files.add(await MultipartFile.fromPath('FileInput', file.path));
    request.fields['idInput'] = id;
    try {
      StreamedResponse res = await request.send();
      if (res.statusCode == 200) {
        print('uploaded');
        final jsonResponse = json.decode(await res.stream.bytesToString());
        return jsonResponse['message'];
      } else {
        print('Error Upload');
        final jsonResponse = json.decode(await res.stream.bytesToString());
        return jsonResponse['message'];
      }
    } catch (e) {
      print('Error : $e');
      return e.toString();
    }
  }
}
