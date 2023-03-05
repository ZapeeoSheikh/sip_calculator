import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
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
          backgroundColor: MyColor.mainColor1,
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Image(image: AssetImage("images/chat.png")),
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
                                  color: MyColor.mainColor1,
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
                              cursorColor: MyColor.mainColor1,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20))),
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
                      //         style: TextStyle(color: MyColor.mainColor1, fontSize: 16, fontWeight: FontWeight.bold),
                      //       ),
                      //     ),
                      //     SizedBox(width: 30,),
                      //     Expanded(
                      //       child: TextField(
                      //         cursorColor: MyColor.mainColor1,
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
                                  color: MyColor.mainColor1,
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
                              cursorColor: MyColor.mainColor1,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20))),
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
                                  color: MyColor.mainColor1,
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
                              cursorColor: MyColor.mainColor1,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20))),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),

                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 50,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: MyColor.mainColor1),
                                  onPressed: () {
                                    if (initialController.text != "" &&
                                        rateOfReturnController.text != "" &&
                                        durationController.text != "") {
                                      setState(() {
                                        totalAmount = int.parse(initialController.text);

                                        for(int i= 1; i <= int.parse(durationController.text); i++){
                                          totalAmount = ((totalAmount * int.parse(rateOfReturnController.text))/ 100).round() + totalAmount;
                                          // totalAmount = profitAmount ;
                                        }

                                        // rateOdReturn = (int.parse(rateOfReturnController.text) ;
                                        // totalAmount = int.parse(initialController.text) * rateOdReturn;

                                        print(initialAmount);
                                        print(totalAmount);
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
                                  color: MyColor.mainColor1,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          AutoSizeText(
                            "Rs ${initialAmount}",
                            style: TextStyle(
                              color: MyColor.mainColor2,
                              fontSize: 16,
                            ),
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
                              "Muturity Value",
                              style: TextStyle(
                                  color: MyColor.mainColor1,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          AutoSizeText(
                            "Rs ${totalAmount}",
                            style: TextStyle(
                              color: MyColor.mainColor2,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Power of Compunding",
                            style: TextStyle(
                                color: MyColor.mainColor2.withOpacity(0.5),
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
    );
  }
}
