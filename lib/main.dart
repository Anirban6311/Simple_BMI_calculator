import 'package:flutter/material.dart';
import 'splash_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class BMICalculator extends StatefulWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  String final_res = ''; // Declare as an instance variable
  bool vistext = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Center(
          child: Text("BMI CALCULATOR"),
        ),
      ),
      body: Align(
        alignment: Alignment(0, -0.5),
        child: Column(
          children: [
            Container(
              height: 60,
              width: double.infinity,
              child: Center(
                child: Text(
                  "BMI",
                  style: TextStyle(
                    fontSize: 45,
                    fontFamily: "font1",
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            Container(
              child: TextField(
                controller: weightController,
                decoration: InputDecoration(
                  hintText: "Enter Your Weight(in Kgs)",
                ),
              ),
              height: 30,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(height: 40),
            Container(
              child: TextField(
                controller: heightController,
                decoration: InputDecoration(
                  hintText: "Enter Your Height(in Mtrs)",
                ),
              ),
              height: 30,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                double Height = double.tryParse(heightController.text) ?? 0.0;
                double Weight = double.tryParse(weightController.text) ?? 0.0;
                double bmi = Weight / (Height * Height);

                if (bmi < 16.0) {
                  final_res = "Severe Thinness";
                } else if (bmi > 16.0 && bmi < 17.0) {
                  final_res = "Moderate Thinness";
                } else if (bmi > 17.0 && bmi < 18.5) {
                  final_res = "Mild Thinness";
                } else if (bmi > 18.5 && bmi < 25.0) {
                  final_res = "Normal";
                } else if (bmi > 25.0 && bmi < 30.0) {
                  final_res = "Overweight";
                } else if (bmi > 30.0 && bmi < 35.0) {
                  final_res = "Obese Class I";
                } else if (bmi > 35.0 && bmi < 40.0) {
                  final_res = "Obese Class II";
                } else {
                  final_res = "Obese Class III";
                }

                setState(() {
                  vistext = true;
                });
              },
              child: const Text("Find your BMI"),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
            ),
            SizedBox(height: 20),
            Visibility(
              visible: vistext,
              child: Center(
                child: Container(
                  child: Text(
                    'You are under the category of $final_res',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
