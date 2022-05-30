import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Classifier extends StatefulWidget {
  Classifier({Key? key}) : super(key: key);

  @override
  State<Classifier> createState() => _ClassifierState();
}

class _ClassifierState extends State<Classifier> {

  late File _image;
  final _picker=ImagePicker();
  
  
  void pickImage(bool camera) async{
    
    var img= await _picker.pickImage(source: camera ? ImageSource.camera : ImageSource.gallery);
    setState(() {
      _image=File(img!.path);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Classifier"),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image == null ? const Text("Upload an Image") :
            Image.file(_image),

            const SizedBox( height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(onPressed: (){}, child: const Text("camera"), ),
                MaterialButton(onPressed: (){}, child: const Text("gallery"), )
              ],
            )
          ],
        ),

      ),
    );
  }
}