import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(30.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(150.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0xffBA5C0B),
            spreadRadius: 0.2,
            blurRadius: 10,
            offset: Offset(0, .5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(180.0),
        child: Image.asset(
          'assets/logo.png',
          width: 220.0,
        ),
      ),
    );
  }
}
