import 'package:flutter/material.dart';
import 'package:kcal/Screen/BMR.dart';
import 'dart:convert';

import 'package:kcal/Screen/menus.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(title: Text("Home page")),
        body: Column(
          children: <Widget>[

            Row(children: [
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width-20,
                    height: 100,
                    child: ElevatedButton(
                      child: Text(
                        "BMR",
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return BMR();
                            }));
                      },
                    ),
                  ),
              ),

            ]
            ),
            const SizedBox(height: 12,),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width-20,
                    height: 100,
                    child: ElevatedButton(
                      child: Text(
                        "Menus",
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return menus();
                            }));
                      },
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Image.asset(
                    'assets/11.png',
                    width: MediaQuery.of(context).size.width-20,
                  ),
                )
              ],
            )

          ],
        )
        );
  }
}

// @override
// Widget build(BuildContext context){

// }
