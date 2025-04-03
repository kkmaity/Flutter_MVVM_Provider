import 'package:flutter/material.dart';
import 'package:flutter_nvvm_architecture/utils/routes/routes.dart';
import 'package:flutter_nvvm_architecture/utils/routes/routes_names.dart';
import 'package:flutter_nvvm_architecture/viewModel/auth_viewmodel.dart';
import 'package:flutter_nvvm_architecture/viewModel/home_view_model.dart';
import 'package:flutter_nvvm_architecture/viewModel/user_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => UserViewModel()),
        ChangeNotifierProvider(create: (_) => HomeViewModel())
      ],
      child: WillPopScope(
        onWillPop: () async {
          Navigator.pop(context);
          return true;
        },
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: RouteNames.splashScreen,
          onGenerateRoute: Routes.generateRoutes,
        ),
      ),
    );
  }
}
