import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app/theme/app_colors.dart';

class HeroSection extends StatelessWidget {
  final bool isDesktop;

  const HeroSection({
    super.key,
    required this.isDesktop,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: AspectRatio(
        aspectRatio: isDesktop ? 2.1 : 0.88,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            image: const DecorationImage(
              // image: AssetImage('assets/images/venues.png'),
              // fit: BoxFit.cover,
              image: AssetImage('assets/images/hero_image.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white.withValues(alpha: .20),
                  AppColors.darkWine.withValues(alpha: 0.88),
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.lightGold,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    ' FEATURED CURATION',
                    style: TextStyle(
                      fontFamily: "Plus_Jakarta_Sans",
                      fontWeight: FontWeight.bold,
                      color: AppColors.gold ,
                      fontSize: 10.sp,
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  'Your Story,',
                  style: TextStyle(
                    fontFamily: 'Playfair_Display',
                    color: Colors.white,
                    fontSize: isDesktop ? 38.sp : 25.sp,
                    height: 1.08,
                    fontWeight: FontWeight.normal,
                  ),
                ),Text(
                  'Beautifully Celebrated.',
                  style: TextStyle(
                    fontFamily: 'Playfair_Display',
                    color: AppColors.gold,
                    fontSize: isDesktop ? 38.sp : 25.sp,
                    height: 1.08,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  'Curating royal architectural venues, bespoke bridal couture, and timeless celebrations.',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: 'Plus_Jakarta_Sans',
                    color: Colors.white.withValues(alpha: 0.85),
                    fontSize: 14.sp,
                    height: 1.4,
                    fontWeight: FontWeight.w500,
                    
                  ),
                ),
                SizedBox(height: 18.h),
                Wrap(
                  spacing: 10.w,
                  runSpacing: 10.h,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      label: const Text('Start Planning',
                      style: TextStyle(
                        color: AppColors.gold,
                        fontSize: 16,
                      ),
                      ),
                      icon: const Icon(Icons.arrow_outward),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.lightGold,
                        foregroundColor: AppColors.gold,
                        padding: EdgeInsets.symmetric(
                          horizontal: 14.w,
                          vertical: 14.h,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      
                    ),
                    OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.play_circle_outline),
                      label: const Text('Explore',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      ),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: AppColors.background.withValues(alpha: 0.5),
                        side: const BorderSide(color: Colors.white54),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 14.h,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}