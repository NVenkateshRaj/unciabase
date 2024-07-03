import 'package:base_uncia/locator.dart';
import 'package:base_uncia/routes/router.dart';
import 'package:connectivity_plus/connectivity_plus.dart';


class ConnectivityService{
  bool isConnected = false;
  init(){
    Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> result){
      if(result.contains(ConnectivityResult.none)){
        navigationService.pushNamed(Routes.noNetwork);
        isConnected = true;
      }else if(result.contains(ConnectivityResult.wifi) || result.contains(ConnectivityResult.mobile)){
        if(isConnected) {
          navigationService.pop();
          isConnected = false;
        }
      }
    }
    );
  }

}