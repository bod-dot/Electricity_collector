import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../controllers/login_controller.dart';

part 'login_state.dart';

class LoginCubitCubit extends Cubit<LoginState> {
  LoginCubitCubit() : super(LoginInitial());

void loginCub({required int areaId,required int phoneNumber,required String passwrod})
  async{
  emit(LoginLoding());
  try{

    bool isLogin=  await LoginContrloller().loginMeth(areaId: areaId, phoneNumber: phoneNumber, passwrod: passwrod);
    isLogin ?emit(LoginSuccess()):emit(LoginWrongPasswrodOrEmail());

  }catch(e)
  {
    emit(LoginFauild(error: e.toString()));
  }

}

}

