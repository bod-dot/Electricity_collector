import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled7/helper/API.dart';

class LoginContrloller

{

  Future<bool> loginMeth({required int areaId,required int phoneNumber,required String passwrod})
 async {
  Map<String,dynamic> data= await Api().post(url: "LoginColl.php", body: {
    'AreaID':"$areaId",
    'PhoneNumber':'$phoneNumber',
    "password":passwrod
  });
  bool isLogin=data['message']=='No data found';
  if(!isLogin)
  {
    SharedPreferences shared = await SharedPreferences.getInstance();
    String employeeID = data['EmployeeID'].toString();
    String employeeName = data['EmployeeName'];
    shared.setInt('areaId', areaId);
    shared.setString("EmployeeID", employeeID);
    shared.setString("EmployeeName", employeeName);

  }

  return isLogin;


  }

}