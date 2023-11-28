import 'package:http/http.dart';

class GetUniqueId {
  final endpoint = '';

  Future getId() async{
    Response res = await get(Uri.parse(endpoint));

    if(res.statusCode == 200){
      
    }
    else{
      throw("Something Went Wrong");
    }
  }
}
