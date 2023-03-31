import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:lovelife/model/core/suggestions_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/core/user_details_model.dart';
import '../../model/helper/service_locator.dart';
import '../../model/services/firestore_services.dart';

class AuthManager extends ChangeNotifier {
  String dialCode = "+91";
  String phno = "";
  String verID = "";
  List<SuggestionsModel> suggestionList = [];
  SuggestionsModel? currentSugg;
  List<SuggestionsModel> requestedSugg = [];
  List<SuggestionsModel> receivedSugg = [];
  List<SuggestionsModel> matches = [];

  changeDcode(String code) {
    dialCode = code;
    notifyListeners();
  }

  savePhoneNumber(String phnumber) {
    phno = phnumber;
  }

  Future<void> verifyPhone(String number) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: dialCode + number,
      timeout: const Duration(seconds: 20),
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {
        verID = verificationId;
        print("fsdfgdsdg");

        return;
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future<bool> verify(String pin, Map<String, dynamic> data) async {
    try {
      var value = await FirebaseAuth.instance.signInWithCredential(
        PhoneAuthProvider.credential(verificationId: verID, smsCode: pin),
      );

      if (value.user != null) {
        print(value.user!.uid);

        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool?> verifyExistingUser(String pin, BuildContext context) async {
    try {
      var value = await FirebaseAuth.instance.signInWithCredential(
        PhoneAuthProvider.credential(verificationId: verID, smsCode: pin),
      );

      if (value.user != null) {
        await getIt<SharedPreferences>().setString('userId', value.user!.uid);
        await getIt<SharedPreferences>().setString('userId', value.user!.uid);

        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  fetchSuggestionsList() async {
    List<SuggestionsModel>? data =
        await getIt<FirestoreServices>().getSuggestionsList();

    if (data != null || data!.isNotEmpty) {
      suggestionList = [];
      requestedSugg = [];
      receivedSugg = [];
      matches = [];
      for (var i in data) {
        suggestionList.add(i);
        if (i.status == "requested") {
          requestedSugg.add(i);
        } else if (i.status == "matches") {
          matches.add(i);
        } else if (i.status == "received") {
          receivedSugg.add(i);
        }
      }
    }
  }

  changeCurrentSug(SuggestionsModel sugg) {
    currentSugg = sugg;
  }
}
