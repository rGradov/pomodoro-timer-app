import 'package:flutter/material.dart';

import '../../../vm/settings_vm.dart';

class ToggleButton extends StatefulWidget {
  const ToggleButton(
      {Key? key,
      required this.text,
      this.value = false,
      required this.callback})
      : super(key: key);
  final String text;
  final bool value;
  final ToggleCallback callback;

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
                style: TextStyle(
                  color: Theme.of(context).canvasColor,
                  fontSize: 16,
                  fontFamily: "RobotoFlex",
                ),
              ),
              Switch(
                value: value,
                onChanged: (v)async =>await widget.callback(v),
                activeColor: Theme.of(context).highlightColor,
              ),
            ],
          );
        });
  }
}

class ToggleBlockButton extends StatefulWidget {
  const ToggleBlockButton(
      {Key? key,
      required this.text,
      this.value = false,
      required this.callback})
      : super(key: key);
  final String text;
  final bool value;
  final ToggleCallback callback;

  @override
  State<ToggleBlockButton> createState() => _ToggleBlockButtonState();
}

class _ToggleBlockButtonState extends State<ToggleBlockButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).dividerColor,
      constraints:
          const BoxConstraints(minHeight: 40, minWidth: double.infinity),
      child: FractionallySizedBox(
        widthFactor: 0.9,
        alignment: Alignment.center,
        child: ToggleButton(
          callback: widget.callback,
          text: widget.text,
          value: widget.value,
        ),
      ),
    );
  }
}

class BlockItem extends StatelessWidget {
  const BlockItem({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).dividerColor,
      constraints:
          const BoxConstraints(minHeight: 40, minWidth: double.infinity),
      child: FractionallySizedBox(
        widthFactor: 0.9,
        alignment: Alignment.center,
        child: child,
      ),
    );
  }
}
