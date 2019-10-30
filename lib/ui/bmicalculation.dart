import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BMICalculation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new BIMCalculationState();
  }
}

class BIMCalculationState extends State<BMICalculation> {

final TextEditingController _ageController = new TextEditingController();
final TextEditingController _heightController = new TextEditingController();
final TextEditingController _weightController = new TextEditingController();
double _bmi = 0.0;

void handleController(){
  setState(() {
    _bmi = calculate(_heightController.text , _weightController.text);
  });
}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.pinkAccent,
        title: new Text(
          "BIM",
          style: new TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          children: <Widget>[
            new Image.asset(
              'images/bmilogo.png',
              width: 150,
              height: 150,
            ),
            new Container(
              width: 400,
              height: 300,
              color: Colors.black12,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    keyboardType: TextInputType.number,
                    controller: _ageController,
                    decoration: new InputDecoration(
                      labelText: "Age",
                      hintText: "Age",
                      icon: new Icon(Icons.person)
                    ),
                  ),
                  new TextField(
                    keyboardType: TextInputType.number,
                    controller:_heightController ,
                    decoration: new InputDecoration(
                        labelText: "Height",
                        hintText: "Height",
                        icon: new Icon(Icons.assessment),
                    ),
                  ),
                  new TextField(
                    keyboardType: TextInputType.number,
                    controller: _weightController,
                    decoration: new InputDecoration(
                      labelText: "Weight in lb",
                      hintText: "Weight in lb",
                      icon: new Icon(Icons.calendar_view_day),
                    ),
                  ),
                  new Padding(padding: EdgeInsets.all(20)),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new FlatButton(
                          onPressed: handleController,
                          color: Colors.pink,
                          child: new Text("Calculate")),
                    ],
                  ),
                ],
              ),
            ),
            new Container(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text(
                    "Your BIM is $_bmi",
                    style: new TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w800,
                      fontSize: 20
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  double calculate(String height , String weight) {
    return double.parse(weight)/(double.parse(height) * double.parse(height));
  }
}
