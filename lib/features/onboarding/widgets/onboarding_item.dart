import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/onboarding_model.dart';

class OnboardingItem extends StatelessWidget {
  final OnboardingModel item;

  const OnboardingItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.w),
      child: Column(
        children: [
          SizedBox(height: 60.h),

          // Image
          // Expanded(
          //   flex: 5,
          //   child: Container(
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(16.r),
          //     ),
          //     clipBehavior: Clip.antiAlias,
          //     child: Image.asset(
          //       item.image,
          //       fit: BoxFit.contain,
          //       alignment: Alignment.center,
          //     ),
          //   ),
          // ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Image.asset(
                item.image,
                fit: BoxFit.contain,
                alignment: Alignment.center,
              ),
            ),
          ),
          // Expanded(
          //   flex: 5,
          //   child: ClipRRect(
          //     borderRadius: BorderRadius.circular(16.r),
          //     child: Image.asset(
          //       item.image,
          //       fit: BoxFit.contain,
          //       alignment: Alignment.center,
          //     ),
          //   ),
          // ),
          SizedBox(height: 30.h),

          // Title
          Text(
            item.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 16.h),

          // Description
          Text(
            item.description,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.sp, height: 1.5, color: Colors.grey),
          ),

          SizedBox(height: 40.h),
        ],
      ),
    );
  }
}
