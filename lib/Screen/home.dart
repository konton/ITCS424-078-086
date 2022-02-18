
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Login page"),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(30, 100, 30, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset('assets/11.png', width: 300,),
            const Padding(padding: EdgeInsets.fromLTRB(50, 10, 30, 0)),
            TextField(
              style:  Theme.of(context).textTheme.bodyText1,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Username',
                icon: Icon(Icons.person),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),

              ),

            ),
            Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 5)),
            TextField(
              style:  Theme.of(context).textTheme.bodyText1,

              decoration: InputDecoration(
                labelText: 'Password',
                icon: Icon(Icons.vpn_key),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            SizedBox(
              width: 150,
              child: ElevatedButton.icon(onPressed: (){

              },
                  icon: const Icon(Icons.login),
                  label: const Text("Login")),
            ),
            SizedBox(
              width: 150,

              child: ElevatedButton.icon(onPressed: (){

              },
                  icon: const Icon(Icons.add),
                  label: const Text("Register")),
            ),
          ],
        ),

      ),
    );
  }
}
