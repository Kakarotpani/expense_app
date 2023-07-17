import 'dart:convert';
import 'package:http/http.dart';

class HttpServices{
  Future<Response> authService(String phone, String password) async {
    Object payload = {
      "body": {
        "phone": phone,
        "password": password
      }
    };
    payload = json.encode(payload);
    const autApi = 'https://13t9suk27h.execute-api.ap-south-1.amazonaws.com/dev/auth';
    Response response = await post(Uri.parse(autApi.toString()), body: payload);
    if(response.statusCode == 200){
      return response;
    }
    else{
      throw Exception('Failed to get data');
    }
  }

  Future<Response> getService(String endPoint) async {
    String autApi = 'https://z2sffojsr3.execute-api.ap-south-1.amazonaws.com/dev/$endPoint';
    Response response = await get(Uri.parse(autApi.toString()));
    if(response.statusCode == 200){
      return response;
    }
    else{
      throw Exception('Failed to get data');
    }
  }
}