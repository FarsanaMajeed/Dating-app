import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lovelife/model/core/suggestions_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/user_details_model.dart';
import '../helper/service_locator.dart';

class FirestoreServices{
  CollectionReference userInfoCollection = FirebaseFirestore.instance.collection('users');
  CollectionReference suggestionsCollection = FirebaseFirestore.instance.collection('suggestions');

  createUser(UserDetails? userDetails) async {
    await userInfoCollection.doc(userDetails!.uid).set(userDetails.toJson());

    return true;
  }

  Future<List<SuggestionsModel>?> getSuggestionsList() async {
    QuerySnapshot<Object?> data = await suggestionsCollection.get();

    List<QueryDocumentSnapshot> snapshot = data.docs;

    List<SuggestionsModel> weekData = snapshot
        .map(
          (e) => SuggestionsModel.fromJson(e.data() as Map<String, dynamic>,),
    )
        .toList();
    print(weekData);
    return weekData;

  }


}