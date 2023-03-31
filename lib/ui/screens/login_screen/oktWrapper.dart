import 'package:flutter/material.dart';
import 'package:lovelife/logic/view_model/auth_manager.dart';
import 'package:lovelife/ui/routes/rout_names.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/helper/service_locator.dart';

class OktWrapper extends StatefulWidget {
  const OktWrapper({Key? key}) : super(key: key);

  @override
  State<OktWrapper> createState() => _LandingState();
}

class _LandingState extends State<OktWrapper> {
  @override
  void initState() {
    navigateHome();
    super.initState();
  }

  navigateHome() async {
    String? uid = await getIt<SharedPreferences>().getString("userId");
    await getIt<AuthManager>().fetchSuggestionsList();

    if (uid != null) {
      print(uid);
      Navigator.pushNamedAndRemoveUntil(
          context, userDataScreen, (route) => false);
    } else {
      Navigator.pushNamedAndRemoveUntil(context, signUp, (route) => false);
    }

    await Future.delayed(Duration(milliseconds: 1000), () {});
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double maxHeight = constraints.maxHeight;
      double maxWidth = constraints.maxWidth;
      double h1p = maxHeight * 0.01;
      double h10p = maxHeight * 0.1;
      double w10p = maxWidth * 0.1;
      double w1p = maxWidth * 0.01;

      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    });
  }
}
