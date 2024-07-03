import 'package:base_uncia/bloc/login_bloc/login_bloc.dart';
import 'package:base_uncia/bloc/login_bloc/login_repo.dart';
import 'package:base_uncia/locator.dart';
import 'package:base_uncia/routes/router.dart';
import 'package:base_uncia/service/common_service/dialog_service.dart';
import 'package:base_uncia/service/remote_config_service/firebase_helper.dart';
import 'package:base_uncia/service/remote_config_service/remote_config_service.dart';
import 'package:base_uncia/widgets/dialog_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'service/common_service/network_service.dart';





void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupLocator();
  locator<ConnectivityService>().init();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  //await locator<FirebaseRemoteHelper>().configure();
  //locator<RemoteConfigService>().config;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => LoginBloc(logInRepo: LoginRepoImplement())),
        ],
        child: ScreenUtilInit(
          builder: (context,child) => MaterialApp(
            title: 'Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            initialRoute:  Routes.login,
            builder: _setupDialogManager,
            debugShowCheckedModeBanner: false,
            navigatorKey: navigationService.navigatorKey,
            onGenerateRoute: (settings) => AppRouter.generateRoute(settings),
          ),
        )
    );
  }

  Widget _setupDialogManager(context, widget) {
    return Navigator(
      key: locator<DialogService>().dialogNavigationKey,
      onGenerateRoute: (settings) => MaterialPageRoute(builder: (context) {
        return DialogWidget(
            child: widget
        );
      }),
    );
  }
}