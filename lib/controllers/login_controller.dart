

import 'package:untitled7/helper/API.dart';

class LoginContrloller

{

  Future<bool> loginMeth({required int areaId,required int phoneNumber,required String passwrod})
 async {
  dynamic data= await Api().post(url: "LoginColl.php", body: {
    'AreaID':"$areaId",
    'PhoneNumber':'$phoneNumber',
    "password":passwrod
  });
  bool isLogin=data['message']=='Login Successfully';

  return isLogin;


  }

}