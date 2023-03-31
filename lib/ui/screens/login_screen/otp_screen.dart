import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:lovelife/ui/routes/rout_names.dart';
import 'package:provider/provider.dart';

import '../../../logic/view_model/auth_manager.dart';
import '../../../model/helper/service_locator.dart';
import '../../themes/constants.dart';

class OtpScreen extends StatefulWidget {
  Map<String, dynamic>? element;

  OtpScreen(this.element);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final FocusNode pinputFocusNode = FocusNode();
  final pinController = TextEditingController();

  List<TextStyle> otpTextStyles = [
    TextStylez.textStyle14,
    TextStylez.textStyle14,
    TextStylez.textStyle14,
    TextStylez.textStyle14,
    TextStylez.textStyle14,
    TextStylez.textStyle14,
  ];

  @override
  Widget build(BuildContext context) {
    String phoneNumber = Provider.of<AuthManager>(context).phno;

    return LayoutBuilder(builder: (context, constraints) {
      double maxHeight = constraints.maxHeight;
      double maxWidth = constraints.maxWidth;
      double h1p = maxHeight * 0.01;
      double h10p = maxHeight * 0.1;
      double w10p = maxWidth * 0.1;
      double w1p = maxWidth * 0.01;
      return ProgressHUD(child: Builder(builder: (context) {
        final progress = ProgressHUD.of(context);
        return SafeArea(
            child: Scaffold(
                body: Center(
          child: ListView(
            children: [
              SizedBox(
                height: h10p * 1.7,
              ),
              Text(
                "Verify Account",
                // style: TextStylez.textStyle8,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: h1p * 3,
              ),
              Text(
                "Enter 6 digit code we have sent\nto $phoneNumber",
                // style: TextStylez.textStyle4,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: h1p * 5),
              Padding(
                padding: EdgeInsets.only(left: w1p * 6, right: w1p * 2),
                child: OtpTextField(
                  numberOfFields: 6,
                  borderColor: Colors.black,
                  focusedBorderColor: Colors.black,
                  styles: otpTextStyles,
                  showFieldAsBox: false,
                  borderWidth: w1p * .5,
                  margin: EdgeInsets.only(right: w1p * 4),
                  enabledBorderColor: Colors.black,
                  onCodeChanged: (String code) {},
                  onSubmit: (String verificationCode) async {
                    progress!.show();
                    if (widget.element == null) {
                      bool? isVerify = await getIt<AuthManager>()
                          .verifyExistingUser(verificationCode, context);
                      if (isVerify == true) {
                        Navigator.pushNamed(context, userDataScreen);
                      }
                    } else {
                      bool isVerify = await getIt<AuthManager>()
                          .verify(verificationCode, widget.element!);
                      if (isVerify == true) {
                        Navigator.pushNamed(context, userDataScreen);
                      }
                    }
                    progress.dismiss();
                  },
                ),
              ),
              SizedBox(
                height: h1p * 5,
              ),
              const Text(
                "Haven’t received verification code?",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: h1p * 1,
              ),
              InkWell(
                onTap: () async {
                  // await getIt<AuthManager>()
                  //     .verifyPhone(widget.phoneNo);
                },
                child: const Text(
                  "Resend Code",
                  // style: TextStylez.textStyle16,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: h1p * 18,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: w1p * 6),
                child: Bounceable(
                    onTap: () async {},
                    child: Container(
                      height: h1p * 8,
                      width: maxWidth,
                      decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(40)),
                      child: const Center(
                        child: Text("Verify Now", style: TextStylez.textStyle5),
                      ),
                    )),
              ),
            ],
          ),
        )));
      }));
    });
  }
}
