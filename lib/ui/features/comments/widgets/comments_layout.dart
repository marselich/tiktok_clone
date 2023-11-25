import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:tiktok_clone/generated/l10n.dart';
import 'package:tiktok_clone/models/video/video_model.dart';
import 'package:tiktok_clone/repository/home/i_home_repository.dart';
import 'package:tiktok_clone/repository/video_player/i_video_player_repository.dart';
import 'package:tiktok_clone/ui/features/comments/cubit/comments_cubit.dart';
import 'package:tiktok_clone/ui/features/comments/widgets/comment_tile.dart';
import 'package:tiktok_clone/ui/features/video_player/cubit/video_player_cubit.dart';
import 'package:tiktok_clone/ui/utils/date_time_utils.dart';
import 'package:tiktok_clone/ui/widgets/loading_container.dart';
import 'package:tiktok_clone/ui/widgets/no_content_container.dart';

class CommentsLayout extends StatefulWidget {
  const CommentsLayout(
      {super.key, required this.videoModel, required this.onSendComment});

  final VideoModel videoModel;
  final VoidCallback onSendComment;

  @override
  State<CommentsLayout> createState() => _CommentsLayoutState();
}

class _CommentsLayoutState extends State<CommentsLayout> {
  final _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();
  final CommentsCubit _cubit = CommentsCubit(
    GetIt.I.get<IVideoPlayerRepository>(),
    GetIt.I.get<IHomeRepository>(),
  );

  @override
  void initState() {
    _cubit.loadCommentList(widget.videoModel.videoId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final videoPlayerCubit = BlocProvider.of<VideoPlayerCubit>(context);

    final theme = Theme.of(context);
    return Column(
      children: [
        BlocBuilder<CommentsCubit, CommentsState>(
          bloc: _cubit,
          builder: (context, state) {
            return state.maybeWhen(
              loaded: (commentList) {
                return Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Center(
                          child: Text(
                            S.of(context).comments(commentList.length),
                            style: theme.textTheme.bodyLarge,
                          ),
                        ),
                      ),
                      Expanded(
                        child: commentList.isNotEmpty
                            ? ListView.builder(
                                itemBuilder: (context, i) {
                                  return CommentTile(
                                    avatarUrl: commentList[i].imageUrl,
                                    userName: commentList[i].name,
                                    message: commentList[i].message,
                                    totalLikes: commentList[i].totalLikes,
                                    time: DateTimeUtils.getShortDateTime(
                                      commentList[i].publishedDateTime,
                                    ),
                                  );
                                },
                                itemCount: commentList.length,
                              )
                            : NoContentContainer(
                                noContentText: S.of(context).noCommentsYet,
                                iconColor: Colors.black12,
                              ),
                      ),
                    ],
                  ),
                );
              },
              loading: () => const Expanded(
                child: LoadingContainer(
                  color: Colors.transparent,
                ),
              ),
              orElse: () => Container(),
            );
          },
        ),
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: S.of(context).addComment,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return S.of(context).valueCantBeEmpty;
                      }
                      return null;
                    },
                    controller: _textController,
                  ),
                  trailing: IconButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        // widget.onSendComment();
                        await videoPlayerCubit.changeCommentsCountInVideo(
                            widget.videoModel, true);
                        await _cubit.addComment(
                          widget.videoModel,
                          _textController.text,
                        );
                        _textController.text = "";
                      }
                    },
                    icon: const FaIcon(
                      FontAwesomeIcons.paperPlane,
                      size: 22,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).viewInsets.bottom,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
