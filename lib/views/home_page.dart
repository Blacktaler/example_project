import 'dart:ui';

import 'package:example_project/configs/size_config.dart';
import 'package:example_project/models/media_product.dart';
import 'package:example_project/widgets/home_tabview_widget.dart';
import 'package:example_project/widgets/size_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController tabController;
  late List<String> tabWords;
  late List<MediaProduct> products;
  late MediaProduct mainProduct;
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive,
        overlays: [SystemUiOverlay.bottom]);

    mainProduct = MediaProduct(
        name: "Pirates of the Caribbean",
        rating: 4.7,
        views: "50M",
        image: "assets/images/pirates_of_caribbean.jpeg");
    products = [
      MediaProduct(
          name: "Johnny English",
          rating: 4.5,
          views: "15M",
          image: "assets/images/johnny.jpeg"),
      MediaProduct(
          name: "Johnny English 2",
          rating: 4.7,
          views: "25M",
          image: "assets/images/johnny2.jpeg"),
      MediaProduct(
          name: "Man vs Bee",
          rating: 4.4,
          views: "35M",
          image: "assets/images/man_vs_bee.jpeg"),
      MediaProduct(
          name: "Tom and Jerry",
          rating: 4.9,
          views: "45M",
          image: "assets/images/tom_and_jerry.jpeg"),
    ];

    tabWords = ["all", "Web Show", "Bollywood", "Hollywood", "Buzz video"];
    tabController = TabController(length: 5, vsync: this);
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            child: Container(
              color: Colors.black,
              child: SafeArea(
                child: Container(
                  height: SizeConfig.height,
                  width: SizeConfig.width,
                  color: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Row(children: [
                        const Icon(
                          Icons.grid_view_rounded,
                          color: Colors.white,
                        ),
                        const Spacer(),
                        const Icon(
                          CupertinoIcons.bell,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: (15),
                        ),
                        const Icon(
                          Icons.more_horiz,
                          color: Colors.white,
                        )
                      ]),
                      SizedHeight(20),
                      Container(
                        alignment: Alignment.center,
                        height: 45,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: TextFormField(
                                style: TextStyle(color: Colors.white),
                                
                                scrollPadding: EdgeInsets.zero,
                                decoration: InputDecoration(
                                    prefixIcon: Container(
                                      padding: EdgeInsets.symmetric(horizontal: 10),
                                      alignment: Alignment.centerLeft,
                                      child: Text("Search movie, series..",style: TextStyle(color: Colors.white70),)),
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: (5)),
                                    fillColor: Colors.grey[900],
                                    filled: true,
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular((8)),
                                        borderSide: BorderSide())),
                              ),
                            ),
                            SizedWidth(15),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  gradient: indicatorGradient(),
                                  borderRadius: BorderRadius.circular((10))),
                              child: Icon(
                                CupertinoIcons.search,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedHeight(20),
                      Container(
                        height: 30,
                        child: TabBar(
                          labelPadding: EdgeInsets.zero,
                            indicator: BoxDecoration(
                                gradient: indicatorGradient(),
                                borderRadius: BorderRadius.circular(7)),
                            indicatorPadding: EdgeInsets.zero,
                            indicatorWeight: 2,
                            indicatorSize: TabBarIndicatorSize.label,
                            indicatorColor: Colors.red,
                            controller: tabController,
                            isScrollable: true,
                            tabs: [
                              tabBarWidget(tabWords[0]),
                              tabBarWidget(tabWords[1]),
                              tabBarWidget(tabWords[2]),
                              tabBarWidget(tabWords[3]),
                              tabBarWidget(tabWords[4]),
                            ]),
                      ),
                      SizedHeight(20),
                      Expanded(
                        child: TabBarView(controller: tabController, children: [
                          HomeTabviewWidget(
                              mainProduct: mainProduct, products: products),
                          HomeTabviewWidget(
                              mainProduct: mainProduct, products: products),
                          HomeTabviewWidget(
                              mainProduct: mainProduct, products: products),
                          HomeTabviewWidget(
                              mainProduct: mainProduct, products: products),
                          HomeTabviewWidget(
                              mainProduct: mainProduct, products: products),
                        ]),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 10,
              right: 10,
              left: 10,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                    child: Container(
                      width: SizeConfig.width,
                      height: 80,
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(.3),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          bottomNavBarItem("Home", CupertinoIcons.home,
                              Colors.orange, Colors.orange[800]!),
                          bottomNavBarItem("Live TV", CupertinoIcons.play_rectangle,
                              Colors.white, Colors.white),
                          bottomNavBarItem("Home", CupertinoIcons.game_controller,
                              Colors.white, Colors.white),
                          bottomNavBarItem("Home", Icons.settings,
                              Colors.white,Colors.white),
                        ],
                      ),
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }

  Column bottomNavBarItem(
      String title, IconData icon, Color textColor, Color iconColor) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: iconColor,
        ),
        SizedHeight(5),
        Text(
          title,
          style: TextStyle(color: textColor, fontSize: 13),
        )
      ],
    );
  }

  BorderRadius cardRadius() {
    return BorderRadius.only(
        bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25));
  }

  Widget tabBarWidget(
    String title,
  ) {
    return Container(
        alignment: Alignment.center,
        width: title.length.toDouble() * 12,
        child: Text(title));
  }

  LinearGradient indicatorGradient() {
    return LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.yellow[800]!,
          Colors.orange[900]!,
          Colors.red,
        ]);
  }
}
