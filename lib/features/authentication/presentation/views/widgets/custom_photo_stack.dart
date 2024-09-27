import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop_mate/core/utils/app_colors.dart';

class CustomPhotoStack extends StatefulWidget {
  const CustomPhotoStack({
    super.key,
  });
  @override
  State<CustomPhotoStack> createState() => _CustomPhotoStackState();
}

class _CustomPhotoStackState extends State<CustomPhotoStack> {
  File? selectedImage;
  @override
  Widget build(BuildContext context) {
    Future<void> selectImage() async {
      XFile? image;
      try {
        image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
        );
      } catch (e) {
        print(e.toString());
      }
      if (image != null) {
        selectedImage = File(image.path);
        setState(() {});
      }
    }

    return Align(
      alignment: Alignment.center,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            backgroundImage:
                (selectedImage != null) ? FileImage(selectedImage!) : null,
            maxRadius: 48,
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              style: const ButtonStyle(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: () async {
                setState(() {});
                await selectImage();
              },
              highlightColor: Colors.grey.shade300,
              icon: const Icon(
                Icons.add_a_photo_outlined,
                color: AppColors.primaryColor,
                size: 26,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
