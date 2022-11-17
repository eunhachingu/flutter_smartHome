import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home/util/smart_device_box.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  List mySmartDevices = [
    // [ smartDeviceName, iconPath, powerStatus]
    ["Smart Light", const Icon(Icons.light), true],
    ["Smart AC", const Icon(Icons.ac_unit), false],
    ["Smart TV", const Icon(Icons.tv), true],
    ["Smart Fan", const Icon(Icons.mode_fan_off), false],
  ];

  void powerSwitchChanged(bool value, int index) {
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // nav
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 45.0, vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //icon
                  const Icon(
                    Icons.logo_dev_outlined,
                    size: 45,
                  ),
                  // profile
                  const Icon(
                    Icons.people,
                    size: 45,
                  )
                ],
              ),
            ),

            // hero
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome Home,",
                      style: GoogleFonts.bebasNeue(
                        fontSize: 32,
                      ),
                    ),
                    Text("CHOI NAV",
                        style: GoogleFonts.bebasNeue(
                          fontSize: 72,
                        ))
                  ],
                )),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Divider(
                color: Colors.grey[400],
                thickness: 1,
              ),
            ),

            // body
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Text(
                "Smart Devices",
                style: GoogleFonts.bebasNeue(
                  fontSize: 20,
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                itemCount: mySmartDevices.length,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(25.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1,
                  crossAxisCount: 2,
                ),
                itemBuilder: ((context, index) {
                  return SmartDeviceBox(
                    smartDeviceName: mySmartDevices[index][0],
                    iconPath: mySmartDevices[index][1],
                    powerOn: mySmartDevices[index][2],
                    onChanged: (value) => powerSwitchChanged(value, index),
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
