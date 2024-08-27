import 'package:doggodash/Screens/HomeScreen.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      Duration(milliseconds: 60),
      () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Homescreen(),
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.sizeOf(context).height * 1.0,
        width: MediaQuery.sizeOf(context).width * 1.0,
        decoration: const BoxDecoration(
            // color: Colors.blue,
            image: DecorationImage(
                image: AssetImage(
                  "assets/boy playing with dog.png",
                ),
                fit: BoxFit.contain)),
        child: Stack(
          children: [
            Positioned(
              top: MediaQuery.sizeOf(context).height * 0.86,
              left: MediaQuery.sizeOf(context).width * 0.25,
              right: MediaQuery.sizeOf(context).width * 0.25,
              child: const Center(
                  child: Text(
                "DoggoDash",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: "OpenSans"),
              )),
            )
          ],
        ),
      ),
    );
  }
}
