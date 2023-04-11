import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pomodoro/models/interval_model.dart';
import 'package:pomodoro/utils/app_export.dart';
import 'package:pomodoro/utils/app_locator.dart';
import 'package:provider/provider.dart';

import '../../vm/interval_vm.dart';
import '../components/app_headers.dart';

/// this is interval screen which help us to choose on of the time break
/// in Future the time interval should have option to choose custom time
class IntervalScreen extends StatefulWidget {
  final String name;
  final IntervalType type;
  const IntervalScreen({Key? key, required this.name, required this.type})
      : super(key: key);

  @override
  State<IntervalScreen> createState() => _IntervalScreenState();
}

class _IntervalScreenState extends State<IntervalScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => IntervalVm(type: widget.type),
        lazy: false,
        child: _IntervalBody(name: widget.name));
  }
}

class _IntervalBody extends StatelessWidget {
  final String name;
  const _IntervalBody({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = context.select((IntervalVm vm) => vm.state);
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Stack(
                fit: StackFit.loose,
                alignment: Alignment.center,
                children: [
                  Positioned(
                    bottom: 3,
                    child: Text(name,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.labelMedium),
                  ),
                  HeaderBackWrapper(
                    text: "Settings",
                    callback: () => context.pop(true),
                  ),
                ],
              ),
              Expanded(
                  child: ListView.separated(
                      itemBuilder: (_, idx) {
                        return ItemElem(id: idx, interval: items[idx]);
                      },
                      separatorBuilder: (_, idx) {
                        return const SizedBox(height: 1);
                      },
                      itemCount: items.length)),
            ],
          ),
        ));
  }
}

class ItemElem extends StatelessWidget {
  const ItemElem({Key? key, required this.id, required this.interval})
      : super(key: key);
  final IntervalModel interval;
  final int id;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<IntervalVm>().select(id);
      },
      child: Container(
        width: double.infinity,
        color: Theme.of(context).dividerColor,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              interval.value.toString() + (interval.measure ?? ""),
              style: TextStyle(
                color: Theme.of(context).canvasColor,
                fontSize: 14,
                fontFamily: "RobotoFlex",
              ),
            ),
            interval.isSelected
                ? Icon(
                    Icons.done,
                    color: Theme.of(context).canvasColor,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}

class _HeaderWrapper extends StatelessWidget {
  const _HeaderWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pop(true),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Transform.scale(
            scale: 0.7,
            child: RotatedBox(
              quarterTurns: 2,
              child: SvgPicture.asset("assets/icons/arrow.svg"),
            ),
          ),
          const Text(
            "Settings",
            style: TextStyle(
                fontSize: 24,
                fontFamily: "RobotoFlex",
                fontWeight: FontWeight.bold,
                color: Color(0xFF471515)),
          ),
        ],
      ),
    );
  }
}
