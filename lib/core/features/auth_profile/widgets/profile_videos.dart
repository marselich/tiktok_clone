import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/models/video/video_model.dart';
import 'package:tiktok_clone/router/app_router.dart';

class ProfileVideos extends StatefulWidget {
  const ProfileVideos(
      {super.key, this.videoModelList, required this.scrollController});

  final ScrollController scrollController;
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
    return SliverMainAxisGroup(
      slivers: [
        SliverAppBar(
          snap: false,
          pinned: true,
          floating: false,
          primary: false,
          forceElevated: true,
          centerTitle: false,
          toolbarHeight: 0,
          titleSpacing: 0,
          automaticallyImplyLeading: false,
          bottom: TabBar(
            tabs: const [
              Tab(icon: FaIcon(FontAwesomeIcons.video)),
              Tab(icon: FaIcon(FontAwesomeIcons.solidHeart)),
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
                  controller: widget.scrollController,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0,
                    childAspectRatio: 1 / 2,
                  ),
                  itemCount: widget.videoModelList?.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        AutoRouter.of(context).push(
                          ProfileVideoPlayerRoute(
                            videoModelList: widget.videoModelList!,
                            currentVideoIndex: index,
                          ),
                        );
                      },
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
    );
  }
}
