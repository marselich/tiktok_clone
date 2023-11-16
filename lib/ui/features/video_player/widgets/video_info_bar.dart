import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class VideoInfoBar extends StatelessWidget {
  const VideoInfoBar({
    super.key,
    required this.userName,
    required this.descriptionTags,
    required this.artistSongName,
  });

  final String userName;
  final String descriptionTags;
  final String artistSongName;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 12, bottom: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "@$userName",
              style: theme.textTheme.bodyLarge?.copyWith(
                color: Colors.white,
                shadows: [
                  const Shadow(
                    color: Colors.black,
                    blurRadius: 0.8,
                  )
                ],
              ),
            ),
            Text(
              descriptionTags,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: Colors.white,
                shadows: [
                  const Shadow(
                    color: Colors.black,
                    blurRadius: 0.8,
                  )
                ],
              ),
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
                    artistSongName,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      shadows: [
                        const Shadow(
                          color: Colors.black,
                          blurRadius: 0.8,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
