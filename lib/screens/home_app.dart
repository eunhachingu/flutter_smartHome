import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home/util/smart_button.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  void isPower(bool value, int index) {
    setState(() {
      mySmartButtons[index][2] = value;
    });
  }

  List mySmartButtons = [
    // [smartText, smartIcon, isSwitch]
    ["Smart Light", const Icon(Icons.light), false],
    ["Smart AC", const Icon(Icons.ac_unit), true],
    ["Smart TV", const Icon(Icons.tv), false],
    ["Smart Fan", const Icon(Icons.mode_fan_off_sharp), true],
  ];

  double horizontalPadding = 40.0;
  double verticalPadding = 25.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        color: Colors.grey[500],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // nav
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding, vertical: verticalPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.abc_sharp,
                    size: 45,
                  ),
                  const Icon(Icons.ac_unit_rounded, size: 45),
                ],
              ),
            ),
            // hero

            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "WELCOME HOME,",
                    style: GoogleFonts.oswald(),
                  ),
                  Text(
                    "CHOI NAV",
                    style: GoogleFonts.oswald(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Divider(
                color: Colors.grey[500],
                thickness: 1,
              ),
            ),

            // body
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              // ignore: prefer_const_literals_to_create_immutables
              child: Text(
                "SMART DEVICES",
                style: GoogleFonts.oswald(fontSize: 20),
              ),
            ),

            Expanded(
              child: GridView.builder(
                  itemCount: mySmartButtons.length,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.all(10.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: ((context, index) {
                    return SmartButton(
                      textSmart: mySmartButtons[index][0],
                      iconPath: mySmartButtons[index][1],
                      powerOn: mySmartButtons[index][2],
                      onChanged: (value) => isPower(value, index),
                    );
                  })),
            ),
          ],
        ),
      ),
    ));
  }
}
