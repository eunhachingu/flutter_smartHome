import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class SmartButton extends StatelessWidget {
  final iconPath;
  final String textSmart;
  final bool powerOn;
  void Function(bool)? onChanged;

  SmartButton(
      {super.key,
      required this.powerOn,
      this.iconPath,
      required this.textSmart,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          color: powerOn ? Colors.grey[900] : Colors.grey[400],
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: powerOn ? Colors.black54 : Colors.grey.shade700,
              offset: const Offset(4, 4),
              blurRadius: 15,
              spreadRadius: 1,
            ),
            BoxShadow(
              color: powerOn ? Colors.black26 : Colors.white,
              offset: const Offset(-4, -4),
              blurRadius: 15,
              spreadRadius: 1,
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            iconPath,
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                  Text(
                    textSmart,
                    style:
                        TextStyle(color: powerOn ? Colors.white : Colors.black),
                  ),
                  Transform.rotate(
                    angle: pi / 2,
                    child:
                        CupertinoSwitch(value: powerOn, onChanged: onChanged),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
