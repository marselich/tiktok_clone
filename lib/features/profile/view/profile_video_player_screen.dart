import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/models/video/video_model.dart';
import 'package:tiktok_clone/core/features/video_player/widgets/video_layout.dart';

@RoutePage()
class ProfileVideoPlayerScreen extends StatefulWidget {
  const ProfileVideoPlayerScreen({
    super.key,
    required this.videoModelList,
    required this.currentVideoIndex,
  });

  final List<VideoModel> videoModelList;
  final int currentVideoIndex;

  @override
  State<ProfileVideoPlayerScreen> createState() =>
      _ProfileVideoPlayerScreenState();
}

class _ProfileVideoPlayerScreenState extends State<ProfileVideoPlayerScreen> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController =
        PageController(initialPage: widget.currentVideoIndex, keepPage: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: PageView.builder(
        allowImplicitScrolling: true,
        scrollDirection: Axis.vertical,
        controller: _pageController,
        itemBuilder: (context, index) {
          return VideoLayout(
            key: Key(widget.videoModelList[index].videoId),
            videoModel: widget.videoModelList[index],
          );
        },
        itemCount: widget.videoModelList.length,
      ),
    );
  }
}
