import 'package:flutter/cupertino.dart';

class SmallButton extends StatefulWidget {
  const SmallButton(
      {Key? key,
      required this.callback,
      required this.child,
      required this.color})
      : super(key: key);
  final Widget child;
  final VoidCallback callback;
  final Color color;

  @override
  State<SmallButton> createState() => _SmallButtonState();
}

class _SmallButtonState extends State<SmallButton>
    with SingleTickerProviderStateMixin {
  late Color _color;
  late final AnimationController _controller;
  double _scale = 0;
  @override
  void initState() {
    _color = widget.color;
    _controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 300),
        lowerBound: .0,
        upperBound: .15)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void didUpdateWidget(covariant SmallButton oldWidget) {
    if (oldWidget.color != widget.color) {
      _color = widget.color;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void tapDown(TapDownDetails _) {
    _controller.forward();
  }

  void tapUp(TapUpDetails _) {
    _controller.reverse();
    widget.callback();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    return Transform.scale(
      scale: _scale,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        width: 80,
        height: 80,
        decoration: BoxDecoration(
            color: _color,
            borderRadius: const BorderRadius.all(Radius.circular(24))),
        child: GestureDetector(
          onTapDown: tapDown,
          onTapUp: tapUp,
          child: Center(child: widget.child),
        ),
      ),
    );
  }
}
