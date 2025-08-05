import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/Component/School/school_page_video_player.dart';

@immutable
class ProjectImageSlider extends StatefulWidget {
  const ProjectImageSlider({super.key});

  @override
  State<ProjectImageSlider> createState() => _ProjectImageSliderState();
}

class _ProjectImageSliderState extends State<ProjectImageSlider> {
  final CarouselSliderController _controller = CarouselSliderController();
  int _current = 0;

  @override
  Widget build(final BuildContext context) => Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Container(
            color: Colors.cyan,
            width: 800,
            child: CarouselSlider(
              carouselController: _controller,
              options: CarouselOptions(
                height: 400,
                onPageChanged:
                    (final int index, final CarouselPageChangedReason reason) =>
                        setState(() {
                  _current = index;
                }),
              ),
              items: <Widget>[
                Image.asset(
                  'lib/Assets/Cube_media/cube_main_image.png',
                ),
                const SchoolPageVideoPlayer(
                  url: 'lib/Assets/Cube_media/cube_1axis_standing.mp4',
                ),
                const SchoolPageVideoPlayer(
                  url: 'lib/Assets/Cube_media/cube_3axis_standing.mp4',
                ),
                const SchoolPageVideoPlayer(
                  url: 'lib/Assets/Cube_media/cube_sensor_testing.mp4',
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _NavigationDot(
                onTap: () => _controller.animateToPage(0),
                isSelected: _current == 0,
              ),
              _NavigationDot(
                onTap: () => _controller.animateToPage(1),
                isSelected: _current == 1,
              ),
              _NavigationDot(
                onTap: () => _controller.animateToPage(2),
                isSelected: _current == 2,
              ),
              _NavigationDot(
                onTap: () => _controller.animateToPage(3),
                isSelected: _current == 3,
              ),
            ],
          ),
        ],
      );

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<CarouselSliderController>('controller', _controller),
    );
  }
}

@immutable
class _NavigationDot extends StatelessWidget {
  const _NavigationDot({
    required this.onTap,
    required this.isSelected,
  });

  final void Function() onTap;
  final bool isSelected;

  @override
  Widget build(final BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.all(32),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelected
                ? colorScheme.primaryContainer
                : colorScheme.inversePrimary,
          ),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(ObjectFlagProperty<void Function()>.has('onTap', onTap))
      ..add(DiagnosticsProperty<bool>('isSelected', isSelected));
  }
}
