import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:spacex/features/edit_profile/logic/upload_profile_image/upload_profile_image_cubit.dart';
import 'package:spacex/features/edit_profile/ui/widgets/upload_profile_image_bloc_consumer.dart';
import '../../../../core/widgets/custom_icon_button.dart';

class CustomProfileImage extends StatefulWidget {
  const CustomProfileImage({super.key});

  @override
  State<CustomProfileImage> createState() => _CustomProfileImageState();
}

class _CustomProfileImageState extends State<CustomProfileImage> {
  @override
  Widget build(BuildContext context) {
    UploadProfileImageCubit uploadProfileImageCubit =
        BlocProvider.of<UploadProfileImageCubit>(context);

    return Stack(
      children: [
        const UploadProfileImageBlocConsumer(),
        Positioned(
          bottom: 10,
          right: 5,
          child: CustomIconButton(
            onTap: () async {
              try {
                final image =
                    await ImagePicker().pickImage(source: ImageSource.gallery);
                if (image == null) return;
                uploadProfileImageCubit.file = File(image.path);
                uploadProfileImageCubit.imagePath = basename(image.path);
                uploadProfileImageCubit.uploadProfileImage();
              } catch (e) {
                print('Failed to pick image: $e');
              }
            },
            size: 24,
            icon: Icons.edit,
            color: Colors.black,
            isFontAwesomeIcons: false,
            backgroundColor: Colors.white.withOpacity(0.7),
          ),
        ),
      ],
    );
  }
}
