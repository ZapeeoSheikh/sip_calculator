import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:numeral_system/numeral_system.dart';

import '../ui kit/ui.dart';

class InflCal extends StatefulWidget {
  const InflCal({Key? key}) : super(key: key);

  @override
  State<InflCal> createState() => _InflCalState();
}

class _InflCalState extends State<InflCal> {
  final investedController = TextEditingController();
  final rateInflationController = TextEditingController();
  final durationController = TextEditingController();

  int investedAmount = 0;
  int rateOfInflation = 0;
  int holdingYears = 0;
  int devaluation = 0;
  int actualValue = 0;
  int totalAmount = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Inflation Calculator",
            selectionColor: Colors.white,
          ),
          backgroundColor: MyColor.homeColor1,
        ),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image(image: AssetImage("images/inflation.png")),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 3,
                              child: Text(
                                "Invested Amount",
                                style: TextStyle(
                                    color: MyColor.inflColor1,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Expanded(
                              child: TextField(
                                controller: investedController,
                                keyboardType: TextInputType.number,
                                cursorColor: MyColor.inflColor1,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(20))),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 3,
                              child: Text(
                                "Rate of inflation (%) per year",
                                style: TextStyle(
                                    color: MyColor.inflColor1,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Expanded(
                              child: TextField(
                                controller: rateInflationController,
                                keyboardType: TextInputType.number,
                                cursorColor: MyColor.inflColor1,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(20))),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 3,
                              child: Text(
                                "Holding years",
                                style: TextStyle(
                                    color: MyColor.inflColor1,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Expanded(
                              child: TextField(
                                controller: durationController,
                                keyboardType: TextInputType.number,
                                cursorColor: MyColor.inflColor1,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(20))),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        // Row(
                        //   children: [
                        //     Text(
                        //       "Re-invest",
                        //       style: TextStyle(
                        //           color: MyColor.inflCal1,
                        //           fontSize: 16,
                        //           fontWeight: FontWeight.bold),
                        //     ),
                        //     Checkbox(
                        //         activeColor: MyColor.inflCal2,
                        //         value: reInvest,
                        //         onChanged: (reinvest) {
                        //           setState(() {
                        //             reInvest = reinvest!;
                        //           });
                        //         })
                        //   ],
                        // ),
                        //
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 50,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: MyColor.homeColor1),
                                    onPressed: () {
                                      if (investedController.text != "" &&
                                          rateInflationController.text != "" &&
                                          durationController.text != "") {
                                        setState(() {
                                          investedAmount = int.parse(investedController.text);
                                          totalAmount = int.parse(investedController.text);
                                          holdingYears = int.parse(durationController.text);
                                          // totalAmount = investedAmount - ((investedAmount * int.parse(rateInflationController.text)) / 100).round();
                                          for (int i = 1; i <= holdingYears; i++) {
                                            totalAmount = totalAmount - ((totalAmount * int.parse(rateInflationController.text)) / 100).round() ;
                                            // totalAmount = profitAmount ;
                                          }
                                          devaluation = investedAmount - totalAmount ;
                                          actualValue = investedAmount - devaluation;
                                          // if( reInvest == true ){
                                          //   reInvestAmount = totalAmount * int.parse(durationController.text);
                                          // }
                                          // rateOdReturn = (int.parse(rateOfReturnController.text) ;
                                          // totalAmount = int.parse(initialController.text) * rateOdReturn;

                                          print(investedAmount);
                                          print(totalAmount);
                                          print(devaluation);
                                          print(actualValue);
                                        });
                                      }
                                    },
                                    child: Text("Caculate")),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 3,
                              child: Text(
                                "Invested Amount",
                                style: TextStyle(
                                    color: MyColor.inflColor1,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            AutoSizeText(
                              "Rs ",
                              style: TextStyle(
                                color: MyColor.inflColor1,
                                fontSize: 16,
                              ),
                            ),
                            NumeralSystem(
                              numberSystem: NumberSystem.indian,
                              digit: investedAmount,
                              digitAfterDecimal: DigitAfterDecimal.one,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 3,
                              child: Text(
                                "De Valuation of Money",
                                style: TextStyle(
                                    color: MyColor.inflColor1,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            AutoSizeText(
                              "Rs ",
                              style: TextStyle(
                                color: MyColor.inflColor1,
                                fontSize: 16,
                              ),
                            ),
                            NumeralSystem(
                              numberSystem: NumberSystem.international,
                              digit: devaluation,
                              digitAfterDecimal: DigitAfterDecimal.one,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 3,
                              child: Text(
                                "Actual value after ${holdingYears} years",
                                style: TextStyle(
                                    color: MyColor.inflColor1,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            AutoSizeText(
                              "Rs ",
                              style: TextStyle(
                                color: MyColor.inflColor1,
                                fontSize: 16,
                              ),
                            ),
                            NumeralSystem(
                              numberSystem: NumberSystem.international,
                              digit: actualValue,
                              digitAfterDecimal: DigitAfterDecimal.one,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        // reInvest == true
                        //     ? Column(
                        //   children: [
                        //     Row(
                        //       mainAxisAlignment: MainAxisAlignment.start,
                        //       children: [
                        //         Container(
                        //           width:
                        //           MediaQuery.of(context).size.width /
                        //               3,
                        //           child: Text(
                        //             "Re-invested",
                        //             style: TextStyle(
                        //                 color: MyColor.inflCal1,
                        //                 fontSize: 16,
                        //                 fontWeight: FontWeight.bold),
                        //           ),
                        //         ),
                        //         SizedBox(
                        //           width: 20,
                        //         ),
                        //         AutoSizeText(
                        //           "Rs ",
                        //           style: TextStyle(
                        //             color: MyColor.inflCal2,
                        //             fontSize: 16,
                        //           ),
                        //         ),
                        //         NumeralSystem(
                        //           numberSystem:
                        //           NumberSystem.international,
                        //           digit: reInvestAmount,
                        //           digitAfterDecimal:
                        //           DigitAfterDecimal.one,
                        //         ),
                        //       ],
                        //     ),
                        //     SizedBox(
                        //       height: 20,
                        //     ),
                        //   ],
                        // )
                        //     : Container(),
                        //
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Killer of Ecconomy",
                              style: TextStyle(
                                  color: MyColor.sipColor2.withOpacity(0.5),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
