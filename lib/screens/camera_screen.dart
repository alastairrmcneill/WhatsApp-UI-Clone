// import 'package:flutter/material.dart';

// class CameraScreen extends StatefulWidget {
//   late final List<CameraDescription> cameras;

//   CameraScreen({required this.cameras});

//   @override
//   _CameraScreenState createState() => _CameraScreenState();
// }

// class _CameraScreenState extends State<CameraScreen> {
//   late CameraController _cameraController;

//   @override
//   void initState() {
//     super.initState();
//     _cameraController = CameraController(widget.cameras[0], ResolutionPreset.medium);
//     _cameraController.initialize().then((_) {
//       if (!mounted) {
//         return;
//       }
//       setState(() {});
//     });
//   }

//   @override
//   void dispose() {
//     _cameraController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (!_cameraController.value.isInitialized) {
//       return new Container();
//     }
//     return new AspectRatio(
//       aspectRatio: _cameraController.value.aspectRatio,
//       child: CameraPreview(_cameraController),
//     );
//   }
// }
