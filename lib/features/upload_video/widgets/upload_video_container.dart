import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/features/upload_video/cubit/upload_video_cubit.dart';
import 'package:tiktok_clone/generated/l10n.dart';
import 'package:tiktok_clone/core/utils/dialog_utils.dart';

class UploadVideoContainer extends StatelessWidget {
  const UploadVideoContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final UploadVideoCubit cubit = BlocProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
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
                      await cubit.chooseVideo(isCamera: true);
                    },
                    onGallery: () async {
                      await cubit.chooseVideo(isCamera: false);
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
