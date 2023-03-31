import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

import '../../routes/rout_names.dart';
import '../../themes/constants.dart';
import '../../widgets/custom_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double maxHeight = constraints.maxHeight;
      double maxWidth = constraints.maxWidth;
      double h1p = maxHeight * 0.01;
      double h10p = maxHeight * 0.1;
      double w10p = maxWidth * 0.1;
      double w1p = maxWidth * 0.01;
      return ProgressHUD(child: Builder(builder: (context) {
        final progress = ProgressHUD.of(context);
        return Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: w10p),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: w1p, vertical: h10p * .8),
                        alignment: Alignment.center,
                        child: Image.asset(
                          'assets/images/welcome.png',
                          width: w10p * 7,
                        )),
                    const Text(
                      "Let's get closer",
                      style: TextStyle(color: kLightTextColor, fontSize: 18.0),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "The best place to\nmeet your future\npartner.",
                      style: TextStyle(
                          color: kTextColor,
                          fontSize: 36.0,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: h1p * 5),
                    CustomButton(
                      tap: () {
                        progress!.show();
                        Navigator.pushNamed(context, oktWrapper);
                        progress.dismiss();
                      },
                      text: 'Get Started',
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        );
      }));
    });
  }
}
