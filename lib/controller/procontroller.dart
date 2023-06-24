import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class procontrolller extends ChangeNotifier {
  File? img;
  File? get images => img;
  imageacces(var source) async {
    var picker = await ImagePicker().pickImage(source: source,imageQuality: 50);
    if (picker != null) {
      img = File(picker.path);
      notifyListeners();
    } else {
      return;
    }

    notifyListeners();
  }
}
