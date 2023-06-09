import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lovelife/ui/routes/rout_names.dart';
import 'package:lovelife/ui/routes/routers.dart';
import 'package:provider/provider.dart';

import 'logic/view_model/auth_manager.dart';
import 'model/helper/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await setupServiceLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => getIt<AuthManager>()),
      ],
      child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: Routers.generateRoute,
          initialRoute: welcomeScreen),
    );
  }
}
