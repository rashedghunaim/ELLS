import 'package:flutter/material.dart';
import 'package:flutter_web_image_picker/flutter_web_image_picker.dart';

class TestImageScreen extends StatefulWidget {
  @override
  _TestImageScreenState createState() => _TestImageScreenState();
}

class _TestImageScreenState extends State<TestImageScreen> {
  Image image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(image?.semanticLabel ?? ""),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.open_in_browser),
      //   onPressed: () async {
      //     final _image = await FlutterWebImagePicker.getImage;
      //     print(image);
      //     setState(() {
      //       image = _image;
      //     });
      //   },
      // ),
      // body: Center(
      //   child: image != null ? image : Text('No data...'),
      // ),
    );
  }
}
