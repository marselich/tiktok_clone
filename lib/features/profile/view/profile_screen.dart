import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
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
      backgroundColor: Colors.white,
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

          // SliverToBoxAdapter(
          //   child: Scaffold(
          //     body: Text("hello"),
          //   ),
          // ),

          // SliverToBoxAdapter(
          //   child: Scaffold(
          //     body: TabBarView(
          //       controller: tabController,
          //       children: [
          //         CustomScrollView(
          //           slivers: [
          //             SliverAppBar(
          //               bottom: TabBar(
          //                 tabs: const [
          //                   Tab(icon: FaIcon(FontAwesomeIcons.heart)),
          //                   Tab(icon: FaIcon(FontAwesomeIcons.heart)),
          //                 ],
          //                 controller: tabController,
          //               ),
          //             ),
          //           ],
          //         ),
          //         CustomScrollView(
          //           slivers: [
          //             SliverAppBar(
          //               bottom: TabBar(
          //                 tabs: const [
          //                   Tab(icon: FaIcon(FontAwesomeIcons.heart)),
          //                   Tab(icon: FaIcon(FontAwesomeIcons.heart)),
          //                 ],
          //                 controller: tabController,
          //               ),
          //             ),
          //           ],
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // SliverAppBar(
          //   bottom: TabBar(
          //     tabs: const [
          //       Tab(icon: FaIcon(FontAwesomeIcons.heart)),
          //       Tab(icon: FaIcon(FontAwesomeIcons.heart)),
          //     ],
          //     controller: tabController,
          //   ),
          // ),
          // TabBarView(
          //   controller: tabController,
          //   children: const <Widget>[
          //     Text("Tab 1"),
          //     Text("Tab 2"),
          //   ],
          // ),
        ],
      ),
    );
  }
}

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({
    super.key,
  });

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
                imageUrl:
                    "https://avatars.steamstatic.com/dfeea805bf37a5d89404d6dbe528cd7f9cdb4ebb_full.jpg",
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
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StatisticColumn(
                topText: "14",
                bottomText: "Following",
              ),
              SizedBox(width: 25),
              StatisticColumn(
                topText: "38",
                bottomText: "Followers",
              ),
              SizedBox(width: 25),
              StatisticColumn(
                topText: "91",
                bottomText: "Likes",
              ),
              SizedBox(width: 25),
            ],
          ),
          const SizedBox(height: 15),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.black12,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              side: const BorderSide(width: 2, color: Colors.black12),
            ),
            child: Text(
              "Edit profile",
              style: theme.textTheme.bodyLarge?.copyWith(color: Colors.black),
            ),
          ),
          const SizedBox(height: 20),
          const Text("Bio"),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class StatisticColumn extends StatelessWidget {
  const StatisticColumn({
    super.key,
    required this.topText,
    required this.bottomText,
  });

  final String topText;
  final String bottomText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Text(
          topText,
          style: theme.textTheme.bodyLarge?.copyWith(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          bottomText,
          style: theme.textTheme.bodyLarge?.copyWith(
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
