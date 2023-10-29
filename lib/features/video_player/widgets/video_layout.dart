import 'package:cached_network_image/cached_network_image.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/features/video_player/cubit/video_player_cubit.dart';
import 'package:tiktok_clone/features/video_player/widgets/tiktok_video_controls.dart';
import 'package:tiktok_clone/models/video/video_model.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'tiktok_action_button.dart';

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
    final theme = Theme.of(context);
    return SizedBox(
      height: MediaQuery.of(context).size.height,
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
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 5, bottom: 60),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 27,
                    backgroundColor: Colors.white,
                    child: ClipOval(
                      child: CachedNetworkImage(
                        imageUrl: widget.videoModel.userProfileImage,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TiktokActionButton(
                    iconData: FontAwesomeIcons.solidHeart,
                    text: widget.videoModel.totalLikes.toString(),
                    onTap: () {},
                  ),
                  const SizedBox(height: 20),
                  TiktokActionButton(
                    iconData: FontAwesomeIcons.commentDots,
                    text: widget.videoModel.totalComments.toString(),
                    onTap: () {},
                  ),
                  const SizedBox(height: 20),
                  TiktokActionButton(
                    iconData: FontAwesomeIcons.share,
                    text: widget.videoModel.totalShares.toString(),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 12, bottom: 30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "@${widget.videoModel.userName}",
                    style: theme.textTheme.bodyLarge
                        ?.copyWith(color: Colors.white),
                  ),
                  Text(
                    widget.videoModel.descriptionTags,
                    style: theme.textTheme.bodyLarge
                        ?.copyWith(color: Colors.white),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 1),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.music,
                          size: 16,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          widget.videoModel.artistSongName,
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
