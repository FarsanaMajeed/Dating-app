

import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../logic/view_model/auth_manager.dart';
import '../services/firestore_services.dart';

final getIt = GetIt.instance;

Future <void> setupServiceLocator() async{
  getIt.registerSingleton<SharedPreferences>(await SharedPreferences.getInstance());

  getIt.registerSingleton<FirestoreServices>(FirestoreServices());
  getIt.registerSingleton<AuthManager>(AuthManager());





}