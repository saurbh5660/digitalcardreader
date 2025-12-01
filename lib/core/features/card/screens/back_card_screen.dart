import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/common_appbar.dart';
import '../controllers/card_upload_controller.dart';

class BackCardScreen extends StatelessWidget {
  BackCardScreen({super.key});
  final controller = Get.put(CardUploadController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
        title: "Upload Card",
        actions: [Padding(padding: const EdgeInsets.symmetric(horizontal: 35))],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _title("Back Side"),
            const SizedBox(height: 12),
            _uploadBox(isFront: true),
            const SizedBox(height: 40),
            Obx(() {
              bool enabled =
                  controller.backCard.value != null;
              return ElevatedButton(
                onPressed: enabled
                    ? () {
                        controller.uploadBackGrade();
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  disabledBackgroundColor: Colors.grey,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text(
                  "Continue",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _title(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _uploadBox({required bool isFront}) {
    return Obx(() {
      final file = controller.backCard.value;
      return GestureDetector(
        onTap: () => {
          controller.scanBackCard()
        },
        child: Container(
          height: 220,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: Colors.grey.shade400),
          ),
          child: file == null
              ? _emptyUploadBox()
              : _imagePreview(file, isFront),
        ),
      );
    });
  }

  Widget _emptyUploadBox() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.upload, size: 50, color: Colors.grey),
          SizedBox(height: 10),
          Text(
            "Tap to upload",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _imagePreview(String file, bool isFront) {
    return Stack(
      children: [
        Positioned.fill(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.file(File(file), fit: BoxFit.contain),
          ),
        ),

        Positioned(
          right: 8,
          top: 8,
          child: GestureDetector(
            onTap: () {
                controller.removeBack();
            },
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                color: Colors.black54,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.close, color: Colors.white, size: 20),
            ),
          ),
        ),
      ],
    );
  }
}
