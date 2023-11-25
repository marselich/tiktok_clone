import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/features/upload_video/cubit/upload_video_cubit.dart';
import 'package:tiktok_clone/generated/l10n.dart';
import 'package:tiktok_clone/ui/utils/dialog_utils.dart';
import 'package:tiktok_clone/ui/utils/show_tiktok_snackbar.dart';
import 'package:video_player/video_player.dart';

@RoutePage()
class UploadVideoFormScreen extends StatefulWidget {
  const UploadVideoFormScreen(
      {super.key, required this.cubit, required this.videoFile});

  final UploadVideoCubit cubit;
  final File videoFile;

  @override
  State<UploadVideoFormScreen> createState() => _UploadVideoFormScreenState();
}

class _UploadVideoFormScreenState extends State<UploadVideoFormScreen> {
  late FlickManager flickManager;
  late VideoPlayerController? playerController;
  final _formKey = GlobalKey<FormState>();

  String artistSongName = "";
  String descriptionTags = "";

  @override
  void initState() {
    playerController = VideoPlayerController.file(widget.videoFile);

    playerController?.initialize();
    playerController?.play();
    playerController?.setVolume(2);
    playerController?.setLooping(true);

    flickManager = FlickManager(videoPlayerController: playerController!);
    flickManager.flickDisplayManager
        ?.handleShowPlayerControls(showWithTimeout: false);
    super.initState();
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: BlocListener<UploadVideoCubit, UploadVideoState>(
          bloc: widget.cubit,
          listener: (context, state) {
            state.maybeWhen(
              loaded: () {
                AutoRouter.of(context).popUntilRoot();
                showTikTokSnackBar(context, text: S.of(context).videoUploaded);
              },
              loading: (isLoading) => isLoading
                  ? showLoaderDialog(context)
                  : AutoRouter.of(context).pop(),
              loadingFailure: (error) =>
                  showTikTokSnackBar(context, text: error.toString()),
              orElse: () {},
            );
          },
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              //alignment: Alignment.bottomCenter,
              children: [
                FlickVideoPlayer(flickManager: flickManager),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            onChanged: (value) => artistSongName = value,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            decoration: InputDecoration(
                              labelText: S.of(context).artistSong,
                              icon: const FaIcon(FontAwesomeIcons.music),
                              iconColor: theme.primaryColor,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return S.of(context).pleaseEnterSongName;
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            onChanged: (value) => descriptionTags = value,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            decoration: InputDecoration(
                              labelText: S.of(context).descrptionTags,
                              icon: const FaIcon(FontAwesomeIcons.tags),
                              iconColor: theme.primaryColor,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return S.of(context).pleaseEnterDescription;
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 24),
                          FilledButton(
                            child: Text(S.of(context).uploadNow),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                widget.cubit.uploadVideoInformation(
                                  artistSongName: artistSongName,
                                  descriptionTags: descriptionTags,
                                  videoFilePath: widget.videoFile.path,
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  double getNewVideoPlayerWidth(
      double oldWidth, double oldHeight, double newHeight) {
    return oldWidth * newHeight / oldHeight;
  }
}
