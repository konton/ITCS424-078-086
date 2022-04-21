import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kcal/Screen/drinks.dart';
import 'package:kcal/Screen/koreanfood.dart';
import 'package:kcal/Screen/thaifood.dart';

class menus extends StatefulWidget {
  menusearch createState() => menusearch();
}


class menusearch extends State<menus>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Select menu")
      ),
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
                      "Thaifood",
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return thaifood();
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
                        "Drinks",
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return drinks();
                            }));
                      },
                    ),
                  ),
                )
              ],
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
                        "Korean Food",
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return koreanfood();
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
