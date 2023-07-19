


import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main(){
  return runApp(Test());
}


class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  File? file;
  ImagePicker image = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hi",
      home: Scaffold(
        appBar: AppBar(
        title : Text("Image Picker"),),
        body: Center(
          child: Column(
            children: [
              Container(
                height: 140,
                width: 180,
                color: Colors.black12,
                child: file == null
                ? Icon(
                  Icons.image,
                  size: 50,
                  )
                :Image.file(
                  file!,
                  fit: BoxFit.fill,
                ),
              ),
              MaterialButton(
                onPressed: () {
                  getgal();
                },
                color: Colors.blue[900],
                child: Text("gellary",
                style: TextStyle(
                  color: Colors.white
                ),
                ),
              ),
              SizedBox(height: 20,),
              MaterialButton(
                onPressed: () {
                  getcam();
                },
                color: Colors.blue[900],
                child: Text("camera",
                style: TextStyle(
                  color: Colors.white
                ),
                ),
              ),

            ],
          )
          ),
        ),
    );
  }
  getcam() async{
    var img = await image.pickImage(source: ImageSource.camera);
    setState(() {
      file = File(img!.path);
    });
  }
  getgal() async{
    var img = await image.pickImage(source: ImageSource.gallery);
    setState(() {
      file = File(img!.path);
    });
  }

}