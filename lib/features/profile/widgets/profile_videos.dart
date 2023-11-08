import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/models/video/video_model.dart';

class ProfileVideos extends StatefulWidget {
  const ProfileVideos({super.key, this.videoModelList});

  final List<VideoModel>? videoModelList;

  @override
  State<ProfileVideos> createState() => _ProfileVideosState();
}

class _ProfileVideosState extends State<ProfileVideos>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
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
          ];
        },
        body: TabBarView(
          controller: tabController,
          children: [
            Container(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                ),
                itemCount: widget.videoModelList?.length,
                itemBuilder: (BuildContext context, int index) {
                  return CachedNetworkImage(
                    imageUrl: widget.videoModelList![index].thumbnailUrl,
                    fit: BoxFit.cover,
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
    );
  }
}
