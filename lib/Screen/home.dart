import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:kcal/Screen/register.dart';
import 'package:kcal/model/profile.dart';
import 'package:firebase_core/firebase_core.dart';

import 'WelcomeScreen.dart';

class HomeScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  profile pro = profile(email: '',pass:'',);
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  CollectionReference collect = FirebaseFirestore.instance.collection("users");

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firebase,
        builder: (context,snapshot){
          if(snapshot.hasError){
            return Scaffold(
              appBar: AppBar(title: Text("error"),),
              body: Center(child: Text("${snapshot.error}"),),
            );
          }
          if(snapshot.connectionState == ConnectionState.done){
            return Scaffold(
              appBar: AppBar(
                title: Text("Login page"),
              ),
              body: Container(
                padding: const EdgeInsets.fromLTRB(30, 100, 30, 0),
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(

                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/11.png',
                          width: 300,
                        ),
                        const Padding(padding: EdgeInsets.fromLTRB(50, 10, 30, 0)),
                        Text(
                          "Username",
                          style: TextStyle(fontSize: 20),
                        ),
                        TextFormField(
                          validator: EmailValidator(errorText: "This is not email"),
                          onSaved: (String? email){
                            pro.email =email!;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Password",
                          style: TextStyle(fontSize: 20),
                        ),
                        TextFormField(
                          validator: RequiredValidator(errorText: "Please Input Password"),
                          onSaved: (String? pass){
                            pro.pass = pass!;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                            child: ElevatedButton(
                              child: Text(
                              "Login",
                              style: TextStyle(fontSize: 20),
                            ),
                              onPressed: () async{
                               if(formKey.currentState!.validate()){
                                 formKey.currentState!.save();
                                 try{
                                   await FirebaseAuth.instance.signInWithEmailAndPassword(
                                       email: pro.email!,
                                       password: pro.pass!).then((value){
                                         formKey.currentState!.reset();
                                         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                                           return WelcomeScreen();
                                         }));
                                   });
                                 }on FirebaseAuthException catch(e){
                                   print(e.message);
                                 }
                               }
                              },
                        )),
                        SizedBox(
                          child: ElevatedButton(
                            child: Text(
                              "Register",
                              style: TextStyle(fontSize: 20),
                            ),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context){
                                    return Register();
                              })
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),

                  // TextFormField(
                  //   style:  Theme.of(context).textTheme.bodyText1,
                  //   obscureText: true,
                  //   decoration: InputDecoration(
                  //     labelText: 'Username',
                  //     icon: Icon(Icons.person),
                  //     fillColor: Colors.white,
                  //     filled: true,
                  //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  //
                  //   ),
                  //
                  // ),
                  // Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 5)),
                  // TextFormField(
                  //   style:  Theme.of(context).textTheme.bodyText1,
                  //
                  //   decoration: InputDecoration(
                  //     labelText: 'Password',
                  //     icon: Icon(Icons.vpn_key),
                  //     fillColor: Colors.white,
                  //     filled: true,
                  //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  //   ),
                  // ),
                  // SizedBox(
                  //   width: 150,
                  //   child: ElevatedButton.icon(onPressed: (){
                  //
                  //   },
                  //       icon: const Icon(Icons.login),
                  //       label: const Text("Login")),
                  // ),
                  // SizedBox(
                  //   width: 150,
                  //
                  //   child: ElevatedButton.icon(onPressed: (){
                  //
                  //   },
                  //       icon: const Icon(Icons.add),
                  //       label: const Text("Register")),
                  // ),
                ),
              ),
            );
          }
          return Scaffold(
              body: Center(child: CircularProgressIndicator(),),
          );
        }

    );
  }
}
