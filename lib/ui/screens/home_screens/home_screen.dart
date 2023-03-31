import 'package:flutter/material.dart';
import 'package:flutter_swipecards/flutter_swipecards.dart';
import 'package:get_it/get_it.dart';
import 'package:lovelife/logic/view_model/auth_manager.dart';
import 'package:lovelife/model/helper/service_locator.dart';
import 'package:lovelife/ui/routes/rout_names.dart';
import 'package:provider/provider.dart';

import 'curved_painter.dart';
import 'details_screen.dart';
import 'match_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int currIndex;
  int indexPage = 0;
  int indexType = 0;
  int isCurrentItem = 0;
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
        return Scaffold(
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
              CustomScrollView(
                slivers: [
                  SliverAppBar(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    toolbarHeight: 56,
                    titleSpacing: 0,
                    automaticallyImplyLeading: false,
                    centerTitle: true,
                    title: Padding(
                      padding: EdgeInsets.only(top: h1p * 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'People Nearby',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(24, 10, 24, 0),
                          child: AspectRatio(
                            aspectRatio: 0.7,
                            child: InkWell(
                              onTap: () {},
                              child: TinderSwapCard(
                                swipeUp: true,
                                swipeDown: true,
                                orientation: AmassOrientation.bottom,
                                totalNum: 7,
                                stackNum: 3,
                                swipeEdge: 4.0,
                                maxWidth: h1p * 52,
                                maxHeight: h1p * 65,
                                minWidth: h1p * 47,
                                minHeight: h1p * 60,
                                cardBuilder: (context, index) {
                                  index = index;
                                  currIndex = index;
                                  return InkWell(
                                    onTap: () {
                                      getIt<AuthManager>().changeCurrentSug(
                                          link.suggestionList[index]);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => DetailsPage(),
                                          ));
                                    },
                                    child: Card(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      shadowColor:
                                          Colors.white.withOpacity(0.9),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child:
                                            link.suggestionList[index].image ==
                                                    null
                                                ? Image.asset(
                                                    "assets/images/prfle.png")
                                                : Image.network(
                                                    link.suggestionList[index]
                                                            .image ??
                                                        "",
                                                    fit: BoxFit.fill,
                                                  ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: h10p * 3),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
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
                            onPressed: () {
                              setState(() {
                                link.suggestionList.shuffle();
                              });
                            },
                            icon: const Icon(
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
                            gradient: const LinearGradient(
                              end: Alignment(0.0, 0.4),
                              begin: Alignment(0.0, -1),
                              colors: <Color>[
                                Colors.pink,
                                Colors.pink,
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
                            onPressed: () async {
                              await getIt<AuthManager>().changeCurrentSug(
                                  link.suggestionList[currIndex]);

                              Navigator.pushNamed(context, matchScreen);
                            },
                            icon: const Icon(
                              Icons.favorite_rounded,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      });
    });
  }
}
