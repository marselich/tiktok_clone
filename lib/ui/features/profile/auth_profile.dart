import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/features/profile/cubit/profile_cubit.dart';
import 'package:tiktok_clone/models/user/user_model.dart';
import 'package:tiktok_clone/models/video/video_model.dart';

import 'profile_info.dart';
import 'profile_videos.dart';

class AuthProfile extends StatefulWidget {
  const AuthProfile({
    super.key,
    required this.isCurrentUser,
    this.userModel,
    this.videoModelList,
  });

  final bool isCurrentUser;
  final UserModel? userModel;
  final List<VideoModel>? videoModelList;

  @override
  State<AuthProfile> createState() => _AuthProfileState();
}

class _AuthProfileState extends State<AuthProfile> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    ProfileCubit cubit = BlocProvider.of(context);
    final theme = Theme.of(context);
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    cubit.signOut();
                  },
                  icon: const FaIcon(FontAwesomeIcons.ellipsis)),
            ],
            title: Center(
                child: Text(
              widget.userModel!.name,
              style: theme.textTheme.titleMedium,
            )),
          ),
          SliverToBoxAdapter(
            child: ProfileInfo(
              isCurrentUser: widget.isCurrentUser,
              userModel: widget.userModel,
            ),
          ),
          // SliverToBoxAdapter(
          //   child: ProfileVideos(videoModelList: widget.videoModelList),
          // ),
          ProfileVideos(
            scrollController: _scrollController,
            videoModelList: widget.videoModelList,
          ),
        ],
      ),
    );
  }
}
