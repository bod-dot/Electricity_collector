import 'package:untitled7/helper/API.dart';

class ChagePasswrodController
{
  Future<bool> chagePasswrodMeth({required String employeeID,required String oldPassword,required String newPasswrod})
 async {
    dynamic data = await Api().post(url: 'ChagePassewordEmployees.php', body: {
      'EmployeeID':employeeID,
      'EmployeeNewPassword':newPasswrod,
      'EmployeesOldPasswrord':oldPassword
    });
    return data['message']=='Success';
  }
}