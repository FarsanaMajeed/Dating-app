import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lovelife/ui/routes/rout_names.dart';
import 'package:lovelife/ui/themes/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/helper/service_locator.dart';

class UserDataScreen extends StatefulWidget {
  @override
  _UserDataScreenState createState() => _UserDataScreenState();
}

class _UserDataScreenState extends State<UserDataScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _genderController = TextEditingController();
  final _ageController = TextEditingController();
  final _occupationController = TextEditingController();

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
          appBar: AppBar(
            backgroundColor: kPrimaryColor,
            automaticallyImplyLeading: false,
            title: Text('Enter User Data'),
          ),
          body: Padding(
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                    ),
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return 'Name is required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: _genderController,
                    decoration: InputDecoration(
                      labelText: 'Gender',
                    ),
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return 'Gender is required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Age',
                    ),
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return 'Age is required';
                      } else if (int.tryParse(value.trim()) == null) {
                        return 'Invalid age';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: _occupationController,
                    decoration: const InputDecoration(
                      labelText: 'Occupation',
                    ),
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return 'Occupation is required';
                      }
                      return null;
                    },
                  ),
                  InkWell(
                    onTap: () async {
                      progress!.show();
                      if (_nameController.text.isNotEmpty &&
                          _genderController.text.isNotEmpty &&
                          _ageController.text.isNotEmpty &&
                          _occupationController.text.isNotEmpty) {
                        await getIt<SharedPreferences>()
                            .setString("name", _nameController.text);
                        await getIt<SharedPreferences>()
                            .setString("age", _ageController.text);
                        await getIt<SharedPreferences>()
                            .setString("gender", _genderController.text);
                        await getIt<SharedPreferences>().setString(
                            "occupation", _occupationController.text);
                        Navigator.pushNamed(context, landingScreen);
                      } else {
                        Fluttertoast.showToast(
                            msg: "Please fill all fields",
                            textColor: Colors.red);
                      }
                      progress.dismiss();
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: h1p * 5),
                      child: buildButton(
                          height: h1p * 7,
                          width: w10p * 8.5,
                          title: "Submit",
                          filled: true),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }));
    });
  }
}
