import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class thaifood extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width/2;
    // double height = MediaQuery.of(context).size.height/2;
    return Scaffold(
      appBar: AppBar(title: Text("Select Thai dishes")),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Menus").snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            padding: const EdgeInsets.all(15),
            children: snapshot.data!.docs.map((document) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              padding: EdgeInsets.all(8),
                              color: Colors.amber,
                              child: Column(
                                children: [
                                  Image.network(document['img'],
                                      width: 200,
                                      height: 200,
                                      fit: BoxFit.contain),
                                  Text(
                                    "Name:" + document['name'],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    "Calories:" +
                                        document['Calories'].toString(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          )))
                ],
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
