import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tiktok_clone/models/video/video_model.dart';
import 'package:tiktok_clone/repository/home/i_home_repository.dart';

part 'video_player_state.dart';
part 'video_player_cubit.freezed.dart';

class VideoPlayerCubit extends Cubit<VideoPlayerState> {
  VideoPlayerCubit(this._repository) : super(const VideoPlayerState.initial());

  final IHomeRepository _repository;

  Future<void> getVideoList() async {
    try {
      emit(const VideoPlayerState.loaded(videoModelList: []));
      emit(const VideoPlayerState.loading(isLoading: true));

      final videoList = await _repository.getVideoListFromFirestore();

      emit(VideoPlayerState.loaded(videoModelList: videoList));
    } on Exception catch (e) {
      emit(VideoPlayerState.loadingFailure(e.toString()));
    }
  }
}
