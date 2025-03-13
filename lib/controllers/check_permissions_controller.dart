
import 'package:untitled7/helper/API.dart';

class CheckPermissions
{
Future<int> checkPermissionsMeth({required int areaId,required String employeeID })
async {

     dynamic data = await Api().post(url: "Check_Permissions.php", body: {

      "AreaID":'$areaId',
    "EmployeeID":employeeID
     });
    ;
     return data['PermissionStatus'];

}
}