import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kcal/model/profile.dart';

class Register extends StatelessWidget {
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
                title: Text("Register page"),
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
                                "Register",
                                style: TextStyle(fontSize: 20),
                              ),
                              onPressed: () async{
                                if(formKey.currentState!.validate()){
                                  formKey.currentState!.save();
                                  print(pro.email);
                                  print(pro.pass);
                                  try{
                                    FirebaseAuth.instance.createUserWithEmailAndPassword(

                                        email: pro.email!,
                                        password: pro.pass!
                                    );
                                    formKey.currentState!.reset();

                                  }on FirebaseAuthException catch(e){
                                    print(e.message);
                                  }

                                  // await collect.add({
                                  //   "email": user.email,
                                  //   "pass": user.pass
                                  // });
                                  
                                }
                              },
                            )),
                      ],
                    ),
                  ),


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
