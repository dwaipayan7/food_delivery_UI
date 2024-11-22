import 'package:flutter/material.dart';
import 'package:food_delivery/Model/category_model.dart';
import 'package:food_delivery/Model/product_model.dart';
import 'package:food_delivery/consts.dart';
import 'package:food_delivery/widget/food_products_items.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Location Column
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Your Location",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black45,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Icons.keyboard_arrow_down,
                            size: 20,
                            color: Colors.black,
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: korange,
                            size: 20,
                          ),
                          SizedBox(width: 5),
                          Text(
                            "Bethuadahari",
                            style: TextStyle(
                              fontSize: 16,
                              color: kblack,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Search Icon
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.search,
                    color: kblack,
                  ),
                ),
                const SizedBox(width: 10),

                // Shopping Cart Icon
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 15),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.shopping_cart_outlined,
                        color: kblack,
                      ),
                    ),
                    Positioned(
                        right: 0,
                        top: 0,
                        child: GestureDetector(
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                                color: Color(0xfff95f60),
                                shape: BoxShape.circle),
                            child: const Text(
                              "0",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ))
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Let's finds the best food around you",
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -.5),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Find by Category",
                  style: TextStyle(
                      fontSize: 22, fontWeight: FontWeight.w600, color: kblack),
                ),
                Text(
                  "See All",
                  style: TextStyle(color: Colors.orange),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...List.generate(
                    myCategories.length,
                    (index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Container(
                            height: 105,
                            width: 88,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: selectedIndex == index
                                    ? Border.all(width: 2.5, color: korange)
                                    : Border.all(color: Colors.white)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Stack(
                                  alignment: AlignmentDirectional.center,
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 45,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                                color: kblack.withOpacity(0.4),
                                                offset: Offset(0, 10),
                                                blurRadius: 12,
                                                spreadRadius: 5)
                                          ]),
                                    ),
                                    Image.asset(
                                      myCategories[index].image,
                                      width: 60,
                                      fit: BoxFit.cover,
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  myCategories[index].name,
                                  style: const TextStyle(
                                      color: kblack,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),
                        ))
              ],
            ),
          ),
          const SizedBox(height: 25,),
          Padding(
              padding: const EdgeInsets.only(left: 15),
            child: Center(
              child: Text("Result (${"Item Products"})",
              style: TextStyle(
                color: kblack.withOpacity(0.6),
                fontWeight: FontWeight.bold,
                letterSpacing: -.2
              ),
              ),
            ),
          ),
          const SizedBox(height: 20,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            child: Row(
              children: [
                ...List.generate(
                    myProductModel.length,
                    (index) => Padding(
                        padding: index == 0 ?
                            EdgeInsets.only(left: 25, right: 25)
                            : EdgeInsets.only(right: 25),
                      child: FoodProductsItems(
                          myProductModel: myProductModel[index]
                      ),
                    )
                )
              ],
            ),
          )

        ],
      ),
    );
  }
}
