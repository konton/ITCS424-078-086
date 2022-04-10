import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class drinks extends StatefulWidget {
  alldrink createState() => alldrink();
}

class alldrink extends State<drinks>{


  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width/2;
    // double height = MediaQuery.of(context).size.height/2;
    return Scaffold(
      appBar: AppBar(
          title: Text("Select drink")
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Drinks").snapshots(),
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