import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';

class TikTokVideoControls extends StatelessWidget {
  const TikTokVideoControls({super.key, this.progressBarSettings});

  final FlickProgressBarSettings? progressBarSettings;

  Widget getPauseAndPlayWidget() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0),
        shape: BoxShape.rectangle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: FlickShowControlsAction(
            child: Center(
              child: FlickVideoBuffer(
                child: FlickPlayToggle(
                  pauseChild: getPauseAndPlayWidget(),
                  playChild: getPauseAndPlayWidget(),
                  replayChild: getPauseAndPlayWidget(),
                  size: 30,
                  padding: const EdgeInsets.only(bottom: 16),
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: FlickVideoProgressBar(
              flickProgressBarSettings: progressBarSettings,
            ),
          ),
        ),
      ],
    );
  }
}
