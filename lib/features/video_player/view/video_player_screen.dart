import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_clone/features/video_player/cubit/video_player_cubit.dart';

import '../widgets/widgets.dart';

@RoutePage()
class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  final _cubit = VideoPlayerCubit();

  late PageController _pageController;

  final int _currentPage = 0;
  final bool _isOnPageTurning = false;

  List<String> tempVideoUrls = [
    "https://2ch.hk/media/src/797419/16975567026710.mp4",
    "https://2ch.hk/media/src/797419/16979198360860.mp4",
    "https://2ch.hk/media/src/638755/16978788865240.webm",
    "https://2ch.hk/media/src/790431/16965173149372.mp4",
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, keepPage: true);

    _pageController.addListener(
      () => _cubit.pageViewScrollListener(_pageController),
    );
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
      body: BlocProvider(
        create: (context) => _cubit,
        child: PageView.builder(
          scrollDirection: Axis.vertical,
          controller: _pageController,
          itemBuilder: (context, index) {
            return VideoLayout(
              userName: 'vanomas',
              userProfileImage:
                  'https://3fc4ed44-3fbc-419a-97a1-a29742511391.selcdn.net/coub_storage/coub/simple/cw_timeline_pic/e9a4332e0f7/1d1f60adf7f5828c916c7/1409833620_image.jpg',
              totalComments: 12,
              totalShares: 23,
              totalLikes: 23,
              artistSongName: 'ChoTo',
              descriptionTags: 'kavo',
              videoUrl: tempVideoUrls[index],
              publishedDateTime: 123123123,
            );
          },
          itemCount: 4,
        ),
      ),
    );
  }
}
