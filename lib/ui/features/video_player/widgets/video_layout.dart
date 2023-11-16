import 'package:auto_route/auto_route.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tiktok_clone/models/video/video_model.dart';
import 'package:tiktok_clone/repository/video_player/i_video_player_repository.dart';
import 'package:tiktok_clone/router/app_router.dart';
import 'package:tiktok_clone/ui/features/video_player/cubit/video_player_cubit.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'tiktok_video_controls.dart';
import 'video_action_bar.dart';
import 'video_info_bar.dart';

class VideoLayout extends StatefulWidget {
  const VideoLayout({
    super.key,
    required this.videoModel,
  });

  final VideoModel videoModel;

  @override
  State<VideoLayout> createState() => _VideoLayoutState();
}

class _VideoLayoutState extends State<VideoLayout> {
  late FlickManager _flickManager;
  late VideoPlayerCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = VideoPlayerCubit(GetIt.I.get<IVideoPlayerRepository>());
    _cubit.init(widget.videoModel);

    _flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.networkUrl(
        Uri.parse(widget.videoModel.videoUrl),
      ),
      autoPlay: false,
      autoInitialize: true,
      onVideoEnd: () {
        _flickManager.flickControlManager!.replay();
      },
    );
  }

  @override
  void dispose() {
    _flickManager.flickControlManager!.pause().then((value) {
      _flickManager.dispose();
    });
    super.dispose();
  }

  Future<void> _handleVisibilityDetector(VisibilityInfo info) async {
    if (info.visibleFraction == 0) {
      /// The screen is disappeared
      await _flickManager.flickControlManager!.pause();
      // }
    } else {
      /// The screen is appeared
      await _flickManager.flickControlManager!.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoPlayerCubit, VideoPlayerState>(
      bloc: _cubit,
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (videoModel, isLiked) {
            return GestureDetector(
              onHorizontalDragEnd: (details) {
                if (details.primaryVelocity == null) return;
                if (details.primaryVelocity! < 0) {
                  AutoRouter.of(context).push(ProfileRoute(
                    userId: videoModel.userId,
                  ));
                }
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  VisibilityDetector(
                    key: widget.key!,
                    onVisibilityChanged: (info) async =>
                        await _handleVisibilityDetector(info),
                    child: FlickVideoPlayer(
                      flickManager: _flickManager,
                      flickVideoWithControls: const FlickVideoWithControls(
                        controls: TikTokVideoControls(),
                        videoFit: BoxFit.contain,
                      ),
                    ),
                  ),
                  VideoActionBar(
                    userId: videoModel.userId,
                    userProfileImage: videoModel.userProfileImage,
                    totalLikes: videoModel.totalLikes,
                    totalComments: videoModel.totalComments,
                    totalShares: videoModel.totalShares,
                    onLikeTap: () async {
                      await _cubit.changeLikeInVideo(videoModel, isLiked);
                    },
                    isLikeTapped: isLiked,
                  ),
                  VideoInfoBar(
                    userName: videoModel.userName,
                    descriptionTags: videoModel.descriptionTags,
                    artistSongName: videoModel.artistSongName,
                  ),
                ],
              ),
            );
          },
          orElse: () => Container(),
        );
      },
    );
  }
}
