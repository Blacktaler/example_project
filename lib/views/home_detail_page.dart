import 'dart:ui';

import 'package:example_project/configs/size_config.dart';
import 'package:example_project/models/media_product.dart';
import 'package:example_project/widgets/play_widget.dart';
import 'package:example_project/widgets/size_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeDetailPage extends StatelessWidget {
  HomeDetailPage(this.product);
  MediaProduct product;
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      
        body: Scaffold(
          
          backgroundColor: Colors.black,
          body: Container(
            height: 400,
            width: 400,
            color: Colors.black,
            child: SingleChildScrollView(
              padding: EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Story line",style: TextStyle(color: Colors.white,fontSize: 20),),
                  SizedHeight(10),
                  Text("Some good Some good Some good Some good Some good Some good Some good Some good Some good Some good Some good ",style: TextStyle(color: Colors.grey),),
                  SizedHeight(20),
                  Text("Star cast",style:TextStyle(color: Colors.white,fontSize: 20),),
                  SizedHeight(20),
                  SizedBox(
                    height: 60,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (_,__){
                      return Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(right: 5),
                        width: 200,
                        child: Row(
                          children: [
                            
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.grey,
                                image: DecorationImage(fit: BoxFit.cover,image: NetworkImage("https://source.unsplash.com/random/$__")
                                
                                )
                              ),
                            ),
                            SizedWidth(20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("actor",style: TextStyle(color: Colors.grey,fontSize: 13),),
                                SizedHeight(4),
                                Text("Some actor $__",style: TextStyle(color: Colors.white,fontSize: 17),)
                              ],
                            )
                          ],
                        ),
                      );
                    }),
                  ), 
                   SizedHeight(20),
                   Text("Recommended",style: TextStyle(color: Colors.white,fontSize: 15),),
                   SizedHeight(20),
                   SizedBox(
                     height: 150,
                     child:ListView.builder(
                       scrollDirection: Axis.horizontal,
                       itemCount: 4,
                       itemBuilder: (_,__){
                       return Container(
                         width: 120,
                         margin: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(image: NetworkImage("https://source.unsplash.com/random/$__"))
                        ),
                       );
                     })
                   )
                   
                              ],
              ),
            ),
          ),
        ),
        headerSliverBuilder: (context, istrue) {
          return [
            SliverAppBar(
              toolbarHeight: 400,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.black,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover, image: AssetImage(product.image))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedHeight(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: CircleAvatar(
                                backgroundColor: Colors.grey.withOpacity(.1),
                                foregroundColor: Colors.white,
                                child: Icon(Icons.arrow_back)),
                            color: Colors.white,
                          ),
                          CircleAvatar(
                              backgroundColor: Colors.grey.withOpacity(.2),
                              child: Icon(
                                Icons.favorite_border,
                                color: Colors.white,
                              ))
                        ],
                      ),
                      SizedHeight(180),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: 45,
                            decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(.7),
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),topLeft: Radius.circular(25))
                            ),
                            width: SizeConfig.width!*.35,
                            child: Row(
                              children: [
                                SizedWidth(5),
                                PlayWidget(),
                                SizedWidth(10),
                                Text("Watch Trailer",style: TextStyle(color: Colors.orange),)
                                ],
                            ),
                          ),
                        ],
                      ),
                      SizedHeight(25),
                      Text(product.name,style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w500),),
                      SizedHeight(5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Eng",style: textStyle(),),
                          SizedWidth(5),
                          dividingWidget(),
                          SizedWidth(5),
                          Text("Action,Sci-Fi",style: textStyle(),),
                          SizedWidth(5),
                          dividingWidget(),
                          SizedWidth(5),
                          Text("3h10m",style: textStyle(),)
                        ],
                      ),
                      Container(
                        height: 1,
                        width: SizeConfig.width!  *.7,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            )
          ];
        });
  }

  TextStyle textStyle() => TextStyle(color: Colors.white,fontSize: 13);

  Container dividingWidget() {
    return Container(
                          height: 13,
                          width: 1,
                          color: Colors.white,
                        );
  }
}
