import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:novael/core/extensions/ui_extension.dart';
import 'package:novael/features/onbarding/presentation/shared/widgets/right_avatar.dart';

import '../../../../shared/widgets/text_view.dart';
import '../shared/widgets/center_avatar.dart';
import '../shared/widgets/left_avatar.dart';

class PageOne extends StatefulWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;
  late Animation _secondAnimation;
  late Animation _lastAnimation;
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void handler(status) {
    if (status == AnimationStatus.completed) {
      _animation.removeStatusListener(handler);
      _controller.reset();
      _animation = Tween(begin: 0.0, end: 2.0).animate(CurvedAnimation(
        parent: _controller,
        curve: Curves.fastOutSlowIn,
      ));

      _secondAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 1.0, curve: Curves.fastOutSlowIn),
      ))
        ..addStatusListener((status) {
          if (status == AnimationStatus.completed) {}
        });
      _lastAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 1.0, curve: Curves.fastOutSlowIn),
      ));
      //_controller.forward();
    }

    // _controller.forward();
  }

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    _animation = Tween(begin: -1.0, end: 0.0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn))
      ..addStatusListener(handler);

    _secondAnimation = Tween(begin: -3.0, end: 0.0).animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 1.0, curve: Curves.fastOutSlowIn)));
    _lastAnimation = Tween(begin: -3.0, end: 0.0).animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.6, 1.0, curve: Curves.fastOutSlowIn)));

    _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Container(
            color: context.theme.colorScheme.scrim,
            child: Padding(
              padding: const EdgeInsets.only(left: 41, right: 41, bottom: 41).w,
              child: Column(
                children: [
                  SizedBox(height: 66.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: TextView(
                          text: "Skip",
                          fontFamily: GoogleFonts.lato().fontFamily,
                          size: 18.sp,
                          color: Theme.of(context).colorScheme.onSurface,
                          fontWeight: FontWeight.w800,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  Transform(
                    transform: Matrix4.translationValues(
                        _animation.value * width, 0.0, 0.0),
                    child: const LeftAvatar(
                      isVoice: false,
                    ),
                  ),
                  Transform(
                    transform: Matrix4.translationValues(
                        _secondAnimation.value * width, 0.0, 0.0),
                    child: const RightAvatar(
                      isVoice: false,
                    ),
                  ),
                  Transform(
                    transform: Matrix4.translationValues(
                        _lastAnimation.value * width, 0.0, 0.0),
                    child: const CenterAvatar(
                      isVoice: false,
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
