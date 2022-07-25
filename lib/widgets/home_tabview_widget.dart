import 'dart:ui';

import 'package:example_project/configs/size_config.dart';
import 'package:example_project/models/media_product.dart';
import 'package:example_project/widgets/home_card_widget.dart';
import 'package:example_project/widgets/play_widget.dart';
import 'package:example_project/widgets/size_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeTabviewWidget extends StatelessWidget {
  HomeTabviewWidget({required this.mainProduct,required this.products});
  MediaProduct mainProduct;
  List<MediaProduct> products;
  
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(right: 10),
                height: 180,
                width: SizeConfig.width,
                decoration: BoxDecoration(
                    color: Colors.grey[800],
                    image: DecorationImage(
                        image: AssetImage(mainProduct.image),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(35)),
                child: Container(
                  height: 180,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(35)),
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              mainProduct.name,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                                Text(
                                  mainProduct.rating.toString(),
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedHeight(8),
                          ClipRRect(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 6),
                              child: Container(
                                alignment: Alignment.center,
                                height: 25,
                                width: 45,
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(.1),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Text(
                                  '2/8',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.grey.withOpacity(.3),
                            child: PlayWidget())
                        ],
                      ))
                    ],
                  ),
                ),
              ),
              SizedHeight(20),
              buildSquareCards("Popular"),
              SizedHeight(40),
              buildSquareCards("You may like")
            ],
          ),
        ),
      ),
    );   
  }
  Widget buildSquareCards(String title) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            Icon(
              Icons.more_horiz,
              color: Colors.orange,
            )
          ],
        ),
        SizedHeight(15),
        SizedBox(
          height: 140,
          child: ListView.builder(
              itemCount: products.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, __) {
                return HomeCardWidget(products[__], title);
              }),
        ),
      ],
    );
  }
}