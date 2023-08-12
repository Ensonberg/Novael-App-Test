import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/styles/colors/app_colors.dart';
import '../../../../../res.dart';

class RightAvatar extends StatelessWidget {
  final bool isVoice;
  const RightAvatar({Key? key, required this.isVoice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
            width: 165.w,
            height: 70.h,
            child: Stack(
              children: [
                Positioned(
                  right: 0,
                  child: Image.asset(
                    Res.avatar3,
                    height: 70.h,
                    width: 70.w,
                  ),
                ),
                Positioned(
                  left: 0,
                  child: Transform(
                    transform: Matrix4.identity()
                      ..translate(0.0, 30.0)
                      ..rotateZ(-0.06),
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
                        color: AppColors.purple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(500).r,
                        ),
                      ),
                      child: Row(
                        children: [
                          Transform(
                            transform: Matrix4.identity()
                              ..translate(2.0, 0.0)
                              ..rotateZ(0.05),
                            child: SvgPicture.asset(
                              Res.indicator2,
                              width: 60.w,
                            ),
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          SvgPicture.asset(Res.Vector),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )),
      ],
    );
  }
}
