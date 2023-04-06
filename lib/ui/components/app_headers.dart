import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HeaderWrapper extends StatelessWidget {
  const HeaderWrapper(
      {Key? key,
      required this.text,
      required this.callback,
      required this.child})
      : super(key: key);
  final String text;
  final VoidCallback callback;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.95,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          GestureDetector(
            onTap:callback,
            child: child,
          ),
        ],
      ),
    );
  }
}

class HeaderBackWrapper extends StatelessWidget {
  const HeaderBackWrapper({Key? key, required this.text, this.callback,this.header})
      : super(key: key);
  final String text;
  final String? header;
  final VoidCallback? callback;
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.95,
      child: GestureDetector(
        onTap: callback ?? () => context.pop(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.navigate_before,
            ),
           Expanded(child:  Text(
             text,
             style: const TextStyle(
                 fontSize: 24,
                 fontFamily: "RobotoFlex",
                 fontWeight: FontWeight.bold,
                 color: Color(0xFF471515)),
           ),),
          ],
        ),
      ),
    );
  }
}
