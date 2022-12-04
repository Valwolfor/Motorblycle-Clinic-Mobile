import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:motorcycle_clinic_mobile/controller/register_controller.dart';

import '/controller/request/photo_user_request.dart';

class TakePhoto extends StatefulWidget {
  final CameraDescription camara;
  String uid;

  TakePhoto(this.uid, {super.key, required this.camara});

  @override
  State<TakePhoto> createState() => _TakePhotoState();
}

class _TakePhotoState extends State<TakePhoto> {
  late CameraController _controller;
  late final RegisterController _registerController = RegisterController();
  late Future<void> _initializarControllerFuture;

  @override
  void initState() {
    _controller = CameraController(
      widget.camara,
      ResolutionPreset.medium,
    );

    _initializarControllerFuture = _controller.initialize();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    PhotoRequest photo = PhotoRequest();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tome la foto."),
        backgroundColor: const Color(0xff4D581C),
      ),
      body: FutureBuilder<void>(
        future: _initializarControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              children: [
                Expanded(child: CameraPreview(_controller)),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.camera_alt),
        onPressed: () async {
          try {
            var nav = Navigator.of(context);
            var msj = ScaffoldMessenger.of(context);
            await _initializarControllerFuture;

            final image = await _controller.takePicture();

            String path = image.path;
            photo.photo = path;
            _registerController.registerPhoto(photo, widget.uid);
            if (!mounted) return;
            //Guarda foto

            nav.pop<String>(path);
            msj.showSnackBar(
                const SnackBar(content: Text("Foto tomada con exito")));
          } catch (e) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("$e")));
          }
        },
      ),
    );
  }
}
