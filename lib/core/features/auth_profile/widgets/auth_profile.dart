import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:tiktok_clone/features/profile/cubit/profile_cubit.dart';
import 'package:tiktok_clone/models/user/user_model.dart';
import 'package:tiktok_clone/models/video/video_model.dart';
import 'package:tiktok_clone/repository/profile/i_profile_repository.dart';

import '../cubit/auth_profile_cubit.dart';
import 'profile_info.dart';
import 'profile_videos.dart';

class AuthProfile extends StatefulWidget {
  const AuthProfile({
    super.key,
    required this.isCurrentUser,
    this.userModel,
    this.videoModelList,
    required this.isFollowing,
  });

  final bool isCurrentUser;
  final UserModel? userModel;
  final List<VideoModel>? videoModelList;
  final bool isFollowing;

  @override
  State<AuthProfile> createState() => _AuthProfileState();
}

class _AuthProfileState extends State<AuthProfile> {
  late ScrollController _scrollController;
  late AuthProfileCubit _authCubit;

  @override
  void initState() {
    super.initState();
    _authCubit = AuthProfileCubit(GetIt.I.get<IProfileRepository>());
    _authCubit.init(
        widget.userModel!, widget.isFollowing, widget.videoModelList!);
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    ProfileCubit cubit = BlocProvider.of<ProfileCubit>(context);
    final theme = Theme.of(context);
    return BlocProvider(
      create: (context) => _authCubit,
      child: Scaffold(
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
              child: BlocBuilder<AuthProfileCubit, AuthProfileState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    loaded: (userModel, videoModelList, isFollowing) =>
                        ProfileInfo(
                      isCurrentUser: widget.isCurrentUser,
                      userModel: userModel,
                      isFollowing: isFollowing!,
                      isLoading: false,
                    ),
                    loading: () => ProfileInfo(
                      isCurrentUser: widget.isCurrentUser,
                      userModel: widget.userModel,
                      isFollowing: widget.isFollowing,
                      isLoading: true,
                    ),
                    orElse: () => Container(),
                  );
                },
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
      ),
    );
  }
}
