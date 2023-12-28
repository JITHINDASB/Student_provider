import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class StudentImage extends ChangeNotifier{
  String?imgPath;

  Future<void>getimage()async{
    final image=await ImagePicker().pickImage(source: ImageSource.gallery);
    if(image ==null){
       return;
    }
    final selectimage =File(image.path);
    imgPath = selectimage.path;
    notifyListeners();
  }
}