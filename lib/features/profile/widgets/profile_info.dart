import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/features/profile/widgets/statistic_column.dart';
import 'package:tiktok_clone/generated/l10n.dart';
import 'package:tiktok_clone/models/user/user_model.dart';
import 'package:tiktok_clone/ui/ui.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({
    super.key,
    this.userModel,
  });

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
              child: CachedNetworkImage(
                imageUrl: userModel!.image.toString(),
                width: 100,
                height: 100,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "@vanomas777",
            style: theme.textTheme.bodyLarge?.copyWith(color: Colors.black),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StatisticColumn(
                topText: "14",
                bottomText: S.of(context).following,
              ),
              const SizedBox(width: 25),
              StatisticColumn(
                topText: "38",
                bottomText: S.of(context).followers,
              ),
              const SizedBox(width: 25),
              StatisticColumn(
                topText: "91",
                bottomText: S.of(context).likes,
              ),
              const SizedBox(width: 25),
            ],
          ),
          const SizedBox(height: 15),
          TikTokOutlinedButton(
            onPressed: () {},
            text: 'Edit profile',
          ),
          const SizedBox(height: 20),
          const Text("Bio"),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
