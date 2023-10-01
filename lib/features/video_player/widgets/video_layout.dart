import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:video_player/video_player.dart';

import 'tiktok_action_button.dart';

class VideoLayout extends StatefulWidget {
  const VideoLayout({
    super.key,
  });

  @override
  State<VideoLayout> createState() => _VideoLayoutState();
}

class _VideoLayoutState extends State<VideoLayout> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.loose,
      children: [
        AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
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
                      imageUrl:
                          "https://avatars.steamstatic.com/dfeea805bf37a5d89404d6dbe528cd7f9cdb4ebb_full.jpg",
                      width: 50,
                      height: 50,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TiktokActionButton(
                  iconData: FontAwesomeIcons.solidHeart,
                  text: "123.3K",
                  onTap: () {},
                ),
                const SizedBox(height: 20),
                TiktokActionButton(
                  iconData: FontAwesomeIcons.commentDots,
                  text: "578",
                  onTap: () {},
                ),
                const SizedBox(height: 20),
                TiktokActionButton(
                  iconData: FontAwesomeIcons.share,
                  text: "Share",
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
                  "@название_канала",
                  style:
                      theme.textTheme.bodyLarge?.copyWith(color: Colors.white),
                ),
                Text(
                  "описание и #теги",
                  style:
                      theme.textTheme.bodyLarge?.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
