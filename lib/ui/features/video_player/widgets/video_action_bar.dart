import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/router/app_router.dart';

import 'tiktok_action_button.dart';

class VideoActionBar extends StatelessWidget {
  const VideoActionBar({
    super.key,
    required this.userProfileImage,
    required this.totalLikes,
    required this.totalComments,
    required this.totalShares,
    required this.userId,
    required this.onLikeTap,
    required this.isLikeTapped,
  });

  final String userId;
  final String userProfileImage;
  final int totalLikes;
  final int totalComments;
  final int totalShares;
  final VoidCallback onLikeTap;
  final bool isLikeTapped;

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
            InkWell(
              onTap: () {
                AutoRouter.of(context).push(ProfileRoute(userId: userId));
              },
              child: CircleAvatar(
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
            ),
            const SizedBox(height: 20),
            TiktokActionButton(
              iconData: FontAwesomeIcons.solidHeart,
              text: totalLikes.toString(),
              onTap: onLikeTap,
              isTapped: isLikeTapped,
            ),
            const SizedBox(height: 20),
            TiktokActionButton(
              iconData: FontAwesomeIcons.commentDots,
              text: totalComments.toString(),
              onTap: () {},
              isTapped: false,
            ),
            const SizedBox(height: 20),
            TiktokActionButton(
              iconData: FontAwesomeIcons.share,
              text: totalShares.toString(),
              onTap: () {},
              isTapped: false,
            ),
          ],
        ),
      ),
    );
  }
}
