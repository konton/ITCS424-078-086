import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class thaifood extends StatefulWidget {
  menuthai createState() => menuthai();
}

class menuthai extends State<thaifood>{


  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width/2;
    // double height = MediaQuery.of(context).size.height/2;
    return Scaffold(
      appBar: AppBar(
          title: Text("Select menu")
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Menus").snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(!snapshot.hasData){
            return Center(child: CircularProgressIndicator(),);
          }
          return ListView(
            children: snapshot.data!.docs.map((document) {
              return Container(
                  padding: const EdgeInsets.all(16),

                  child: Column(

                    children: [
                      Image.network(document['img'],),
                      Text("Name:"+document['name'], style: TextStyle(fontSize: 20) ,),
                      Text("Calories:"+document['Calories'].toString(),style: TextStyle(fontSize: 20)),

                    ],
                  )


              );

            }).toList(),
          );
        },
      ),
    );
  }

}