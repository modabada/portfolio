import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

@immutable
class SchoolPageVideoPlayer extends StatefulWidget {
  const SchoolPageVideoPlayer({
    required this.url,
    super.key,
  });

  final String url;

  @override
  State<SchoolPageVideoPlayer> createState() => _SchoolPageVideoPlayerState();

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('url', url));
  }
}

class _SchoolPageVideoPlayerState extends State<SchoolPageVideoPlayer>
    with SingleTickerProviderStateMixin {
  late final VideoPlayerController _videoController;
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.asset(widget.url);
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
      value: 1,
    );
    unawaited(
      _videoController.initialize().then((final _) {
        setState(() {});
      }),
    );
  }

  @override
  void dispose() {
    unawaited(_videoController.dispose());
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return MouseRegion(
      child: GestureDetector(
        onTap: () => setState(() {
          if (_videoController.value.isPlaying) {
            unawaited(_videoController.pause());
            _animationController.value = 1;
          } else {
            unawaited(_videoController.play());
            _animationController.reverse(from: 1);
          }
        }),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            VideoPlayer(_videoController),
            AnimatedBuilder(
              animation: _animationController,
              builder: (final BuildContext context, final Widget? child) =>
                  Icon(
                _videoController.value.isPlaying
                    ? Icons.pause_circle_filled_rounded
                    : Icons.play_circle_fill_rounded,
                size: 48,
                color: colorScheme.primary.withAlpha(
                  (_animationController.value * 255).round(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
