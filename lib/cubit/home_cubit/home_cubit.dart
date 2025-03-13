import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled7/controllers/check_permissions_controller.dart';
import 'package:untitled7/controllers/get_info_customer_controller.dart';
import 'package:untitled7/models/Customer.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());



  void getDataAndCheckPermission()
 async {
  emit(HomeLoading());
  SharedPreferences shared = await SharedPreferences.getInstance();
     int areaId = shared.getInt("areaId")!;
     String employeeID = shared.getString("EmployeeID")!;
try{

     int checkPermissions=await CheckPermissions().checkPermissionsMeth(areaId: areaId, employeeID: employeeID);
     if(checkPermissions==1)
     {
      List<Customer>customers = await GetInfoCustomerController().GetInfoCustomerMeth(areaId: areaId);
      emit(HomeSuccess(customers: customers));


     }
     else{
      emit(HomeNotAllow());
     }
}catch (e)
{
  print(e.toString());
emit(HomeFauler(err: e.toString()));
}
    

  }
}
