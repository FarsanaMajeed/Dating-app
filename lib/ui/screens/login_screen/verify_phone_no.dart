import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../logic/view_model/auth_manager.dart';
import '../../../model/helper/service_locator.dart';
import '../../themes/constants.dart';
import '../../widgets/number_field.dart';
import 'otp_screen.dart';

class VerifyPhoneNum extends StatefulWidget {
  Map<String, dynamic> element;

  VerifyPhoneNum({required this.element});

  @override
  State<VerifyPhoneNum> createState() => _VerifyPhoneNoeState();
}

class _VerifyPhoneNoeState extends State<VerifyPhoneNum> {
  TextEditingController numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print("widget.element");
    print(widget.element);
    return LayoutBuilder(builder: (context, constraints) {
      double maxHeight = constraints.maxHeight;
      double maxWidth = constraints.maxWidth;
      double h1p = maxHeight * 0.01;
      double h10p = maxHeight * 0.1;
      double w10p = maxWidth * 0.1;
      double w1p = maxWidth * 0.01;
      return SafeArea(child: ProgressHUD(
        child: Builder(builder: (context) {
          final progress = ProgressHUD.of(context);
          return Scaffold(
              body: Center(
            child: ListView(
              children: [
                SizedBox(
                  height: h1p * 16,
                ),
                const Text(
                  "Verify Phone Number",
                  style: TextStylez.textStyle8,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: h1p * 2,
                ),
                const Text(
                  "Enter your mobile number to register",
                  // style: TextStylez.textStyle4,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: h1p * 8,
                ),
                NumberField(
                    maxWidth: maxWidth,
                    maxHeight: maxHeight,
                    numberController: numberController),
                SizedBox(
                  height: h1p * 30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: w1p * 5),
                  child: Bounceable(
                      onTap: () async {
                        // Navigator.pushNamed(context, otpScreen,);
                        // getIt<SharedPreferences>().setString("name", nameCntlr.text);

                        if (numberController.text.trim().length < 10 ||
                            numberController.text.trim().length > 10) {
                          Fluttertoast.showToast(
                              msg: "Please enter a valid mobile number",
                              textColor: Colors.red);
                        } else {
                          progress!.show();
                          await getIt<AuthManager>()
                              .savePhoneNumber(numberController.text.trim());

                          await getIt<AuthManager>()
                              .verifyPhone(numberController.text.trim());

                          progress.dismiss();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      OtpScreen(widget.element)));
                        }
                        // progress!.show();
                        Fluttertoast.showToast(msg: "sending otp");
                        // progress.dismiss();
                      },
                      child: buildButton(
                          height: h1p * 7,
                          width: w10p * 8.5,
                          title: "Send Code",
                          filled: true)),
                ),
              ],
            ),
          ));
        }),
      ));
    });
  }
}
