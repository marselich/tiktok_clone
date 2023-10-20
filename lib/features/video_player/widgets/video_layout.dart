import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'tiktok_action_button.dart';

class VideoLayout extends StatefulWidget {
  const VideoLayout({
    super.key,
    required this.userName,
    required this.userProfileImage,
    required this.totalComments,
    required this.totalShares,
    required this.totalLikes,
    required this.artistSongName,
    required this.descriptionTags,
    required this.videoUrl,
    required this.publishedDateTime,
  });

  final String userName;
  final String userProfileImage;
  final int totalComments;
  final int totalShares;
  final int totalLikes;
  final String artistSongName;
  final String descriptionTags;
  final String videoUrl;
  final int publishedDateTime;

  @override
  State<VideoLayout> createState() => _VideoLayoutState();
}

class _VideoLayoutState extends State<VideoLayout> {
  late VideoPlayerController _playerController;
  late FlickManager _flickManager;

  bool initialized = false;

  @override
  void initState() {
    super.initState();

    _playerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));

    _playerController.initialize();
    _playerController.play();
    _playerController.setVolume(2);
    _playerController.setLooping(true);
    initialized = true;

    _flickManager = FlickManager(videoPlayerController: _playerController);
    // _flickManager.flickDisplayManager
    //     ?.handleShowPlayerControls(showWithTimeout: true);
    // _flickManager.flickDisplayManager?.handleShowVolumeLevel();
    _flickManager.flickDisplayManager?.hidePlayerControls();
  }

  @override
  void dispose() {
    // if (initialized && _playerController != null) {
    // _playerController.removeListener(_videoListener);
    _playerController.dispose();
    // _playerController = null;
    super.dispose();
  }

  // Widget _renderLandscapeVideo() {
  //   if (!initialized) return Container();
  //   if (_playerController == null) return Container();
  //   return Center(
  //     child: AspectRatio(
  //       child: VisibilityDetector(
  //           child: VideoPlayer(_playerController!),
  //           onVisibilityChanged: _handleVisibilityDetector,
  //           key: Key('key_${widget.currentPageIndex}')),
  //       aspectRatio: _playerController?.value.aspectRatio ?? 0,
  //     ),
  //   );
  // }

  // Widget _renderPortraitVideo(BuildContext context) {
  //   var tmp = MediaQuery.of(context).size;
  //   if (!initialized) return Container();
  //   if (_playerController == null) return Container();

  //   var screenH = max(tmp.height, tmp.width);
  //   var screenW = min(tmp.height, tmp.width);
  //   tmp = _playerController!.value.size;

  //   var previewH = max(tmp.height, tmp.width);
  //   var previewW = min(tmp.height, tmp.width);
  //   var screenRatio = screenH / screenW;
  //   var previewRatio = previewH / previewW;

  //   return Center(
  //     child: OverflowBox(
  //       child: VisibilityDetector(
  //           onVisibilityChanged: _handleVisibilityDetector,
  //           key: Key('key_${widget.currentPageIndex}'),
  //           child: VideoPlayer(_playerController!)),
  //       maxHeight: screenRatio > previewRatio
  //           ? screenH
  //           : screenW / previewW * previewH,
  //       maxWidth: screenRatio > previewRatio
  //           ? screenH / previewH * previewW
  //           : screenW,
  //     ),
  //   );
  // }

  // void _handleVisibilityDetector(VisibilityInfo info) {
  //   if (info.visibleFraction == 0) {
  //     /// The screen is disappeared
  //     if (initialized &&
  //         widget.pageIndex == widget.currentPageIndex &&
  //         !widget.isPaused) {
  //       if (_playerController != null) {
  //         _playerController?.pause().then((value) {});
  //       }
  //     }
  //   } else {
  //     /// The screen is appeared
  //     _playerController?.play().then((value) {});
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          FlickVideoPlayer(
            flickManager: _flickManager,
            flickVideoWithControls: FlickVideoWithControls(
              willVideoPlayerControllerChange: true,
              controls: FlickPortraitControls(
                progressBarSettings: FlickProgressBarSettings(),
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
                    child: ClipOval(
                      child: CachedNetworkImage(
                        imageUrl: widget.userProfileImage,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TiktokActionButton(
                    iconData: FontAwesomeIcons.solidHeart,
                    text: widget.totalLikes.toString(),
                    onTap: () {},
                  ),
                  const SizedBox(height: 20),
                  TiktokActionButton(
                    iconData: FontAwesomeIcons.commentDots,
                    text: widget.totalComments.toString(),
                    onTap: () {},
                  ),
                  const SizedBox(height: 20),
                  TiktokActionButton(
                    iconData: FontAwesomeIcons.share,
                    text: widget.totalShares.toString(),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "@${widget.userName}",
                    style: theme.textTheme.bodyLarge
                        ?.copyWith(color: Colors.white),
                  ),
                  Text(
                    widget.descriptionTags,
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
                          widget.descriptionTags,
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
