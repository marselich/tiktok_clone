import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class UserCircleAvatar extends StatelessWidget {
  const UserCircleAvatar({
    super.key,
    required this.image,
    required this.size,
    required this.radius,
    this.backgroundColor,
  });

  final String image;
  final double size;
  final double radius;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: backgroundColor,
      child: ClipOval(
        child: image == ""
            ? Image.asset(
                "assets/image/default_avatar.jpg",
                width: size,
                height: size,
                fit: BoxFit.cover,
              )
            : CachedNetworkImage(
                imageUrl: image.toString(),
                width: size,
                height: size,
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
