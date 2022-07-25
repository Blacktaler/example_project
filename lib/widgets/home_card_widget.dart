import 'dart:ui';

import 'package:example_project/models/media_product.dart';
import 'package:example_project/views/home_detail_page.dart';
import 'package:example_project/widgets/size_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeCardWidget extends StatelessWidget {
  HomeCardWidget(this.product,this.title);
  MediaProduct product;
  String title;
  @override
  Widget build(BuildContext context) {
   return InkWell(
     onTap: (){
       Navigator.push(context, MaterialPageRoute(builder: (_)=>HomeDetailPage(product)));
     },
     child: Container(
        margin: EdgeInsets.only(right: 15),
        width: 150,
        decoration: BoxDecoration(
            color: Colors.amber,
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(product.image)),
            borderRadius: BorderRadius.circular(25)),
        child: Column(
          children: [
            Spacer(),
            Container(
              height: 70,
              width: 150,
              decoration: BoxDecoration(borderRadius: cardRadius()),
              child: Stack(children: [
                Positioned(
                    bottom: 0,
                    child: ClipRRect(
                      borderRadius: cardRadius(),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                        child: Container(
                          height: 60,
                          width: 150,
                          padding:
                              EdgeInsets.only(left: 10, bottom: 10, right: 10),
                          decoration: BoxDecoration(borderRadius: cardRadius()),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedHeight(10),
                              Text(
                                product.name,
                                style: TextStyle(color: Colors.white),
                              ),
                              Spacer(),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 15,
                                  ),
                                  Text(
                                    product.rating.toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedWidth(15),
                                  Text(
                                    "${product.views} views",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 11),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    )),
                Positioned(
                    top: 0,
                    right: 10,
                    child: Container(
                        height: 25,
                        width: 25,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: Container(
                          height: 17,
                          width: 17,
                          decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(10)),
                          child: Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 15,
                          ),
                        )))
              ]),
            )
          ],
        ),
      ),
   ); 
  }
  BorderRadius cardRadius() {
    return BorderRadius.only(
        bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25));
  }
}