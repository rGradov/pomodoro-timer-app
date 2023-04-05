import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToggleButton extends StatefulWidget {
  const ToggleButton({Key? key, required this.text, this.value = false})
      : super(key: key);
  final String text;
  final bool value;

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  late final ValueNotifier<bool> _isSwitched;
  @override
  void initState() {
    _isSwitched = ValueNotifier(widget.value);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ToggleButton oldWidget) {
    if (oldWidget.value != widget.value) {
      _isSwitched.value = widget.value;
    }
    super.didUpdateWidget(oldWidget);
  }

  void toggle(bool value) {
    _isSwitched.value = value;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: _isSwitched,
        builder: (_, value, __) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.text,
                style: const TextStyle(
                    fontSize: 16,
                    fontFamily: "RobotoFlex",
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF471515)),
              ),
              Switch(
                value: value,
                onChanged: toggle,
                activeColor: const Color(0xFFFF4C4C).withOpacity(0.71),
              ),
            ],
          );
        });
  }
}
