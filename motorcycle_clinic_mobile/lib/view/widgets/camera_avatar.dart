import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import '../pages/take_photo.dart';

class CameraAvatar extends StatefulWidget {
  const CameraAvatar({super.key});

  @override
  State<CameraAvatar> createState() => _CameraAvatarState();
}

class _CameraAvatarState extends State<CameraAvatar> {
  String? _photo;

  @override
  Widget build(BuildContext context) {
    Widget icon;

    if (_photo == null) {
      icon = IconButton(
        icon: const CircleAvatar(
          backgroundColor: Color(0xff4D581C),
          child: Icon(
            Icons.camera_alt,
            size: 40.0,
            color: Colors.white70,
          ),
        ),
        onPressed: () async {
          var nav = Navigator.of(context);

          final cameras = await availableCameras();
          final camera = cameras.first;

          // nav.pop();
          var imagePath = await nav.push<String>(
            MaterialPageRoute(
              builder: (context) => TakePhoto(camara: camera),
            ),
          );

          if (imagePath != null && imagePath.isNotEmpty) {
            setState(() {
              _photo = imagePath;
            });
          }
        },
      );
    } else {
      icon = CircleAvatar(
        backgroundImage: FileImage(
          File(_photo!),
        ),
      );
    }
    return icon;
  }
}
