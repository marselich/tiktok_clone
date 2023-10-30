import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'tiktok_action_button.dart';

class VideoActionBar extends StatelessWidget {
  const VideoActionBar({
    super.key,
    required this.userProfileImage,
    required this.totalLikes,
    required this.totalComments,
    required this.totalShares,
  });

  final String userProfileImage;
  final int totalLikes;
  final int totalComments;
  final int totalShares;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 5, bottom: 85),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 27,
              backgroundColor: Colors.white,
              child: ClipOval(
                child: userProfileImage == ""
                    ? Image.asset(
                        "assets/image/default_avatar.jpg",
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      )
                    : CachedNetworkImage(
                        imageUrl: userProfileImage,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            const SizedBox(height: 20),
            TiktokActionButton(
              iconData: FontAwesomeIcons.solidHeart,
              text: totalLikes.toString(),
              onTap: () {},
            ),
            const SizedBox(height: 20),
            TiktokActionButton(
              iconData: FontAwesomeIcons.commentDots,
              text: totalComments.toString(),
              onTap: () {},
            ),
            const SizedBox(height: 20),
            TiktokActionButton(
              iconData: FontAwesomeIcons.share,
              text: totalShares.toString(),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
