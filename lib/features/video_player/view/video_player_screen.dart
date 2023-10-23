import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tiktok_clone/features/video_player/cubit/video_player_cubit.dart';
import 'package:tiktok_clone/repository/home/i_home_repository.dart';

import '../widgets/widgets.dart';

@RoutePage()
class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  final _cubit = VideoPlayerCubit(GetIt.I.get<IHomeRepository>());

  late PageController _pageController;

  int _currentPage = 0;
  bool _isOnPageTurning = false;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: 0, keepPage: true);

    _pageController.addListener(
      () => _cubit.pageViewScrollListener(_pageController),
    );
  }

  @override
  void didChangeDependencies() async {
    await _cubit.getVideoList();
    super.didChangeDependencies();
  }

  Future<void> _onRefresh() async {
    await _cubit.getVideoList();
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
        child: BlocConsumer<VideoPlayerCubit, VideoPlayerState>(
          bloc: _cubit,
          listener: (context, state) {
            state.maybeWhen(
              pageScrolled: (currentPage, isOnPageTurning) {
                _currentPage = currentPage;
                _isOnPageTurning = isOnPageTurning;
              },
              orElse: () {},
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              loaded: (videoModelList) {
                return RefreshIndicator(
                  onRefresh: _onRefresh,
                  child: PageView.builder(
                    scrollDirection: Axis.vertical,
                    controller: _pageController,
                    itemBuilder: (context, index) {
                      return VideoLayout(
                        videoModel: videoModelList[index],
                        isPaused: _isOnPageTurning,
                        pageIndex: index,
                        currentPageIndex: _currentPage,
                      );
                    },
                    itemCount: videoModelList.length,
                  ),
                );
              },
              orElse: () => Container(),
            );
          },
        ),
      ),
    );
  }
}
