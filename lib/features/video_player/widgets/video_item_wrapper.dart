import 'package:flutter/material.dart';

class VideoItemWrapper extends StatelessWidget {
  const VideoItemWrapper({
    super.key,
    required this.pageIndex,
    required this.currentPageIndex,
    required this.isPaused,
    this.videoEnded,
  });

  final int pageIndex;
  final int currentPageIndex;
  final bool isPaused;
  final void Function()? videoEnded;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
