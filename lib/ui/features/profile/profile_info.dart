import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/generated/l10n.dart';
import 'package:tiktok_clone/models/user/user_model.dart';
import 'package:tiktok_clone/ui/ui.dart';

import 'statistic_column.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({
    super.key,
    this.userModel,
    required this.isCurrentUser,
  });

  final bool isCurrentUser;
  final UserModel? userModel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            child: ClipOval(
              child: userModel!.image == ""
                  ? Image.asset(
                      "assets/image/default_avatar.jpg",
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    )
                  : CachedNetworkImage(
                      imageUrl: userModel!.image.toString(),
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "@${userModel!.userName.toString()}",
            style: theme.textTheme.bodyLarge?.copyWith(color: Colors.black),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StatisticColumn(
                topText: userModel!.totalFollowing.toString(),
                bottomText: S.of(context).following,
              ),
              const SizedBox(width: 25),
              StatisticColumn(
                topText: userModel!.totalFollowers.toString(),
                bottomText: S.of(context).followers,
              ),
              const SizedBox(width: 25),
              StatisticColumn(
                topText: userModel!.totalLikes.toString(),
                bottomText: S.of(context).likes,
              ),
              const SizedBox(width: 25),
            ],
          ),
          const SizedBox(height: 15),
          isCurrentUser
              ? TikTokOutlinedButton(
                  onPressed: () {},
                  text: S.of(context).editProfile,
                )
              : SizedBox(
                  width: 200,
                  child: FilledButton(
                    onPressed: () {},
                    child: Text(S.of(context).follow),
                  ),
                ),
          const SizedBox(height: 20),
          userModel!.bio != "" || !isCurrentUser
              ? Text(userModel!.bio)
              : TextButton(
                  onPressed: () {},
                  child: Text(
                    S.of(context).tapToAddBio,
                    style: theme.textTheme.bodyMedium!.copyWith(
                      color: Colors.black.withOpacity(0.4),
                    ),
                  ),
                ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
