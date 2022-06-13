import 'dart:convert';

import 'package:pruebaTest/app/app_constants.dart';

import 'package:http/http.dart' as http;
import 'package:pruebaTest/redux2/settingApp/store.dart';


class API {
  API();

  static const BASEAPIURL = 'universal-tutorial.com';



  String uidUser = "";




  static const String GET_POSTS = "/api/getaccesstoken";


  static const String GET_COUNTRY_LIST = "/api/countries/";

 Future<MyHttpResponse> getToken() async {
    var url = Uri.parse("https://"+BASEAPIURL+ GET_POSTS);
    print(url.toString());
    MyHttpResponse response = await getRequest(url);
   try {
     if (response.statusCode == 200) {
       response.message = "exito";

     } else {
       response.message = "Error";
       response.data = null;
     }
   }catch(e){
     response.message = e.toString();
     response.data = null;
   }
    return response;
  }

   Future<MyHttpResponse> getCountryList() async {
    var url = Uri.parse(/*"https://"+BASEAPIURL+ GET_COUNTRY_LIST*/"https://www.universal-tutorial.com/api/countries/");
    print(url.toString());
    MyHttpResponse response = await getRequestAuth(url);
   try {
     if (response.statusCode == 200) {
       response.message = "exito";

     } else {
       response.message = "Error";
       response.data = null;
     }
   }catch(e){
     response.message = e.toString();
     response.data = null;
   }
    return response;
  }









}

Future<MyHttpResponse> getRequest(Uri uri) async {

   Map<String, String> requestHeaders = {
       'Content-type': 'application/json',
       'Accept': 'application/json',
       'api-token': 'TtucK5kuyLQtUuMIl0Mqoi8_SgMOTEHixVHKK3nMk1_D00Nvx0MriRFx82S_ofSUF9A',
       'user-email':'alexecr66@gmail.com'
     };
  var response = await http.get(uri,headers: requestHeaders);

  print(response.body);

  var data = json.decode(utf8.decode(response.bodyBytes));

  return MyHttpResponse(response.statusCode, response.body);
}


Future<MyHttpResponse> getRequestAuth(Uri uri) async {

   Map<String, String> requestHeaders = {
       'Content-type': 'application/json',
       'Accept': 'application/json',
       'Authorization': "Bearer "+ReduxHome.store.state.postsState.tokenModel.authToken.toString(),
     };
  var response = await http.get(uri,headers: requestHeaders);

  print(response.body);

  var data = json.decode(utf8.decode(response.bodyBytes));

  return MyHttpResponse(response.statusCode, response.body);
}

class MyHttpResponse {
  int statusCode;
  String message;
  dynamic data;

  MyHttpResponse(this.statusCode, this.data, {this.message});

  @override
  String toString() {
    return 'MyHttpResponse{statusCode: $statusCode, message: $message, data: $data}';
  }
}
