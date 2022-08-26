import 'package:animagieeui/config/colorconfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../controller/controller.dart';
import 'paymentsuccesspage.dart';

class Doctor_Payment_UI extends StatefulWidget {
  const Doctor_Payment_UI({Key? key}) : super(key: key);

  @override
  State<Doctor_Payment_UI> createState() => _Doctor_Payment_UIState();
}

class _Doctor_Payment_UIState extends State<Doctor_Payment_UI> {
  Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Container(
                height: 40,
                width: 148,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(width: 2, color: Colors.black)),
                child: Text("back"),
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Container(
                height: 40,
                width: 148,
                decoration: BoxDecoration(
                  color: animagiee_CL,
                  borderRadius: BorderRadius.circular(6),
                ),
                alignment: Alignment.center,
                child: Text("Continue"),
              ),
              label: "")
        ],
        onTap: (value) {
          value == 1 ? Get.to(Successfull_Payment_UI()) : null;
        },
      ),
      body: SafeArea(
          child: Column(children: [
        controller.cusapp("Payment", context),
        Container(
          height: 172,
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("SELECT A PAYMENT METHOD "),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Card(
                    child: SizedBox(
                        height: 100,
                        width: 75,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              "images/card.png",
                              cacheHeight: 50,
                              cacheWidth: 50,
                            ),
                            Text("Card")
                          ],
                        )),
                  ),
                  Card(
                    child: SizedBox(
                        height: 100,
                        width: 75,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              "images/netbanking.png",
                              cacheHeight: 50,
                              cacheWidth: 50,
                            ),
                            Text("NetBanking")
                          ],
                        )),
                  ),
                  Card(
                    child: SizedBox(
                        height: 100,
                        width: 75,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              "images/wallet.png",
                              cacheHeight: 50,
                              cacheWidth: 50,
                            ),
                            Text("Wallet")
                          ],
                        )),
                  ),
                  Card(
                    child: SizedBox(
                        height: 100,
                        width: 75,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              "images/upi",
                              cacheHeight: 50,
                              cacheWidth: 50,
                            ),
                            Text("UPI")
                          ],
                        )),
                  ),
                ],
              )
            ],
          ),
        ),
        // Container(child: ,)
      ])),
    );
  }
}
