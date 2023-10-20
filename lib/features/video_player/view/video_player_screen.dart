import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

@RoutePage()
class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late PageController _pageController;

  int _currentPage = 0;
  bool _isOnPageTurning = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, keepPage: true);

    /// Remember add the scroll listener
    _pageController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_isOnPageTurning &&
        _pageController.page == _pageController.page!.roundToDouble()) {
      setState(() {
        _currentPage = _pageController.page!.toInt();
        _isOnPageTurning = false;
      });
    } else if (!_isOnPageTurning &&
        _currentPage.toDouble() != _pageController.page) {
      if ((_currentPage.toDouble() - _pageController.page!).abs() > 0.7) {
        setState(() {
          _isOnPageTurning = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {},
              child: const Text("Following"),
            ),
            TextButton(
              onPressed: () {},
              child: const Text("For You"),
            ),
          ],
        ),
      ),
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        controller: _pageController,
        itemBuilder: (context, index) {
          return const VideoLayout(
            userName: 'vanomas',
            userProfileImage:
                'https://3fc4ed44-3fbc-419a-97a1-a29742511391.selcdn.net/coub_storage/coub/simple/cw_timeline_pic/e9a4332e0f7/1d1f60adf7f5828c916c7/1409833620_image.jpg',
            totalComments: 12,
            totalShares: 23,
            totalLikes: 23,
            artistSongName: 'ChoTo',
            descriptionTags: 'kavo',
            videoUrl: 'https://2ch.hk/media/src/797419/16975567026710.mp4',
            publishedDateTime: 123123123,
          );
        },
        itemCount: 5,
      ),
    );
  }
}
