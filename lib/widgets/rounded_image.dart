import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class RoundedImageNetwork extends StatelessWidget{
  final String imagePath;
  final double size;

  RoundedImageNetwork({
    required Key key,
    required this.imagePath,
    required this.size,
  }):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imagePath),
        ),
        borderRadius: BorderRadius.all(Radius.circular(size)),
        color: Colors.black,
      ),
    );
  }
}

class RoundedImageFile extends StatelessWidget {
  final File image;
  final double size;
  RoundedImageFile({
    required Key key,
    required this.image,
    required this.size,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        /*image: DecorationImage(
          //image: Image.file(image),                                       //Image.file(image),                           
          fit: BoxFit.cover,
        ),*/
        borderRadius: BorderRadius.all(Radius.circular(size)),
        color: Colors.black,
      ),
      child: Image.file(
        image,
        fit: BoxFit.cover,
        
        ),
    );
  }
}