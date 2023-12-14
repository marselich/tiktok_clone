part of 'comments_cubit.dart';

@freezed
class CommentsState with _$CommentsState {
  const factory CommentsState.initial() = _Initial;
  const factory CommentsState.loaded({
    required List<CommentModel> commentList,
  }) = _Loaded;
  const factory CommentsState.loading() = _Loading;
  const factory CommentsState.loadingFailure(
    String? error,
  ) = _LoadingFailure;
}
