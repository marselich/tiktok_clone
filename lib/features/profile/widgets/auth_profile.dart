import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/features/profile/widgets/profile_info.dart';

class AuthProfile extends StatefulWidget {
  const AuthProfile({
    super.key,
  });

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
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {}, icon: const FaIcon(FontAwesomeIcons.userPlus)),
        actions: [
          IconButton(
              onPressed: () {}, icon: const FaIcon(FontAwesomeIcons.ellipsis)),
        ],
        title: Center(
            child: Text(
          "Ivan Maslakov",
          style: theme.textTheme.titleMedium,
        )),
      ),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: ProfileInfo(),
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
