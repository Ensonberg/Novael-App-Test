import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/styles/colors/app_colors.dart';
import '../../../../../res.dart';

class CenterAvatar extends StatelessWidget {
  final bool isVoice;
  const CenterAvatar({Key? key, required this.isVoice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          width: 200.w,
          child: Stack(
            children: [
              Image.asset(
                Res.avatar2,
                height: 130.h,
                width: 130.w,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 117.w,
                  height: 36.h,
                  padding: EdgeInsets.only(
                    top: 10.w,
                    left: 12.w,
                    right: 10.w,
                    bottom: 10.w,
                  ),
                  decoration: ShapeDecoration(
                    color: AppColors.grey,
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
    );
  }
}
