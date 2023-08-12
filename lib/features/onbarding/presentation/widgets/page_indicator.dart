import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:novael/core/extensions/ui_extension.dart';
import 'package:novael/core/styles/colors/app_colors.dart';

import '../view_model/onboarding_provider.dart';

class PageIndicatorWidget extends ConsumerWidget {
  final int index;
  const PageIndicatorWidget({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var controller = ref.watch(onBoardingProvider);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      margin: const EdgeInsets.only(right: 5),
      height: 5.h,
      width: 45.w,
      decoration: ShapeDecoration(
        color: controller.currentPageIndex == index
            ? context.theme.colorScheme.onPrimaryContainer
            : AppColors.grey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
