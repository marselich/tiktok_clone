import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

class _AuthProfileState extends State<AuthProfile>
    with TickerProviderStateMixin {
  late TabController tabController;
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    ProfileCubit cubit = BlocProvider.of(context);
    final theme = Theme.of(context);
    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
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
          SliverAppBar(
            snap: true,
            pinned: true,
            floating: true,
            bottom: TabBar(
              tabs: const [
                Tab(icon: FaIcon(FontAwesomeIcons.heart)),
                Tab(icon: FaIcon(FontAwesomeIcons.heart)),
              ],
              controller: tabController,
            ),
          ),
          SliverFillRemaining(
            child: TabBarView(
              controller: tabController,
              children: [
                Container(
                  child: GridView.builder(
                    controller: scrollController,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 0,
                    ),
                    itemCount: widget.videoModelList?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {},
                        child: CachedNetworkImage(
                          imageUrl: widget.videoModelList![index].thumbnailUrl,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  child: const Text("s"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
