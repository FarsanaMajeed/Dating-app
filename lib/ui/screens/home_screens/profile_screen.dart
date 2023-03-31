import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/helper/service_locator.dart';
import '../../../model/services/firestore_services.dart';
import 'curved_painter.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    String? name = getIt<SharedPreferences>().getString("name");
    String? gender = getIt<SharedPreferences>().getString("gender");
    String? age = getIt<SharedPreferences>().getString("age");
    String? occupation = getIt<SharedPreferences>().getString("occupation");
    return LayoutBuilder(builder: (context, constraints) {
      double maxHeight = constraints.maxHeight;
      double maxWidth = constraints.maxWidth;
      double h1p = maxHeight * 0.01;
      double h10p = maxHeight * 0.1;
      double w10p = maxWidth * 0.1;
      double w1p = maxWidth * 0.01;
      return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              margin: EdgeInsets.only(bottom: 60),
              width: double.infinity,
              decoration: new BoxDecoration(
                gradient: new LinearGradient(
                  end: const Alignment(0.0, 0.4),
                  begin: const Alignment(0.0, -1),
                  colors: <Color>[
                    Colors.pink,
                    Colors.pink,
                  ],
                ),
              ),
            ),
            CustomPaint(
              size: Size(
                MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height * 0.31,
              ),
              painter: CurvedPainter(),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: h1p * 16),
                  child: InkWell(
                    onTap: () async {
                      await getIt<FirestoreServices>().getSuggestionsList();
                    },
                    child: const CircleAvatar(
                      radius: 55,
                      backgroundImage: AssetImage('assets/images/3135715.png'),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  name ?? "",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  '$gender, $age',
                  style: TextStyle(fontSize: 18),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: w1p * 6, vertical: h1p * 5),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.info_outline,
                        ),
                        title: Text('Bio'),
                        subtitle: Text(
                          "I am looking for a partner to share my whole life with lots of love",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.location_on_outlined,
                        ),
                        title: Text('Location'),
                        subtitle: Text(
                          'Los Angeles, CA',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.work_outline,
                        ),
                        title: Text('Occupation'),
                        subtitle: Text(
                          occupation ?? "",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: const [
                        Text(
                          '1K',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Followers',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: const [
                        Text(
                          '500',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Following',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Column(
                      children: const [
                        Text(
                          '200',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Posts',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
