import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TikTokVideoControls extends StatelessWidget {
  const TikTokVideoControls({super.key, this.progressBarSettings});

  final FlickProgressBarSettings? progressBarSettings;

  Widget getPauseWidget() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0),
        shape: BoxShape.rectangle,
      ),
    );
  }

  Widget getPlayWidget() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0),
        shape: BoxShape.rectangle,
      ),
      child: const Center(
        child: FaIcon(FontAwesomeIcons.play, size: 50),
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
                  pauseChild: getPauseWidget(),
                  playChild: getPlayWidget(),
                  replayChild: getPauseWidget(),
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
