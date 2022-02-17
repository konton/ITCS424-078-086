
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Login page"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset('assets/157391.jpg', width: 300,),
            Padding(padding: EdgeInsets.fromLTRB(50, 10, 30, 0)),
            TextField(
              style:  Theme.of(context).textTheme.bodyText1,
              decoration: InputDecoration(
                labelText: 'Username',
                icon: Icon(Icons.person),
              ),
            ),
            TextField(
              style:  Theme.of(context).textTheme.bodyText1,
              decoration: InputDecoration(
                labelText: 'Login',
                icon: Icon(Icons.vpn_key),
              ),
            ),
            SizedBox(
              width: 150,
              child: ElevatedButton.icon(onPressed: (){

              },
                  icon: Icon(Icons.login),
                  label: Text("Login")),
            ),
            SizedBox(
              width: 150,

              child: ElevatedButton.icon(onPressed: (){

              },
                  icon: Icon(Icons.add),
                  label: Text("Register")),
            ),
          ],
        ),

      ),
    );
  }
}