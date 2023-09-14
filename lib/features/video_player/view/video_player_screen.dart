import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

@RoutePage()
class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
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
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
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
      body: Container(
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.loose,
          children: [
            AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            ),
            Align(
              alignment: Alignment.bottomRight,
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
                    iconData: Icons.favorite,
                    text: "123.3K",
                    onTap: () {},
                  ),
                  const SizedBox(height: 20),
                  const TiktokActionButton(
                    iconData: Icons.share,
                    text: "Share",
                  ),
                  const SizedBox(height: 20),
                  const TiktokActionButton(
                    iconData: Icons.comment,
                    text: "578",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

class TiktokActionButton extends StatelessWidget {
  const TiktokActionButton({
    super.key,
    required this.iconData,
    required this.text,
    this.onTap,
  });

  final IconData iconData;
  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Icon(iconData, size: 50),
          Text(text, style: theme.textTheme.labelLarge),
        ],
      ),
    );
  }
}
