import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() {
    var duration = const Duration(seconds: 2);

    Timer(duration, () {
      Navigator.pushReplacementNamed(context, "/signup");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SafeArea(
          child: Scaffold(
            body: content(),
          ),
        ),
        const SafeArea(
            child: Padding(
          padding: EdgeInsets.only(top: 200),
          child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                """HAND IN 
                  HAND UP""",
                style: TextStyle(
                    color: Color.fromARGB(255, 232, 97, 7),
                    fontSize: 30,
                    decoration: TextDecoration.none),
              )),
        )),
      ],
    );
  }

  Widget content() {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  'https://media.istockphoto.com/id/1424987910/tr/fotoğraf/coworkers-with-stacked-hands-at-the-office.jpg?s=612x612&w=0&k=20&c=7L8f5w07WuUjolUWlgyvexqxZUmfwaJQ5n6jR3v16rU='))),
    );
  }
}
