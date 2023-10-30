import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:tiktok_clone/features/profile/cubit/profile_cubit.dart';
import 'package:tiktok_clone/features/profile/widgets/profile_info.dart';
import 'package:tiktok_clone/models/user/user_model.dart';
import 'package:tiktok_clone/repository/auth/i_auth_repository.dart';

class AuthProfile extends StatefulWidget {
  const AuthProfile({
    super.key,
    this.userModel,
  });

  final UserModel? userModel;

  @override
  State<AuthProfile> createState() => _AuthProfileState();
}

class _AuthProfileState extends State<AuthProfile>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ProfileCubit cubit = BlocProvider.of(context);
    final theme = Theme.of(context);
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //       onPressed: () {}, icon: const FaIcon(FontAwesomeIcons.userPlus)),
      //   actions: [
      //     IconButton(
      //         onPressed: () {
      //           cubit.signOut();
      //         },
      //         icon: const FaIcon(FontAwesomeIcons.ellipsis)),
      //   ],
      //   title: Center(
      //       child: Text(
      //     widget.userModel!.name,
      //     style: theme.textTheme.titleMedium,
      //   )),
      // ),
      body: CustomScrollView(
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
                  child: GridView.count(
                    crossAxisCount: 4,
                    children: widget.userModel!.videosIdList.map((e) {
                      return CachedNetworkImage(imageUrl: e);
                    }).toList(),
                  ),
                ),
                Container(
                  child: const Text("s"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
