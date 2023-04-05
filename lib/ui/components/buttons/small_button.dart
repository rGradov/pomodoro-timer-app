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

class _SmallButtonState extends State<SmallButton> {
  late Color _color;

  @override
  void initState() {
    _color = widget.color;
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
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      width: 80,
      height: 80,
      decoration:  BoxDecoration(
        color: _color,
          borderRadius: const BorderRadius.all(Radius.circular(24))),
      child: GestureDetector(
        onTap: widget.callback,
        child: Center(child: widget.child),
      ),
    );
  }
}
