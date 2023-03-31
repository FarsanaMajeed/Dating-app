import 'package:flutter/material.dart';
import 'package:lovelife/ui/screens/landing_screen.dart';
import 'package:lovelife/ui/screens/login_screen/add_user_details.dart';
import 'package:lovelife/ui/screens/login_screen/login_screen.dart';
import 'package:lovelife/ui/screens/login_screen/oktWrapper.dart';
import 'package:lovelife/ui/screens/login_screen/otp_screen.dart';
import 'package:lovelife/ui/screens/login_screen/sign_up_screen.dart';
import 'package:lovelife/ui/screens/welcome_screen/welcome_screen.dart';

import '../screens/home_screens/match_screen.dart';
import '../screens/login_screen/verify_phone_no.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/welcomeScreen':
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/signUp':
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      // case '/otpScreen':
      //   return MaterialPageRoute(builder: (_) => const OtpScreen());
      case '/landingScreen':
        return MaterialPageRoute(builder: (_) => const LandingScreen());
      case '/userDataScreen':
        return MaterialPageRoute(builder: (_) =>  UserDataScreen());
      case '/oktWrapper':
        return MaterialPageRoute(builder: (_) =>  OktWrapper());
      case '/matchScreen':
        return MaterialPageRoute(builder: (_) =>  MatchPage());
      case '/verify':
        Map<String, dynamic> data = settings.arguments as Map<String, dynamic>;

        return MaterialPageRoute(
            settings: settings, builder: (_) => VerifyPhoneNum(element: data));
      default:
        return MaterialPageRoute(
            builder: (_) =>
                Scaffold(
                  body: Center(
                    child:
                    Text('There is no route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}