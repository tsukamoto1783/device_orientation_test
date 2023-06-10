import 'package:flutter/material.dart';
import 'package:native_device_orientation/native_device_orientation.dart';

class NativeDeviceOrientedWidgetSample2 extends StatefulWidget {
  const NativeDeviceOrientedWidgetSample2({super.key});

  @override
  State<NativeDeviceOrientedWidgetSample2> createState() =>
      _NativeDeviceOrientedWidgetSample2State();
}

class _NativeDeviceOrientedWidgetSample2State
    extends State<NativeDeviceOrientedWidgetSample2>
    with WidgetsBindingObserver {
  NativeDeviceOrientationCommunicator communicator =
      NativeDeviceOrientationCommunicator();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  // resume()とpause()を使用したサンプル
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        communicator.resume();
        break;
      case AppLifecycleState.paused:
        communicator.pause();
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
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

    bool useSensor = true;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("device orientation test"),
      ),
      body: Center(
        /// それぞれの向きに応じたWidgetを表示したり、向きに応じた処理を実行できる
        child: NativeDeviceOrientedWidget(
          portraitUp: (context) => customWidget("portrait Up", Colors.red),
          landscapeLeft: (context) =>
              customWidget("landscape Left", Colors.blue),
          landscapeRight: (context) {
            print("landscape Right");
            return customWidget("landscape Right", Colors.green);
          },
          fallback: (context) => customWidget("fallback", Colors.yellow),
          useSensor: useSensor,
        ),
      ),
    );
  }
}
