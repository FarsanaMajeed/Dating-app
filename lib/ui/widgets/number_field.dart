import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../logic/view_model/auth_manager.dart';
import '../../model/helper/service_locator.dart';

class NumberField extends StatefulWidget {
  double maxWidth;
  double maxHeight;
  TextEditingController numberController;
  NumberField(
      {required this.maxWidth,
      required this.maxHeight,
      required this.numberController});

  @override
  State<NumberField> createState() => _NumberFieldState();
}

class _NumberFieldState extends State<NumberField> {
  CountryCode? countryCode;
  String dialCode = "";
  final countryPicker = const FlCountryCodePicker();
  var outLineBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide(
      color: Colors.grey,
    ),
  );
  @override
  Widget build(BuildContext context) {
    double maxHeight = widget.maxHeight;
    double maxWidth = widget.maxWidth;
    double h1p = maxHeight * 0.01;
    double h10p = maxHeight * 0.1;
    double w10p = maxWidth * 0.1;
    double w1p = maxWidth * 0.01;
    return InkWell(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: w1p * 5),
        child: Container(
          width: w10p * 8.5,
          height: h1p * 7.5,
          child: TextFormField(
            controller: widget.numberController,
            onChanged: (_) {
              // getIt<AuthManager>()
              //     .validateMobile(numberController.text);
            },
            keyboardType: const TextInputType.numberWithOptions(),
            textInputAction: TextInputAction.done,
            maxLines: 1,
            decoration: InputDecoration(
              prefixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: w1p * 3, right: w1p * 2),
                      child: InkWell(
                        onTap: () async {
                          final code =
                              await countryPicker.showPicker(context: context);
                          setState(() {
                            countryCode = code;
                            dialCode = countryCode!.dialCode;
                            getIt<AuthManager>()
                                .changeDcode(dialCode.toString());
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
                      // style: TextStyles.textStyle10,
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
              hintText: "Phone Number",
              // hintStyle: TextStylez.textStyle18,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color: Colors.grey,
                ),
              ),
              focusedBorder: outLineBorder,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    getIt<AuthManager>().changeDcode("+91");

    super.dispose();
  }
}
