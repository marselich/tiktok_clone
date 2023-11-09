import 'package:auto_route/auto_route.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/models/video/video_model.dart';
import 'package:tiktok_clone/router/app_router.dart';
import 'package:tiktok_clone/ui/features/profile/auth_profile.dart';
import 'package:tiktok_clone/ui/features/video_player/tiktok_video_controls.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

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

  @override
  void initState() {
    super.initState();

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
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity == null) return;
        if (details.primaryVelocity! < 0) {
          AutoRouter.of(context)
              .push(ProfileRoute(userId: widget.videoModel.userId));
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
            userId: widget.videoModel.userId,
            userProfileImage: widget.videoModel.userProfileImage,
            totalLikes: widget.videoModel.totalLikes,
            totalComments: widget.videoModel.totalComments,
            totalShares: widget.videoModel.totalShares,
          ),
          VideoInfoBar(
            userName: widget.videoModel.userName,
            descriptionTags: widget.videoModel.descriptionTags,
            artistSongName: widget.videoModel.artistSongName,
          ),
        ],
      ),
    );
  }
}
