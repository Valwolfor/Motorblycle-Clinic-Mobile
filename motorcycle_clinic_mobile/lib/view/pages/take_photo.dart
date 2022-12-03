import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class TakePhoto extends StatefulWidget {
  final CameraDescription camara;

  const TakePhoto({super.key, required this.camara});

  @override
  State<TakePhoto> createState() => _TakePhotoState();
}

class _TakePhotoState extends State<TakePhoto> {
  late CameraController _controller;
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

            if (!mounted) return;
            //no retorna estoo
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
