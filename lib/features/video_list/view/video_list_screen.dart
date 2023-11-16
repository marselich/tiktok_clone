import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:tiktok_clone/features/video_list/cubit/video_list_cubit.dart';
import 'package:tiktok_clone/repository/home/i_home_repository.dart';
import 'package:tiktok_clone/ui/features/video_player/widgets/video_layout.dart';
import 'package:tiktok_clone/ui/widgets/loading_container.dart';

@RoutePage()
class VideoListScreen extends StatefulWidget {
  const VideoListScreen({super.key});

  @override
  State<VideoListScreen> createState() => _VideoListScreenState();
}

class _VideoListScreenState extends State<VideoListScreen> {
  final _cubit = VideoListCubit(GetIt.I.get<IHomeRepository>());

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, keepPage: true);
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
        child: BlocBuilder<VideoListCubit, VideoListState>(
          bloc: _cubit,
          builder: (context, state) {
            return state.maybeWhen(
              loaded: (videoModelList) {
                return RefreshIndicator(
                  onRefresh: _onRefresh,
                  child: videoModelList.isNotEmpty
                      ? PageView.builder(
                          allowImplicitScrolling: true,
                          scrollDirection: Axis.vertical,
                          controller: _pageController,
                          itemBuilder: (context, index) {
                            return VideoLayout(
                              key: Key(videoModelList[index].videoId),
                              videoModel: videoModelList[index],
                            );
                          },
                          itemCount: videoModelList.length,
                        )
                      : Center(
                          child: Column(
                            children: [
                              const FaIcon(
                                FontAwesomeIcons.faceSadTear,
                                size: 100,
                              ),
                              const SizedBox(height: 20),
                              Text(
                                "No Videos",
                                style: theme.textTheme.bodyLarge?.copyWith(
                                  color: theme.primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                );
              },
              loading: (isLoading) =>
                  const LoadingContainer(color: Colors.black),
              orElse: () => Container(),
            );
          },
        ),
      ),
    );
  }
}
