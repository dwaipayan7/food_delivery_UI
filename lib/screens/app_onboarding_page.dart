import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/Model/onboard_model.dart';

import '../consts.dart';

class AppOnboardingPage extends StatefulWidget {
  const AppOnboardingPage({super.key});

  @override
  State<AppOnboardingPage> createState() => _AppOnboardingPageState();
}

class _AppOnboardingPageState extends State<AppOnboardingPage> {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kblack,

      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          PageView.builder(
            onPageChanged: (value){
                setState(() {
                  currentIndex = value;
                });
            },
              itemCount: onboards.length,
              itemBuilder: (context, index){
                return Stack(
                  children: [
                    Positioned(
                      top:-70,
                        right: 0,
                        left: 0,
                        child: FadeInDown(
                          delay: const Duration(microseconds: 500),
                          child: Image.asset(
                            onboards[index].image,
                            width: 600,
                            height: 600,
                            fit: BoxFit.contain,
                          ),
                        )
                    ),
                    Positioned(
                        top: MediaQuery.of(context).size.height/1.9,
                        child: FadeInUp(
                          delay: const Duration(microseconds: 500),
                          child: Padding(

                              padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(onboards[index].text1, style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold
                                ),),

                                const SizedBox(height: 15,),

                                Text(onboards[index].text2, style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500
                                ),)

                              ],
                            ),
                          ),
                        )
                    )
                  ],
                );
              }
          ),

          Positioned(
            bottom: 170,
            child: Row(
              children: [
                ...List.generate(
                  onboards.length,
                      (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 250), // Animation duration
                    height: 5,
                    width: 50,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: index == currentIndex ? Colors.white : Colors.white.withOpacity(0.5), // Change color for the active indicator
                      borderRadius: BorderRadius.circular(15.0), // Rounded indicator
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 30,
              child: SizedBox(
                height: 75,
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: MaterialButton(
                      onPressed: (){},
                    color: korange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),

                    ),
                    minWidth: MediaQuery.of(context).size.width-50,
                    child: const Center(
                      child: Text("Get Started", style: TextStyle(
                        color: Colors.white,
                        fontSize: 24
                      ),),
                    ),
                  ),
                ),
              )
          )

        ],
      ),

    );
  }
}
