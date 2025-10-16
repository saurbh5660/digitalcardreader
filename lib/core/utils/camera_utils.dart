import 'package:digital_card_grader/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CameraUtils {
  const CameraUtils._();
  static final _imagePicker = ImagePicker();
  static Future<XFile?> openCamera() async {
    return await _imagePicker.pickImage(
      source: ImageSource.camera,
      imageQuality: 60,
    );
  }
  static Future<XFile?> openGallery() async {
    return await _imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 60,
    );
  }

  static Future<XFile?> openDialog() async {
    return showModalBottomSheet(
      context: Get.context!,
      isScrollControlled: true,
      builder: (context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                onTap: () async {
                  final image = await _imagePicker.pickImage(
                    source: ImageSource.camera,
                    imageQuality: 60,
                  );
                  Get.back(result: image);
                },
                leading: Icon(
                  Icons.camera_alt,
                  color: AppColors.swatch,
                  size: 30,
                ),
                title: Text(
                  "Camera",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                onTap: () async {
                  final image = await _imagePicker.pickImage(
                    source: ImageSource.gallery,
                    imageQuality: 60,
                  );
                  Get.back(result: image);
                },
                leading: Icon(Icons.image, color: AppColors.swatch, size: 30),
                title: Text(
                  "Gallery",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
