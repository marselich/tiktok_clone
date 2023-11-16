import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tiktok_clone/models/video/video_model.dart';
import 'package:tiktok_clone/repository/home/i_home_repository.dart';

part 'video_list_state.dart';
part 'video_list_cubit.freezed.dart';

class VideoListCubit extends Cubit<VideoListState> {
  VideoListCubit(this._repository) : super(const VideoListState.initial());

  final IHomeRepository _repository;

  Future<void> getVideoList() async {
    try {
      emit(const VideoListState.loaded(videoModelList: []));
      emit(const VideoListState.loading(isLoading: true));

      final videoList = await _repository.getVideoListFromFirestore();

      emit(VideoListState.loaded(videoModelList: videoList));
    } on Exception catch (e) {
      emit(VideoListState.loadingFailure(e.toString()));
    }
  }
}
