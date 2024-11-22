import 'dart:math';

import 'package:flutter/material.dart';
import 'package:food_delivery/Model/product_model.dart';
import 'package:food_delivery/consts.dart';

class FoodProductsItems extends StatelessWidget {
  final MyProductModel myProductModel;
  const FoodProductsItems({super.key, required this.myProductModel});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 250,
          width: width / 2.4,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Container(
          height: 290,
          width: width / 2.4,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Transform.rotate(
                  angle: 10 * pi / 180,
                  child: SizedBox(
                    height: 115,
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Positioned(
                            bottom: 0,
                            child: Container(
                              height: 50,
                              width: 100,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.3),
                                        spreadRadius: 10,
                                        blurRadius: 30)
                                  ]),
                            )),
                        Image.asset(
                          myProductModel.image,
                          height: 150,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  myProductModel.name,
                  style: const TextStyle(
                      fontSize: 19, fontWeight: FontWeight.bold, color: kblack),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star_rate_rounded,
                      size: 22,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      myProductModel.rate.toString(),
                      style: TextStyle(color: kblack.withOpacity(.5)),
                    )
                  ],
                ),
                SizedBox(
                  width: 5,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: kpink,
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("${myProductModel.distance}m",
                    style: TextStyle(
                      color: kblack.withOpacity(.5),
                      fontWeight: FontWeight.bold
                    ),)
                  ],
                ),
                SizedBox(height: 20,),
                Text("\$${(myProductModel.price).toStringAsFixed(2)}",
                style: TextStyle(
                  color: kblack,
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                ),
                )
              ],
            ),
          ),
        ),
        Positioned(child: GestureDetector(
          onTap: (){},
          child: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: kblack,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)
              )
            ),
          ),
        ))
      ],
    );
  }
}
