import 'package:flutter/material.dart';

class Bmi extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new BmiState();
  }
}

class BmiState extends State<Bmi> {

  // controllers
  final TextEditingController ageController = new TextEditingController();
  final TextEditingController weightController = new TextEditingController();
  final TextEditingController heightController = new TextEditingController();

  double inches = 0.0;

  double result = 0.0;

  String _readingResult = "";

  String _finalResult = "";


  void calculateBMI(){

    setState((){

      // getting text from controllers
      int age = int.parse(ageController.text);
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text);
      // convert feet into inches
      inches = height*12;

      if(ageController.text.isNotEmpty || age > 0
      && weightController.text.isNotEmpty || weight > 0
      && heightController.text.isNotEmpty || inches > 0){

        result  = weight / (inches * inches) * 703;

        // checking for level of weight based on result
        if(double.parse(result.toStringAsFixed(1)) < 18.5){
          _readingResult = "Underweight";
        }
        else if(double.parse(result.toStringAsFixed(1)) >= 18.5 && result < 25){
          _readingResult = "Normal";
        }
        else if(double.parse(result.toStringAsFixed(1)) >= 25.0 && result < 30){
          _readingResult = "Overweight";
        }
        else if(double.parse(result.toStringAsFixed(1)) >=30.0){
          _readingResult = "Obesity";
        }

      }
      else{
        result = 0.0;
      }

    });

    _finalResult = "Your BMI: ${result.toStringAsFixed(1)}";

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: new Text("BMI"),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),

      //backgroundColor: Colors.white,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(2.0),
          children: <Widget>[
            // adding logo
            Image.asset(
              "images/bmilogo.png",
              width: 85.0,
              height: 85.0,
            ),

            new Container(
              margin: const EdgeInsets.all(2.0),
              width: 290.0,
              height: 245.0,
              color: Colors.grey.shade200,
              child: new Column(
                children: <Widget>[
                  // Age TextField
                  TextField(
                    controller: ageController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: "Age",
                        hintText: "e.g: 34",
                        icon: Icon(Icons.person_outline)),
                  ),

                  // Weight TextField
                  TextField(
                    controller: weightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: "Weight in lbs",
                        hintText: "e.g: 180",
                        icon: Icon(Icons.line_weight)),
                  ),

                  // Height TextField
                  TextField(
                    controller: heightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: "Height in feet",
                        hintText: "e.g: 180",
                        icon: Icon(Icons.insert_chart)),
                  ),

                  new Padding(padding: const EdgeInsets.all(10.0)),

                  // calculate button
                  new Container(
                    alignment: Alignment.center,
                    child: new RaisedButton(
                      onPressed: () => debugPrint("Hello There!"),
                      color: Colors.pinkAccent,
                      child: new Text("Calculate",style: TextStyle(
                        color: Colors.white
                      ),),
                    ),
                  ),
                ],
              ),
            ),

            new Padding(padding: const EdgeInsets.all(5.0)),

            // adding text to display result
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text("$_finalResult",
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 19.9,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic
                ),),

                new Padding(padding: const EdgeInsets.all(10.0)),

                new Text("$_readingResult",
                  style: TextStyle(
                    color: Colors.pinkAccent,
                      fontSize: 19.9,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic
                  ),)

              ],
            ),

          ],
        ),
      ),
    );
  }
}
