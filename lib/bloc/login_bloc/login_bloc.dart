import 'package:base_uncia/bloc/login_bloc/login_events.dart';
import 'package:base_uncia/bloc/login_bloc/login_repo.dart';
import 'package:base_uncia/bloc/login_bloc/login_state.dart';
import 'package:base_uncia/locator.dart';
import 'package:base_uncia/routes/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LoginBloc extends Bloc<LoginEvents,LoginState>{

  final LogInRepository logInRepo;
  dynamic body;
  int loginId = 0;
  bool isLoading = false;

  LoginBloc({required this.logInRepo}): super(LogInInitState()){
    on<LoginEvents>((events,emit) async{
      if(events == LoginEvents.updateState){
        emit(LogInInErrorState());
        emit(LogInUpdateState());
      }
      if(events == LoginEvents.alreadyLogin){
        await checkLoginDetails();
      } else if(events == LoginEvents.loginButtonTap){
        await loginButtonTapped(emit);
      }
      else if(events == LoginEvents.registerButtonTap){
        await registerButtonTapped(emit);
      }else{

      }
    });
  }

  checkLoginDetails(){
    Future.delayed(const Duration(milliseconds: 5000),(){
      navigationService.pushNamed(Routes.login);
    });
  }

  loginButtonTapped(Emitter<LoginState> emit)async{}

  registerButtonTapped(Emitter<LoginState> emit)async{

  }


}