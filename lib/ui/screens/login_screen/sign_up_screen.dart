import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

import '../../routes/rout_names.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../themes/constants.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool checkValue = false;
  late String emailMessage;
  late String nameMessage;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // emailMessage = Provider.of<AuthManager>(context).emailMsg;
    // nameMessage = Provider.of<AuthManager>(context).nameMsg;
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
          child: Padding(
            padding: EdgeInsets.only(
              left: w1p * 6,
              right: w1p * 6,
            ),
            child: ListView(children: [
              SizedBox(
                height: h1p * 14,
              ),
              Text(
                "Find your partner",
                style: TextStylez.textStyle8,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: h1p * 7,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Full Name",
                    style: TextStylez.textStyle9,
                  ),
                ],
              ),
              SizedBox(height: h1p * 2),
              Container(
                height: h1p * 7,
                child: TextFormField(
                  controller: nameController,
                  onChanged: (_) async {},
                  decoration: InputDecoration(
                      hintText: "",
                      fillColor: whiteTwo,
                      enabledBorder: outLineBorder,
                      focusedBorder: outLineBorder),
                ),
              ),
              SizedBox(
                height: h1p * 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Email Address",
                    style: TextStylez.textStyle9,
                  ),
                ],
              ),
              SizedBox(
                height: h1p * 2,
              ),
              Container(
                height: h1p * 7,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: TextFormField(
                  controller: emailController,
                  onChanged: (_) async {},
                  decoration: InputDecoration(
                      fillColor: whiteTwo,
                      enabledBorder: outLineBorder,
                      focusedBorder: outLineBorder),
                ),
              ),
              SizedBox(
                height: h1p * 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                      value: checkValue,
                      onChanged: (val) {
                        setState(() {
                          checkValue = !checkValue;
                        });
                      }),
                  const Text(
                    "I have agree to our ",
                    style: TextStylez.textStyle11,
                  ),
                  const Text("Terms and Condition",
                      style: TextStylez.textStyle12),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: h1p * 6),
                child: InkWell(
                  onTap: () {
                    if (checkValue == false) {
                      Fluttertoast.showToast(
                          msg: "Please agree to terms and conditions");
                      return;
                    } else if (nameController.text.isNotEmpty &&
                        emailController.text.isNotEmpty) {
                      Navigator.pushNamed(context, verify, arguments: {
                        "email": emailController.text.trim(),
                        "fullName": nameController.text
                      });
                    } else {
                      Fluttertoast.showToast(
                          msg: "Please fill all Fields", textColor: Colors.red);
                    }
                  },
                  child: buildButton(
                      width: maxWidth,
                      title: "Sign Up",
                      height: h1p * 7,
                      filled: true),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: h1p * 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStylez.textStyle11,
                    ),
                    InkWell(
                      onTap: () {
                        progress!.show();

                        Navigator.pushNamed(context, login);
                        progress.dismiss();
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: w1p * 2, vertical: h1p),
                        child: Text("Sign In", style: TextStylez.textStyle13),
                      ),
                    ),
                  ],
                ),
              )
            ]),
          ),
        )));
      }));
    });
  }
}
