import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:novael/core/extensions/ui_extension.dart';

import 'package:novael/features/onbarding/presentation/widgets/page_indicator.dart';
import 'package:novael/shared/widgets/text_view.dart';

import '../../../../res.dart';
import '../shared/widgets/center_avatar.dart';
import '../view_model/onboarding_provider.dart';
import '../widgets/page_one.dart';

class OnBoardingScreen extends ConsumerWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(onBoardingProvider);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 500.h,
            child: PageView(
              controller: provider.pageController,
              onPageChanged: (index) {
                provider.changePageIndex(index);
              },
              children: const [
                PageOne(),
                PageOne(),
                PageOne(),
              ],
            ),
          ),
          SizedBox(
            height: 68.h,
          ),
          TextView(
            text: "You work hard to\nearn your money",
            fontWeight: FontWeight.w700,
            height: 1.0,
            fontFamily: GoogleFonts.sourceSansPro().fontFamily,
            size: 28.sp,
          ),
          SizedBox(
            height: 8.h,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 59.5, right: 59.5),
            child: TextView(
              text:
                  "You work hard to earn your money, now you want a way to make it work harder for you. You are at the right",
              fontFamily: GoogleFonts.sourceSansPro().fontFamily,
              fontWeight: FontWeight.w400,
              size: 12.sp,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              3,
              (index) => PageIndicatorWidget(
                index: index,
              ),
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
          Container(
            width: 350.w,
            height: 57.h,
            decoration: ShapeDecoration(
              color: context.theme.colorScheme.secondary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            child: TextButton(
              onPressed: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextView(
                    text: "Get Started With Googleå",
                    textAlign: TextAlign.center,
                    size: 14.sp,
                    // color: context.theme.colorScheme.onSurface,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Container(
            width: 350.w,
            height: 57.h,
            decoration: ShapeDecoration(
              // color: context.theme.colorScheme.secondary,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
                side: BorderSide(
                    width: 0.50,
                    color: context.theme.colorScheme.onPrimaryContainer),
              ),
            ),
            child: TextButton(
              onPressed: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextView(
                    text: "Get Started With Googleå",
                    textAlign: TextAlign.center,
                    size: 14.sp,
                    color: context.theme.colorScheme.onSurface,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
