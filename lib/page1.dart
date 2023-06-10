import 'package:flutter/material.dart';
import 'package:native_device_orientation/native_device_orientation.dart';

class NativeDeviceOrientationReaderSample extends StatefulWidget {
  const NativeDeviceOrientationReaderSample({super.key});

  @override
  State<NativeDeviceOrientationReaderSample> createState() =>
      _NativeDeviceOrientationReaderSampleState();
}

class _NativeDeviceOrientationReaderSampleState
    extends State<NativeDeviceOrientationReaderSample> {
  @override
  Widget build(BuildContext context) {
    Widget customText(String text) {
      return Text(text,
          style: const TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ));
    }

    bool useSensor = false;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("device orientation test"),
      ),
      body: Center(
        child: NativeDeviceOrientationReader(
          builder: (context) {
            NativeDeviceOrientation orientation =
                NativeDeviceOrientationReader.orientation(context);

            /// それぞれの向きに応じたWidgetを表示したり、向きに応じた処理を実行できる
            if (orientation == NativeDeviceOrientation.portraitUp) {
              print("portrait Up");
              return customText("portrait Up");
            } else if (orientation == NativeDeviceOrientation.portraitDown) {
              print("portrait Down");
              return customText("portrait Down");
            } else if (orientation == NativeDeviceOrientation.landscapeLeft) {
              print("landscape Left");
              return customText("landscape Left");
            } else if (orientation == NativeDeviceOrientation.landscapeRight) {
              print("landscape Right");
              return customText("landscape Right");
            } else {
              print("unknown");
              return customText("unknown");
            }
          },
          useSensor: useSensor,
        ),
      ),
    );
  }
}
