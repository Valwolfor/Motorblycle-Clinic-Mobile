import 'package:flutter/material.dart';

class TitleBar extends StatelessWidget {
  const TitleBar({super.key});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: .75,
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color(0xffBA5C0B),
          border: Border.all(
            width: 1.0,
            color: const Color(0x44EEA15E),
          ),
          borderRadius: const BorderRadius.all(
              Radius.circular(10.0) //                 <--- border radius here
              ),
          // ignore: prefer_const_literals_to_create_immutables
          boxShadow: [
            // ignore: prefer_const_constructors
            BoxShadow(
              color: const Color(0xffEEA15E),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, .5),
            ),
          ],
        ),
        child: const Center(
          child: Text(
            "Motorcycle Clinic App",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
            ),
          ),
        ),
      ),
    );
  }
}
