//import 'dart:js';
//import 'package:js/js.dart';
import 'package:flutter/material.dart';
import 'package:healthiq/const.dart';

import 'package:healthiq/constants/routes.dart';
import 'package:healthiq/services/auth/auth_service.dart';
import 'package:healthiq/views/homescreen.dart';
import 'package:healthiq/views/my_form.dart';
import 'package:healthiq/views/nav_bar.dart';
import 'package:healthiq/views/schedulescreen.dart';
import 'package:healthiq/views/profilescreen.dart';
import 'package:healthiq/views/login_view.dart';
import 'package:healthiq/views/register_view.dart';
import 'package:healthiq/views/verify_email_view.dart';
import 'dart:developer' as devtools show log;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                // ignore: deprecated_member_use
                primary: Colors.purple,
                minimumSize: const Size(double.infinity, 56),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
            )),
        home: Navigation(),
        routes: {
          loginRoute: (context) => const LoginView(),
          registerRoute: (context) => RegisterView(),
          verifyEmailRoute: (context) => VerifyEmailView(),
          homescreenroute: (context) => HomeScreen(),
          schedulescreenroute: (context) => ScheduleScreen(),
          profilescreenroute: (context) => ProfileScreen(),
          myformroute: (context) => MyForm(),
        }),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AuthService.firebase().initialize(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = AuthService.firebase().currentUser;
            if (user != null) {
              if (user.isEmailVerified) {
                return LoginView();
              } else {
                return VerifyEmailView();
              }
            } else {
              return const LoginView();
            }
          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}
