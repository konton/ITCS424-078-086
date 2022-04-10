import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kcal/Screen/drinks.dart';
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
                    "Thai Food",
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context){
                          return thaifood();

                        })
                    );
                  },
                ),
              ),
              SizedBox(
                child: ElevatedButton(
                  child: Text(
                    "Drink",
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context){
                          return drinks()
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
