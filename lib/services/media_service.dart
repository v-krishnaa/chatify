import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
class MediaService {
  MediaService(){}

  File? file;
  ImagePicker image = ImagePicker();



  Future<PlatformFile?> pickImageFromLibrary() async {
    FilePickerResult? _result = await FilePicker.platform.pickFiles();            //type: FileType.image

    if (_result != null){
      return _result.files.first;
    }else{
      return null;
    }
    
  }
  Future<File?> PickImageFromLibrary() async{
    var img = await image.pickImage(source: ImageSource.gallery);
    if (img!= null){
      return file = File(img.path);
    }else{
      return null;
    }


  }
}