import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../pages/take_photo.dart';

class CameraAvatar extends StatefulWidget {
  String? photo;
  final String uid;
  CameraAvatar(this.uid, {super.key, this.photo});

  @override
  State<CameraAvatar> createState() => _CameraAvatarState();
}

class _CameraAvatarState extends State<CameraAvatar> {
  @override
  Widget build(BuildContext context) {
    Widget icon;
    if (widget.photo == null || widget.photo!.length < 4) {
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

          nav.pop();
          var imagePath = await nav.push<String>(
            MaterialPageRoute(
              builder: (context) => TakePhoto(widget.uid, camara: camera),
            ),
          );

          if (imagePath != null && imagePath.isNotEmpty) {
            setState(() {
              widget.photo = imagePath;
            });
          }
        },
      );
    } else {
      icon = InkResponse(
        // radius: 10.0,
        // highlightShape: BoxShape.circle,
        highlightColor: Colors.black38,
        splashColor: Colors.black38,
        child: CircleAvatar(
          maxRadius: 35.0,
          backgroundImage: NetworkImage(widget.photo!),
        ),
        onTap: () async {
          var nav = Navigator.of(context);

          final cameras = await availableCameras();
          final camera = cameras[1];

          // nav.pop();
          var imagePath = await nav.push<String>(
            MaterialPageRoute(
              builder: (context) => TakePhoto(widget.uid, camara: camera),
            ),
          );

          if (imagePath != null && imagePath.isNotEmpty) {
            setState(() {
              widget.photo = imagePath;
            });
          }
        },
      );
    }
    return icon;
  }
}
