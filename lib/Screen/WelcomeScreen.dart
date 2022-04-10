import 'package:flutter/material.dart';
import 'package:kcal/Screen/BMR.dart';
import 'dart:convert';

import 'package:kcal/Screen/menus.dart';

class WelcomeScreen extends StatefulWidget {
  Cal createState() => Cal();



}
  class Cal extends State<WelcomeScreen>{
    final age = TextEditingController();
    final weight = TextEditingController();
    final height = TextEditingController();
    int result = 0;
    void calculate(int a, int h, int w) {
      setState(()
        => result = (10 * w) + (6 * h) - (5 * a) + 5
      );

    }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          title: Text("Welcome page")
      ),
      body: Align(
          alignment: Alignment.center,
          child: SingleChildScrollView(

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(padding: EdgeInsets.fromLTRB(50, 10, 30, 0)),
                SizedBox(
                  child: ElevatedButton(
                    child: Text(
                      "BMR",
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context){
                            return BMR();
                            ;
                          })
                      );
                    },
                  ),
                ),
                SizedBox(
                  child: ElevatedButton(
                    child: Text(
                      "Selecte the menus",
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context){
                            return menus()
                            ;
                          })
                      );
                    },
                  ),
                )
              ],

            ),
          ),


      ),
    );
  }

  }
  // @override
  // Widget build(BuildContext context){

  // }

