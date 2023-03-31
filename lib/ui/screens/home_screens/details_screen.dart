import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:lovelife/logic/view_model/auth_manager.dart';
import 'package:lovelife/model/core/suggestions_model.dart';
import 'package:provider/provider.dart';

import 'match_screen.dart';

class DetailsPage extends StatefulWidget {
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    SuggestionsModel? sugg = Provider.of<AuthManager>(context).currentSugg;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: Colors.white,
                  expandedHeight: MediaQuery.of(context).size.height * 0.60,
                  floating: true,
                  pinned: true,
                  snap: true,
                  collapsedHeight: 116,
                  actionsIconTheme: IconThemeData(opacity: 0.0),
                  toolbarHeight: 56,
                  titleSpacing: 0,
                  centerTitle: false,
                  leading: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: 40,
                      width: 40,
                      margin: const EdgeInsets.only(left: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    titlePadding: const EdgeInsets.all(0),
                    title: Container(
                      height: 67,
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(28),
                          topRight: Radius.circular(28),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SizedBox(width: 2),
                                  Text(
                                    '${sugg!.name}, ${sugg.age}',
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  SizedBox(
                                    height: 12,
                                    width: 12,
                                    child: Stack(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.blue[300],
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                        ),
                                        const Center(
                                          child: Icon(
                                            Icons.check,
                                            size: 10,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 2),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Icon(
                                    Icons.location_on_outlined,
                                    color: Colors.pink,
                                    size: 14,
                                  ),
                                  Text(
                                    sugg.location ?? "",
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.grey[400],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            height: 34,
                            width: 34,
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.green[300],
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                ),
                                Container(
                                  height: 18,
                                  width: 18,
                                  color: Colors.white,
                                ),
                                Center(
                                  child: Container(
                                    height: 28,
                                    width: 28,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    '9.2',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    background: Container(
                      height: MediaQuery.of(context).size.height * 0.50,
                      child: Stack(
                        children: <Widget>[
                          Positioned.fill(
                            child: Container(
                              padding: EdgeInsets.only(bottom: 86),
                              child: Image.network(
                                sugg.image ?? "",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Divider(
                        height: 1,
                        thickness: 1,
                        indent: 32,
                        endIndent: 32,
                      ),
                      SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Interests',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              '3 Similar',
                              style: TextStyle(
                                color: Colors.deepOrange,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.all(8),
                              padding:
                                  const EdgeInsets.fromLTRB(16, 12, 16, 12),
                              decoration: BoxDecoration(
                                color: Colors.deepOrange.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.shopping_cart_rounded,
                                    color: Colors.deepOrange,
                                    size: 16,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'Shopping',
                                    style: TextStyle(
                                      color: Colors.deepOrange,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(8),
                              padding:
                                  const EdgeInsets.fromLTRB(16, 12, 16, 12),
                              decoration: BoxDecoration(
                                color: Colors.deepOrange.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.library_music,
                                    color: Colors.deepOrange,
                                    size: 16,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'Music',
                                    style: TextStyle(
                                      color: Colors.deepOrange,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(8),
                              padding:
                                  const EdgeInsets.fromLTRB(16, 12, 16, 12),
                              decoration: BoxDecoration(
                                color: Colors.deepOrange.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.local_drink_sharp,
                                    color: Colors.deepOrange,
                                    size: 16,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'Coffe',
                                    style: TextStyle(
                                      color: Colors.deepOrange,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.all(8),
                              padding:
                                  const EdgeInsets.fromLTRB(16, 12, 16, 12),
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.menu_book_rounded,
                                    color: Colors.deepOrange,
                                    size: 16,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'Books',
                                    style: TextStyle(
                                      color: Colors.deepOrange,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(8),
                              padding:
                                  const EdgeInsets.fromLTRB(16, 12, 16, 12),
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.airplanemode_active,
                                    color: Colors.deepOrange,
                                    size: 16,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'Travel',
                                    style: TextStyle(
                                      color: Colors.deepOrange,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(8),
                              padding:
                                  const EdgeInsets.fromLTRB(16, 12, 16, 12),
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.sports_basketball,
                                    color: Colors.deepOrange,
                                    size: 16,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'Basketball',
                                    style: TextStyle(
                                      color: Colors.deepOrange,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          sugg.bio ?? "",
                          style: TextStyle(
                            color: Colors.grey[600],
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 800),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 64,
                      width: 64,
                      margin: EdgeInsets.fromLTRB(16, 16, 10, 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.close_rounded,
                          color: Colors.deepOrange,
                          size: 28,
                        ),
                      ),
                    ),
                    Container(
                      height: 64,
                      width: 64,
                      margin: EdgeInsets.fromLTRB(10, 16, 16, 16),
                      decoration: BoxDecoration(
                        gradient: new LinearGradient(
                          end: const Alignment(0.0, 0.4),
                          begin: const Alignment(0.0, -1),
                          colors: <Color>[
                            Colors.pink,
                            Colors.deepOrange,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MatchPage(),
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.favorite_rounded,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
