import 'dart:async';
import 'package:flutter/material.dart';
import 'package:native_device_orientation/native_device_orientation.dart';

class NativeDeviceOrientationCommunicatorSample extends StatefulWidget {
  const NativeDeviceOrientationCommunicatorSample({super.key});

  @override
  State<NativeDeviceOrientationCommunicatorSample> createState() =>
      _NativeDeviceOrientationCommunicatorSampleState();
}

class _NativeDeviceOrientationCommunicatorSampleState
    extends State<NativeDeviceOrientationCommunicatorSample> {
  late StreamSubscription<NativeDeviceOrientation> subscription;
  NativeDeviceOrientation _currentOrientation = NativeDeviceOrientation.unknown;

  @override
  void initState() {
    super.initState();
    subscription = NativeDeviceOrientationCommunicator()
        .onOrientationChanged(
            useSensor: true,
            defaultOrientation: NativeDeviceOrientation.unknown)
        .listen((orientation) {
      setState(() {
        _currentOrientation = orientation;
      });
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  Widget customWidget(String text, Color color) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: color,
      child: Text(text,
          style: const TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: const Text("device orientation test"),
      ),
      body: Center(
        child: _buildOrientationDependentWidget(),
      ),
    );
  }

  Widget _buildOrientationDependentWidget() {
    switch (_currentOrientation) {
      case NativeDeviceOrientation.portraitUp:
        return customWidget("portrait Up", Colors.red);
      case NativeDeviceOrientation.landscapeLeft:
        return customWidget("landscape Left", Colors.blue);
      case NativeDeviceOrientation.landscapeRight:
        return customWidget("landscape Right", Colors.green);
      default:
        return customWidget("fallback", Colors.yellow);
    }
  }
}
