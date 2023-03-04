import 'package:flutter/material.dart';
import 'package:sip_calculator/ui%20kit/ui.dart';

class SipCal extends StatefulWidget {
  const SipCal({Key? key}) : super(key: key);

  @override
  State<SipCal> createState() => _SipCalState();
}

class _SipCalState extends State<SipCal> {
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
                            width: MediaQuery.of(context).size.width/3,
                            child: Text(
                              "Initial Investment Amount",
                              style: TextStyle(color: MyColor.mainColor1, fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(width: 40,),
                          Expanded(
                            child: TextField(
                              cursorColor: MyColor.mainColor1,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)
                                )
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 40,),
                      Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width/3,
                            child: Text(
                              "Initial Investment Amount",
                              style: TextStyle(color: MyColor.mainColor1, fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(width: 40,),
                          Expanded(
                            child: TextField(
                              cursorColor: MyColor.mainColor1,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)
                                )
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 40,),
                      Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width/3,
                            child: Text(
                              "Initial Investment Amount",
                              style: TextStyle(color: MyColor.mainColor1, fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(width: 40,),
                          Expanded(
                            child: TextField(
                              cursorColor: MyColor.mainColor1,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)
                                )
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 40,),
                      Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width/3,
                            child: Text(
                              "Initial Investment Amount",
                              style: TextStyle(color: MyColor.mainColor1, fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(width: 40,),
                          Expanded(
                            child: TextField(
                              cursorColor: MyColor.mainColor1,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)
                                )
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 40,),

                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: MyColor.mainColor1
                                ),

                                onPressed: (){}, child: Text("Caculate")),
                          ),
                        ],
                      )
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
