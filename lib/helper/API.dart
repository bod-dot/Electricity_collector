import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:untitled7/helper/constans.dart';
class Api
{
  //dynamic
  Future<dynamic> post ({required String url,required dynamic body})
  async {

   http.Response response =await http.post(Uri.parse(kUrl+url),body: body);

   if(response.statusCode==200)
     {

       return jsonDecode(response.body);

     }
   else
     {


       throw Exception("three is a brablem the status Code is ${response.statusCode} and the body is ${jsonDecode(response.body)}");
     }
  }
}