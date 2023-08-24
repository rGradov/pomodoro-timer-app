part of 'app_home.dart';

class HomeScreen extends ElementaryWidget<HomeWm> {
  const HomeScreen({Key? key}) : super(createHomeWm, key: key);

  @override
  Widget build(HomeWm wm) {
    return Scaffold(
      backgroundColor: wm.backgroundColor,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Colors.transparent,
        ),
        child: ValueListenableBuilder<TimePeriod?>(
          valueListenable: wm.period,
          builder: (_, value, __) {
            return switch (value) {
              null => Scaffold(
                  backgroundColor: wm.backgroundColor,
                  body: const SizedBox.expand()),
              _ => Scaffold(
                  backgroundColor: wm.backgroundColor,
                  body: SafeArea(
                    child: Column(
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 100),
                          curve: Curves.easeIn,
                          width: value.size.width,
                          height: value.size.height,
                          decoration: BoxDecoration(
                              color: wm.cardColor,
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(
                                width: 2,
                                color: wm.canvasColor,
                              )),
                          child: Center(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    value.icon,
                                  ),
                                  Text(
                                    value.name,
                                    style: wm.mediumStyle,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const Expanded(
                          flex: 2,
                          child: SizedBox.expand(),
                        ),
                        Expanded(
                          child: FractionallySizedBox(
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SmallButton(
                                  callback: () async {
                                    // final value = await context.push<bool>("/settings");
                                    // if (value == true) {
                                    //   context.read<MainVm>().loadConfig();
                                    // }
                                  },
                                  color: wm.dividerColor,
                                  child: HeroIcon(
                                    HeroIcons.adjustmentsHorizontal,
                                    size: 35,
                                    style: HeroIconStyle
                                        .solid, // Outlined icons are used by default.
                                    color: wm.indicatorColor,
                                  ),
                                ),
                                PlayButton(
                                  callback: () {},
                                  indicatorColor: wm.indicatorColor,
                                  color: wm.dividerColor,
                                ),
                                SmallButton(
                                  callback: wm.onNextButtonTap,
                                  color: wm.dividerColor,
                                  child: HeroIcon(
                                    HeroIcons.forward,
                                    size: 30,
                                    style: HeroIconStyle
                                        .solid, // Outlined icons are used by default.
                                    color: wm.indicatorColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
            };
          },
        ),
      ),
    );
  }
}
