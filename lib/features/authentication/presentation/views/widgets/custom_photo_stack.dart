import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop_mate/core/utils/app_colors.dart';

import '../../manager/sign_up_with_email_cubit/sign_up_with_email_cubit.dart';

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
        //
      }
      if (image != null) {
        selectedImage = File(image.path);
        if (context.mounted) {
          BlocProvider.of<SignUpWithEmailCubit>(context).profileImage =
              selectedImage;
        }
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
              highlightColor: Colors.grey.shade400,
              icon: Icon(
                Icons.add_a_photo_outlined,
                color: (selectedImage != null)
                    ? Colors.grey.shade200
                    : AppColors.primaryColor,
                size: (selectedImage != null) ? 22 : 26,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
