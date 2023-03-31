import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lovelife/ui/routes/rout_names.dart';

import '../../../logic/view_model/auth_manager.dart';
import '../../../model/helper/service_locator.dart';
import '../../themes/constants.dart';
import '../../widgets/custom_button.dart';
import 'otp_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController numberController = TextEditingController();

  CountryCode? countryCode;
  String dialCode = "";
  final countryPicker = const FlCountryCodePicker();
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
              child: Column(children: [
                Container(
                  width: double.infinity,
                  height: h10p * 4,
                  child: Stack(
                    children: [
                      Positioned(
                          left: w10p * 6,
                          top: h1p * 8,
                          child: Image.asset(
                            'assets/images/heart.png',
                            width: w10p * 1,
                          )),
                      Positioned(
                          right: 0,
                          child: SvgPicture.asset(
                            'assets/images/couple.svg',
                            height: h10p * 3,
                          )),
                      Positioned(
                          left: w1p * 6,
                          top: h10p * 1,
                          child: Text(
                            'Login to\na lovely\nlife.',
                            style: TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                color: kTextColor),
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: w1p * 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Enter your mobile number',
                        style: TextStyle(
                            fontSize: 16,
                            color: kINputLabelColor,
                            fontWeight: FontWeight.w600),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: h1p * 3),
                        child: TextField(
                          controller: numberController,
                          keyboardType: const TextInputType.numberWithOptions(),
                          style: TextStyle(
                              color: kInputTextColor,
                              fontWeight: FontWeight.w600),
                          decoration: InputDecoration(
                            fillColor: kInputColor,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide.none),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: w1p * 2),
                            prefixIcon: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: w1p * 3, right: w1p * 2),
                                    child: InkWell(
                                      onTap: () async {
                                        final code = await countryPicker
                                            .showPicker(context: context);
                                        setState(() {
                                          countryCode = code;
                                          dialCode = countryCode!.dialCode;
                                        });
                                      },
                                      child: Container(
                                        child: ClipRRect(
                                            child: countryCode != null
                                                ? countryCode!.flagImage
                                                : Container(
                                                    height: h1p * 4,
                                                    width: w1p * 8.2,
                                                    child: Image.asset(
                                                      "assets/images/Flag_of_India.png",
                                                      fit: BoxFit.fill,
                                                    ),
                                                  )),
                                      ),
                                    )),
                                InkWell(
                                  child: Text(
                                    countryCode?.dialCode ?? "+91",
                                    style: TextStyle(
                                        color: kInputTextColor,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                SizedBox(
                                  width: w1p * 2,
                                ),
                                Container(
                                  height: h1p * 3,
                                  width: w1p * .5,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: w1p * 3,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          print("dsjodig");
                          if (numberController.text.trim().length < 10 ||
                              numberController.text.trim().length > 10) {
                            progress!.show();
                            Fluttertoast.showToast(
                                msg: "Please enter a valid mobile number",
                                textColor: Colors.red);
                            progress.dismiss();
                          } else {
                            progress!.show();

                            await getIt<AuthManager>()
                                .savePhoneNumber(numberController.text.trim());

                            await getIt<AuthManager>()
                                .verifyPhone(numberController.text.trim());
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OtpScreen(null)));
                            progress.dismiss();
                          }
                        },
                        child: Padding(
                          padding: EdgeInsets.only(top: h1p * 4),
                          child: CustomButton(
                              tap: () async {
                                if (numberController.text.trim().length < 10 ||
                                    numberController.text.trim().length > 10) {
                                  Fluttertoast.showToast(
                                      msg: "Please enter a valid mobile number",
                                      textColor: Colors.red);
                                } else {
                                  print("3874872");
                                  await getIt<AuthManager>().savePhoneNumber(
                                      numberController.text.trim());

                                  await getIt<AuthManager>().verifyPhone(
                                      numberController.text.trim());
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              OtpScreen(null)));
                                }
                              },
                              text: 'Continue'),
                        ),
                      ),
                      SizedBox(height: h1p * 3),
                      Center(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: TextStyle(color: kAltTextColor),
                            children: [
                              TextSpan(
                                  text:
                                      "By continue to login, you accept our company’s "),
                              TextSpan(
                                text: 'Term & conditions',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: kAltDarkTextColor,
                                    decoration: TextDecoration.underline),
                              ),
                              TextSpan(text: ' and '),
                              TextSpan(
                                text: 'Privacy policies.',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: kAltDarkTextColor,
                                    decoration: TextDecoration.underline),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ]),
            ),
          ),
        );
      }));
    });
  }
}
