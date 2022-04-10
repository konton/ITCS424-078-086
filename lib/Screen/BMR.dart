import 'package:flutter/material.dart';

class BMR extends StatefulWidget{
  BMRCAL createState() => BMRCAL();
}

class BMRCAL extends State<BMR>{
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
          title: Text("BMR calculator page")
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(30, 100, 30, 0),
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(padding: EdgeInsets.fromLTRB(50, 10, 30, 0)),
                Text(
                  "Input age",
                  style: TextStyle(fontSize: 20),
                ),
                TextFormField(
                  controller: age,
                ),
                Text(
                  "Input Weight",
                  style: TextStyle(fontSize: 20),
                ),
                TextFormField(
                  controller: weight,
                ),
                Text(
                  "Input Height",
                  style: TextStyle(fontSize: 20),
                ),
                TextFormField(
                  controller: height,
                ),
                new Text("BMR: $result", style: TextStyle(fontSize: 20)),
                SizedBox(
                    child: ElevatedButton(
                      child: Text(
                        "Calculate",
                        style: TextStyle(fontSize: 20),
                      ),

                      onPressed: () {
                        calculate(int.parse(age.text), int.parse(height.text), int.parse(weight.text));
                      },

                    )),

              ],

            ),
          ),

        ),
      ),
    );
  }

}