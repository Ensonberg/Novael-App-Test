import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/styles/colors/app_colors.dart';
import '../../../../../res.dart';

class LeftAvatar extends StatelessWidget {
  final bool isVoice;
  const LeftAvatar({Key? key, required this.isVoice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
            width: 165.w,
            child: Stack(
              children: [
                Image.asset(
                  Res.avatar1,
                  height: 70.h,
                  width: 70.w,
                ),
                Positioned(
                  right: 0,
                  child: Container(
                    width: 108.w,
                    height: 36.h,
                    padding: EdgeInsets.only(
                      top: 10.w,
                      left: 12.w,
                      right: 10.w,
                      bottom: 10.w,
                    ),
                    decoration: ShapeDecoration(
                      color: AppColors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(500).r,
                      ),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(Res.Vector),
                        SizedBox(
                          width: 3.w,
                        ),
                        SvgPicture.asset(Res.indicator1),
                      ],
                    ),
                  ),
                )
              ],
            )),
      ],
    );
  }
}
