import 'package:auto_route/auto_route.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone/features/upload_video/cubit/upload_video_cubit.dart';
import 'package:tiktok_clone/generated/l10n.dart';
import 'package:tiktok_clone/ui/utils/dialog_utils.dart';

@RoutePage()
class UploadVideoScreen extends StatefulWidget {
  const UploadVideoScreen({super.key});

  @override
  State<UploadVideoScreen> createState() => _UploadVideoScreenState();
}

class _UploadVideoScreenState extends State<UploadVideoScreen> {
  final _cubit = UploadVideoCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(42),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              const FaIcon(
                FontAwesomeIcons.video,
                color: Colors.white38,
                size: 250,
              ),
              const SizedBox(height: 22),
              FilledButton(
                onPressed: () {
                  showPickVideoOrPhotoDialog(
                    context,
                    onCamera: () async {
                      await _cubit.chooseVideo(isCamera: true);
                    },
                    onGallery: () async {
                      await _cubit.chooseVideo(isCamera: false);
                    },
                    onClose: () {
                      AutoRouter.of(context).pop();
                    },
                  );
                },
                child: Text(S.of(context).uploadVideo),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
