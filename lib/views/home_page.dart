import 'package:example_project/configs/size_config.dart';
import 'package:example_project/widgets/size_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  @override
  void initState() {
    tabWords = ["all", "Web Show", "Bollywood", "Hollywood", "Buzz video"];
    tabController = TabController(length: 5, vsync: this);
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: Container(
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
                    width: getWidth(15),
                  ),
                  const Icon(
                    Icons.more_horiz,
                    color: Colors.white,
                  )
                ]),
                SizedHeight(20),
                Container(
                  alignment: Alignment.center,
                  height: getHeight(45),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          scrollPadding: EdgeInsets.zero,
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: getWidth(5)),
                              fillColor: Colors.grey[900],
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(getWidth(8)),
                                  borderSide: BorderSide())),
                        ),
                      ),
                      SizedWidth(15),
                      Container(
                        height: getHeight(40),
                        width: getHeight(40),
                        decoration: BoxDecoration(
                            gradient: indicatorGradient(),
                            borderRadius: BorderRadius.circular(getWidth(10))),
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
                      indicator: BoxDecoration(
                          gradient: indicatorGradient(),
                          borderRadius: BorderRadius.circular(getWidth(7))),
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
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: getHeight(180),
                          width: SizeConfig.width,
                          decoration: BoxDecoration(
                              color: Colors.grey[800],
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://source.unsplash.com/random/2"),
                                  fit: BoxFit.cover),
                              borderRadius:
                                  BorderRadius.circular(getWidth(35))),
                          child: ,
                        ),
                        
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget tabBarWidget(
    String title,
  ) {
    return Container(
        alignment: Alignment.center,
        width: title.length.toDouble() * 14,
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
