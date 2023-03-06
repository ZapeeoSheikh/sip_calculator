import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sip_calculator/Pages/sip_calculator.dart';

import '../ui kit/ui.dart';
import 'InflationCalculator.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Image(image: AssetImage("images/home.jpeg")),
              SizedBox(
                height: 50,
              ),
              AutoSizeText(
                "Welcome to Financial Calculator",
                style: TextStyle(
                    color: MyColor.sipColor2.withOpacity(.7),
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => InflCal()));
                          },
                          child: Container(
                            height: 130,
                            width: MediaQuery.of(context).size.width / 2.7,
                            decoration: BoxDecoration(
                                color: MyColor.homeColor1,
                                borderRadius: BorderRadius.circular(25)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: AutoSizeText(
                                  "Inflation Calculator",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SipCal()));
                          },
                          child: Container(
                            height: 130,
                            width: MediaQuery.of(context).size.width / 2.7,
                            decoration: BoxDecoration(
                                color: MyColor.homeColor2,
                                borderRadius: BorderRadius.circular(25)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: AutoSizeText(
                                  "SIP Calculator",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            AnimatedSnackBar.material(
                              'Sorry!! This Tab is under development',
                              type: AnimatedSnackBarType.warning,
                            ).show(context);
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => InflCal()));
                          },
                          child: Container(
                            height: 130,
                            width: MediaQuery.of(context).size.width / 2.7,
                            decoration: BoxDecoration(
                                color: MyColor.homeColor2,
                                borderRadius: BorderRadius.circular(25)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: AutoSizeText(
                                  "Under Dev",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        GestureDetector(
                          onTap: (){
                            AnimatedSnackBar.material(
                              'Sorry!! This Tab is under development',
                              type: AnimatedSnackBarType.info,
                            ).show(context);
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => SipCal()));
                          },
                          child: Container(
                            height: 130,
                            width: MediaQuery.of(context).size.width / 2.7,
                            decoration: BoxDecoration(
                                color: MyColor.homeColor1,
                                borderRadius: BorderRadius.circular(25)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: AutoSizeText(
                                  "Under Dev",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Spacer(),
              AutoSizeText(
                "Powered by Muhammad Rameez",
                style: TextStyle(
                    color: MyColor.sipColor2.withOpacity(.7),
                    fontSize: 14),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
