import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'category_card.dart';

class RoyalSuiteSection extends StatelessWidget {
  final bool isDesktop;

  const RoyalSuiteSection({
    super.key,
    required this.isDesktop,
  });

  @override
  Widget build(BuildContext context) {
    final categories = [
      const CategoryCard(
        text: '120+ CURATED',
        title: 'ARTISANS & GUILDS',
        subtitle: 'Master cinematographers, Michelin-starred royal caterers, and specialists.',
        buttonText: 'View Specialists',
        imagePath: 'assets/images/vendar.png',
        icon: Icons.camera_alt_outlined,
      ),
      const CategoryCard(
        text: '120+ CURATED',
        title: 'Venues',
        subtitle: 'Centuries-old palaces and beautiful locations for your celebration.',
        buttonText: 'Explore Palaces',
        imagePath: 'assets/images/vendar.png',
        icon: Icons.account_balance_outlined,
      ),
      const CategoryCard(
        text: '120+ CURATED',
        title: 'Planning',
        subtitle: 'Organize every elegant detail of your special celebration.',
        buttonText: 'Start Planning',
        imagePath: 'assets/images/vendar.png',
        icon: Icons.calendar_month_outlined,
      ),
    ];

    if (isDesktop) {
      return Padding(
        padding: EdgeInsets.all(24.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: categories
              .map(
                (category) => Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: category,
                  ),
                ),
              )
              .toList(),
        ),
      );
    }

    return SizedBox(
      height: 350.h,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, _) => SizedBox(width: 16.w),
        itemBuilder: (context, index) {
          return SizedBox(
            width: 280.w,
            child: categories[index],
          );
        },
      ),
    );
  }
}