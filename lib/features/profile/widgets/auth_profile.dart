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
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {}, icon: const FaIcon(FontAwesomeIcons.userPlus)),
        actions: [
          IconButton(
              onPressed: () {
                cubit.signOut();
              },
              icon: const FaIcon(FontAwesomeIcons.ellipsis)),
        ],
        title: Center(
            child: Text(
          widget.userModel!.nickname,
          style: theme.textTheme.titleMedium,
        )),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: ProfileInfo(userModel: widget.userModel),
          ),
          SliverAppBar(
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
                  child: const Text("s"),
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
