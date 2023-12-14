import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../widgets/user_circle_avatar.dart';

class CommentTile extends StatelessWidget {
  const CommentTile({
    super.key,
    required this.avatarUrl,
    required this.userName,
    required this.message,
    required this.totalLikes,
    required this.time,
  });

  final String avatarUrl;
  final String userName;
  final String message;
  final int totalLikes;
  final String time;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: UserCircleAvatar(
        image: avatarUrl,
        size: 50,
        radius: 25,
      ),
      title: Text(
        userName,
        style: theme.textTheme.titleSmall,
      ),
      subtitle: RichText(
        text: TextSpan(
          style: theme.textTheme.titleMedium,
          children: [
            TextSpan(text: message),
            const WidgetSpan(
              alignment: PlaceholderAlignment.baseline,
              baseline: TextBaseline.alphabetic,
              child: SizedBox(width: 10),
            ),
            TextSpan(
              text: time,
              style: theme.textTheme.titleSmall,
            ),
          ],
        ),
      ),
      // subtitle: Text(
      //   "$message $time",
      //   style: theme.textTheme.titleMedium,
      // ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const FaIcon(
            FontAwesomeIcons.heart,
            size: 16,
            color: Colors.black26,
          ),
          Text(
            totalLikes.toString(),
            style: theme.textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}
