import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heroicons/heroicons.dart';
import 'package:pomodoro/resources/resources.dart';

class PlayButton extends StatefulWidget {
  const PlayButton({Key? key, required this.callback, required this.color, required this.indicatorColor})
      : super(key: key);
  final VoidCallback callback;
  final Color color;
  final Color indicatorColor;

  @override
  State<PlayButton> createState() => _SmallButtonState();
}

class _SmallButtonState extends State<PlayButton> {
  late Color _color;
  late Color _indicator;
  late final ValueNotifier<bool> _isPlay;

  @override
  void initState() {
    _color = widget.color;
    _indicator = widget.indicatorColor;
    _isPlay = ValueNotifier(false);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant PlayButton oldWidget) {
    if (oldWidget.color != widget.color || oldWidget.indicatorColor != widget.indicatorColor) {
      _color = widget.color;
      _indicator = widget.indicatorColor;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: _isPlay,
        builder: (_, value, __) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            width: 128,
            height: 96,
            decoration: BoxDecoration(
                color: _color,
                borderRadius: const BorderRadius.all(Radius.circular(24))),
            child: GestureDetector(
              onTap: () {
                _isPlay.value = !value;
                widget.callback();
              },
              child: AnimatedSwitcher(
                switchInCurve: Curves.easeIn,
                switchOutCurve: Curves.easeOut,
                duration: const Duration(milliseconds: 400),
                child: Center(child: Builder(
                  builder: (context) {
                    if (value) {
                      return SizedBox(
                          key: const ValueKey(1),
                          child: HeroIcon(
                            HeroIcons.pause,
                            size: 50,
                            style: HeroIconStyle
                                .solid, // Outlined icons are used by default.
                            color: _indicator,
                          ));
                    } else {
                      return SizedBox(
                        key: const ValueKey(2),
                        child: HeroIcon(
                          HeroIcons.play,
                          size: 50,
                          style: HeroIconStyle
                              .solid, // Outlined icons are used by default.
                          color: _indicator,
                        ),
                      );
                    }
                  },
                )),
              ),
            ),
          );
        });
  }
}
