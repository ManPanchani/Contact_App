import 'package:flutter/material.dart';

class Splash_Page extends StatefulWidget {
  const Splash_Page({Key? key}) : super(key: key);

  @override
  State<Splash_Page> createState() => _Splash_PageState();
}

class _Splash_PageState extends State<Splash_Page> {
  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    await Future.delayed(
      const Duration(seconds: 5),
    );

    Navigator.of(context).pushReplacementNamed('All_Contact');
  }

  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(
              image: AssetImage(
                "images/call.png",
              ),
              color: Colors.black,
            ),
            SizedBox(
              height: 50,
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "C",
                    style: TextStyle(
                      fontSize: 70,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: ('Dancing'),
                    ),
                  ),
                  TextSpan(
                    text: "ontacts",
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: ('Dancing'),
                    ),
                  ),
                  TextSpan(
                    text: ' A',
                    style: TextStyle(
                      fontSize: 70,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: ('Dancing'),
                    ),
                  ),
                  TextSpan(
                    text: 'pp',
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: ('Dancing'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.blue,
    );
  }
}
