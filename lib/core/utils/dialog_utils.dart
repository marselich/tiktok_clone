import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/core/widgets/tiktok_text_button.dart';

void showLoaderDialog(BuildContext context) {
  AlertDialog alert = const AlertDialog(
    backgroundColor: Colors.transparent,
    elevation: 0,
    content: Center(
      child: CircularProgressIndicator(),
    ),
  );
  showDialog(
    barrierDismissible: false,
    barrierColor: Colors.black12,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

Future<void> showPickVideoOrPhotoDialog(
  BuildContext context, {
  required VoidCallback onCamera,
  required VoidCallback onGallery,
  required VoidCallback onClose,
}) async {
  AlertDialog alert = AlertDialog.adaptive(
    backgroundColor: Colors.black87,
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TikTokTextButton(
          textButton: "Camera",
          iconData: FontAwesomeIcons.camera,
          onPressed: onCamera,
        ),
        TikTokTextButton(
          textButton: "Gallery",
          iconData: FontAwesomeIcons.fileVideo,
          onPressed: onGallery,
        ),
        TikTokTextButton(
          textButton: "Close",
          iconData: FontAwesomeIcons.xmark,
          onPressed: onClose,
        ),
      ],
    ),
  );
  await showDialog(
    barrierDismissible: false,
    barrierColor: Colors.black54,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
