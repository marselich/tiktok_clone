import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tiktok_clone/features/profile/widgets/widgets.dart';
import 'package:tiktok_clone/features/upload_video/cubit/upload_video_cubit.dart';
import 'package:tiktok_clone/features/upload_video/widgets/upload_video_container.dart';
import 'package:tiktok_clone/repository/upload_video/i_upload_video_repository.dart';
import 'package:tiktok_clone/router/app_router.dart';
import 'package:tiktok_clone/ui/utils/firebase_utils.dart';
import 'package:tiktok_clone/features/profile/widgets/not_auth_profile.dart';

@RoutePage()
class UploadVideoScreen extends StatefulWidget {
  const UploadVideoScreen({super.key});

  @override
  State<UploadVideoScreen> createState() => _UploadVideoScreenState();
}

class _UploadVideoScreenState extends State<UploadVideoScreen> {
  final _cubit = UploadVideoCubit(GetIt.I.get<IUploadVideoRepository>());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit,
      child: BlocListener<UploadVideoCubit, UploadVideoState>(
        listener: (context2, state) {
          state.maybeWhen(
            videoUploaded: (video) async {
              if (video != null) {
                AutoRouter.of(context).push(
                    UploadVideoFormRoute(cubit: _cubit, videoFile: video));
              }
            },
            orElse: () {},
          );
        },
        child: const UploadVideoContainer(),
      ),
    );
  }
}
