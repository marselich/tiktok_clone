import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tiktok_clone/models/video/video_model.dart';

part 'video_player_state.dart';
part 'video_player_cubit.freezed.dart';

class VideoPlayerCubit extends Cubit<VideoPlayerState> {
  VideoPlayerCubit() : super(const VideoPlayerState.initial());

  void pageViewScrollListener(PageController pageController) {
    final pageScrolledState = state as _PageScrolled;
    if (pageScrolledState.isOnPageTurning &&
        pageController.page == pageController.page!.roundToDouble()) {
      emit(VideoPlayerState.pageScrolled(
        currentPage: pageController.page!.toInt(),
        isOnPageTurning: false,
      ));
    } else if (!pageScrolledState.isOnPageTurning &&
        pageScrolledState.currentPage.toDouble() != pageController.page) {
      if ((pageScrolledState.currentPage.toDouble() - pageController.page!)
              .abs() >
          0.7) {
        emit(const VideoPlayerState.pageScrolled(
          isOnPageTurning: true,
        ));
      }
    }
  }
}
