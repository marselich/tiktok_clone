import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sliver_fill_remaining_box_adapter/sliver_fill_remaining_box_adapter.dart';
import 'package:tiktok_clone/features/profile/cubit/profile_cubit.dart';
import 'package:tiktok_clone/features/profile/widgets/profile_info.dart';
import 'package:tiktok_clone/features/profile/widgets/profile_videos.dart';
import 'package:tiktok_clone/models/user/user_model.dart';
import 'package:tiktok_clone/models/video/video_model.dart';
import 'package:tiktok_clone/repository/auth/i_auth_repository.dart';

class AuthProfile extends StatefulWidget {
  const AuthProfile({
    super.key,
    this.userModel,
    this.videoModelList,
  });

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
            leading: IconButton(
              onPressed: () {},
              icon: const FaIcon(FontAwesomeIcons.userPlus),
            ),
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
            child: ProfileInfo(userModel: widget.userModel),
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
