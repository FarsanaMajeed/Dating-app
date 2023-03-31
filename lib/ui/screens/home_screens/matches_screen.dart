import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../logic/view_model/auth_manager.dart';
import '../../themes/constants.dart';

class MatchesScreen extends StatefulWidget {
  const MatchesScreen({Key? key}) : super(key: key);

  @override
  State<MatchesScreen> createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double maxHeight = constraints.maxHeight;
      double maxWidth = constraints.maxWidth;
      double h1p = maxHeight * 0.01;
      double h10p = maxHeight * 0.1;
      double w10p = maxWidth * 0.1;
      double w1p = maxWidth * 0.01;
      return Consumer<AuthManager>(builder: (context, link, child) {
        return DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.pink,
                automaticallyImplyLeading: false,
                title: Text('Matches'),
                centerTitle: true,
                bottom: TabBar(
                  tabs: [
                    Tab(
                        child: Text(
                      "Request",
                      style: TextStyle(color: Colors.white),
                    )),
                    Tab(
                        child: Text(
                      "Matches",
                      style: TextStyle(color: Colors.white),
                    )),
                    Tab(
                        child: Text(
                      "Received",
                      style: TextStyle(color: Colors.white),
                    )),
                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  ListView.builder(
                      itemCount: link.requestedSugg.length,
                      itemBuilder: (context, indx) {
                        return link.requestedSugg.isNotEmpty
                            ? Padding(
                                padding: EdgeInsets.only(
                                  left: w1p * 3,
                                  right: w1p * 3,
                                  top: h1p * 3,
                                ),
                                child: Card(
                                  elevation: .1,
                                  child: Container(
                                    height: h10p * 1.9,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.pink,
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: h1p * 3, left: w1p * 5.5),
                                          child: Container(
                                            height: h10p * 1.3,
                                            width: h10p * 1.3,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            child: Image.network(
                                              "${link.requestedSugg[indx].image}",
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: h1p * 4, left: w1p * 6),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                link.requestedSugg[indx].name ??
                                                    "",
                                                style: TextStylez.textStyle37,
                                              ),
                                              SizedBox(
                                                height: h1p * 1.3,
                                              ),
                                              Text(
                                                "${link.requestedSugg[indx].age ?? ""}",
                                                style: TextStylez.textStyle39,
                                              ),
                                              SizedBox(
                                                height: h1p * 1.3,
                                              ),
                                              Text(
                                                "${link.requestedSugg[indx].location ?? ""}",
                                                style: TextStylez.textStyle39,
                                              ),
                                              SizedBox(
                                                height: h1p * 3,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : Container();
                      }),
                  ListView.builder(
                      itemCount: link.matches.length,
                      itemBuilder: (context, indx) {
                        return link.matches.isNotEmpty
                            ? Padding(
                                padding: EdgeInsets.only(
                                  left: w1p * 3,
                                  right: w1p * 3,
                                  top: h1p * 3,
                                ),
                                child: Card(
                                  elevation: .1,
                                  child: Container(
                                    height: h10p * 2.6,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.pink,
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: h1p * 3, left: w1p * 5.5),
                                          child: Container(
                                            height: h10p * 1.3,
                                            width: h10p * 1.3,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            child: Image.network(
                                              "${link.matches[indx].image}",
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: h1p * 4, left: w1p * 6),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                link.matches[indx].name ?? "",
                                                style: TextStylez.textStyle37,
                                              ),
                                              SizedBox(
                                                height: h1p * 1.3,
                                              ),
                                              Text(
                                                "${link.matches[indx].age ?? ""}",
                                                style: TextStylez.textStyle39,
                                              ),
                                              SizedBox(
                                                height: h1p * 1.3,
                                              ),
                                              Text(
                                                "${link.matches[indx].location ?? ""}",
                                                style: TextStylez.textStyle39,
                                              ),
                                              SizedBox(
                                                height: h1p * 3,
                                              ),
                                              Row(
                                                children: [
                                                  InkWell(
                                                    onTap: () async {},
                                                    child: Container(
                                                      height: h10p * .5,
                                                      width: w10p * 2.4,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(6)),
                                                      child: const Center(
                                                        child: Text("Delete",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .pink)),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: w1p * 2.5,
                                                  ),
                                                  InkWell(
                                                    onTap: () async {},
                                                    child: Container(
                                                      height: h10p * .5,
                                                      width: w10p * 2.4,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(6)),
                                                      child: const Center(
                                                        child: Text("Request",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .pink)),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : Container();
                      }),
                  ListView.builder(
                      itemCount: link.receivedSugg.length,
                      itemBuilder: (context, indx) {
                        return link.receivedSugg.isNotEmpty
                            ? Padding(
                                padding: EdgeInsets.only(
                                  left: w1p * 3,
                                  right: w1p * 3,
                                  top: h1p * 3,
                                ),
                                child: Card(
                                  elevation: .1,
                                  child: Container(
                                    height: h10p * 1.9,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.pink,
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: h1p * 3, left: w1p * 5.5),
                                          child: Container(
                                            height: h10p * 1.3,
                                            width: h10p * 1.3,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            child: Image.network(
                                              "${link.receivedSugg[indx].image}",
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: h1p * 4, left: w1p * 6),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                link.receivedSugg[indx].name ??
                                                    "",
                                                style: TextStylez.textStyle37,
                                              ),
                                              SizedBox(
                                                height: h1p * 1.3,
                                              ),
                                              Text(
                                                "${link.receivedSugg[indx].age ?? ""}",
                                                style: TextStylez.textStyle39,
                                              ),
                                              SizedBox(
                                                height: h1p * 1.3,
                                              ),
                                              Text(
                                                "${link.receivedSugg[indx].location ?? ""}",
                                                style: TextStylez.textStyle39,
                                              ),
                                              SizedBox(
                                                height: h1p * 3,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : Container();
                      }),
                ],
              ),
            ));
      });
    });
  }
}
