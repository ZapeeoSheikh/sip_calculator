import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:numeral_system/numeral_system.dart';
import 'package:sip_calculator/ui%20kit/ui.dart';

class SipCal extends StatefulWidget {
  const SipCal({Key? key}) : super(key: key);

  @override
  State<SipCal> createState() => _SipCalState();
}

class _SipCalState extends State<SipCal> {
  final initialController = TextEditingController();
  final rateOfReturnController = TextEditingController();
  final durationController = TextEditingController();

  int totalAmount = 0;
  int initialAmount = 0;
  int profitAmount = 0;
  String muturityAmount = "";
  int rateOdReturn = 0;
  bool reInvest = false;
  bool isExpand = false;
  bool isYear = false;
  int reInvestedReturn = 0;
  int reInvestedAmount = 0;
  int DurationInYear = 0;
  int reInvestProfit = 0;
  int InvestProfit = 0;

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
            "SIP Calculator",
            selectionColor: Colors.white,
          ),
          backgroundColor: MyColor.sipColor1,
        ),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image(image: AssetImage("images/sip.png")),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 3,
                              child: Text(
                                "Initial Investment Amount",
                                style: TextStyle(
                                    color: MyColor.sipColor1,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Expanded(
                              child: TextField(
                                controller: initialController,
                                keyboardType: TextInputType.number,
                                cursorColor: MyColor.sipColor1,
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
                        //     Container(
                        //       width: MediaQuery.of(context).size.width/3,
                        //       child: Text(
                        //         "SWP Amount",
                        //         style: TextStyle(color: MyColor.sipColor1, fontSize: 16, fontWeight: FontWeight.bold),
                        //       ),
                        //     ),
                        //     SizedBox(width: 30,),
                        //     Expanded(
                        //       child: TextField(
                        //         cursorColor: MyColor.sipColor1,
                        //         decoration: InputDecoration(
                        //           border: OutlineInputBorder(
                        //             borderRadius: BorderRadius.circular(20)
                        //           )
                        //         ),
                        //       ),
                        //     )
                        //   ],
                        // ),
                        // SizedBox(height: 30,),
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 3,
                              child: Text(
                                "Rate of return (%)",
                                style: TextStyle(
                                    color: MyColor.sipColor1,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Expanded(
                              child: TextField(
                                controller: rateOfReturnController,
                                keyboardType: TextInputType.number,
                                cursorColor: MyColor.sipColor1,
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
                                "Duration",
                                style: TextStyle(
                                    color: MyColor.sipColor1,
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
                                cursorColor: MyColor.sipColor1,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20))),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Re-invest",
                              style: TextStyle(
                                  color: MyColor.sipColor1,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Checkbox(
                                activeColor: MyColor.sipColor2,
                                value: reInvest,
                                onChanged: (reinvest) {
                                  setState(() {
                                    reInvest = reinvest!;
                                  });
                                }),
                            Spacer(),
                            Text(
                              "Duration ( years )",
                              style: TextStyle(
                                  color: MyColor.sipColor1,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                            Checkbox(
                                activeColor: MyColor.sipColor2,
                                value: isYear,
                                onChanged: (reinvest) {
                                  setState(() {
                                    isYear = reinvest!;
                                  });
                                }),
                          ],
                        ),

                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 50,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: MyColor.sipColor1),
                                    onPressed: () {
                                      if (initialController.text != "" &&
                                          rateOfReturnController.text != "" &&
                                          durationController.text != "") {
                                        setState(() {
                                          initialAmount =
                                              int.parse(initialController.text);
                                          totalAmount =
                                              int.parse(initialController.text);
                                          if (isYear == true) {
                                            DurationInYear = int.parse(
                                                    durationController.text) *
                                                12;
                                          } else {
                                            DurationInYear = int.parse(
                                                    durationController.text) *
                                                1;
                                          }
                                          for (int i = 1;
                                              i <= DurationInYear;
                                              i++) {
                                            totalAmount = ((totalAmount *
                                                            int.parse(
                                                                rateOfReturnController
                                                                    .text)) /
                                                        100)
                                                    .round() +
                                                totalAmount;
                                            // totalAmount = profitAmount ;
                                            // print(totalAmount);
                                          }
                                          if (reInvest == true) {
                                            reInvestedAmount =
                                                initialAmount * DurationInYear;
                                            reInvestedReturn =
                                                totalAmount * DurationInYear;

                                            reInvestProfit = reInvestedReturn - reInvestedAmount;

                                          } else{
                                            InvestProfit = totalAmount - initialAmount;
                                            reInvestProfit = 0;
                                            reInvestedAmount = 0;
                                            reInvestedReturn = 0;
                                          }
                                          // rateOdReturn = (int.parse(rateOfReturnController.text) ;
                                          // totalAmount = int.parse(initialController.text) * rateOdReturn;
                                          // print(reInvestedAmount);
                                          // print(reInvestedReturn);
                                          // print(reInvestProfit);
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
                                    color: MyColor.sipColor1,
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
                                color: MyColor.sipColor2,
                                fontSize: 16,
                              ),
                            ),
                            NumeralSystem(
                              numberSystem: NumberSystem.indian,
                              digit: initialAmount,
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
                                "Muturity Value of ${initialAmount}Rs after ${durationController.text}",
                                style: TextStyle(
                                    color: MyColor.sipColor1,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            AutoSizeText(
                              "Rs ",
                              style: TextStyle(
                                color: MyColor.sipColor2,
                                fontSize: 16,
                              ),
                            ),
                            NumeralSystem(
                              numberSystem: NumberSystem.international,
                              digit: totalAmount,
                              digitAfterDecimal: DigitAfterDecimal.one,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width:
                                  MediaQuery.of(context).size.width /
                                      3,
                                  child: Text(
                                    "Profit Amount",
                                    style: TextStyle(
                                        color: MyColor.sipColor1,
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
                                    color: MyColor.sipColor2,
                                    fontSize: 16,
                                  ),
                                ),
                                NumeralSystem(
                                  numberSystem:
                                  NumberSystem.international,
                                  digit: reInvest == true ? reInvestProfit : InvestProfit,
                                  digitAfterDecimal:
                                  DigitAfterDecimal.one,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                        reInvest == true
                            ?  ExpansionPanelList(
                          elevation: 0,
                          children: [
                            ExpansionPanel(
                              body: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width:
                                        MediaQuery.of(context).size.width /
                                            3,
                                        child: Text(
                                          "Re-invested (I)",
                                          style: TextStyle(
                                              color: MyColor.sipColor1,
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
                                          color: MyColor.sipColor2,
                                          fontSize: 16,
                                        ),
                                      ),
                                      NumeralSystem(
                                        numberSystem:
                                        NumberSystem.international,
                                        digit: reInvestedAmount,
                                        digitAfterDecimal:
                                        DigitAfterDecimal.one,
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
                                        width:
                                        MediaQuery.of(context).size.width /
                                            3,
                                        child: Text(
                                          "Re-invested (R)",
                                          style: TextStyle(
                                              color: MyColor.sipColor1,
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
                                          color: MyColor.sipColor2,
                                          fontSize: 16,
                                        ),
                                      ),
                                      NumeralSystem(
                                        numberSystem:
                                        NumberSystem.international,
                                        digit: reInvestedReturn,
                                        digitAfterDecimal:
                                        DigitAfterDecimal.one,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                              headerBuilder: (BuildContext context, bool isExpanded) {
                                return Text(
                                  "Advanced",
                                  style: TextStyle(
                                    color: MyColor.sipColor2,
                                    fontSize: 15,
                                  ),
                                );
                              },
                              isExpanded: isExpand,
                            )
                          ],
                          expansionCallback: (int item, bool status) {
                            setState(() {
                              isExpand = !status ;
                            });
                          },
                        ) : Container(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Power of Compunding",
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

