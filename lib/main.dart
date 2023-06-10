import 'package:device_orientation_test/page1.dart';
import 'package:device_orientation_test/page2.dart';
import 'package:device_orientation_test/page3.dart';
import 'package:device_orientation_test/page4.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const NativeDeviceOrientationReaderSample(),
      // home: const NativeDeviceOrientedWidgetSample(),
      // home: const NativeDeviceOrientationCommunicatorSample(),
      // home: const NativeDeviceOrientedWidgetSample2(),
    );
  }
}
