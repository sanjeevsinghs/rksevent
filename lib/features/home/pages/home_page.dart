import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app/theme/app_colors.dart';
import '../../../core/responsive/responsiv.dart';
import '../../../shared/widgets/responsive_container.dart';
import '../cubit/home_cubit.dart';
// import '../widgets/category_card.dart';
import '../widgets/hero_section.dart';
import '../widgets/royal_suite_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ResponsiveContainer(
        mobile: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: _buildTopHeader(context)),
            SliverToBoxAdapter(child: _buildTopSignInLogin(context)),
            SliverToBoxAdapter(
              child: HeroSection(isDesktop: Responsive.isDesktop(context)),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 24.h)),
            SliverToBoxAdapter(child: _buildChatBar()),
            SliverToBoxAdapter(child: SizedBox(height: 38.h)),
            SliverToBoxAdapter(child: _buildRoyalSuiteTitle()),
            SliverToBoxAdapter(child: SizedBox(height: 10.h)),
            SliverToBoxAdapter(
              child: RoyalSuiteSection(
                isDesktop: Responsive.isDesktop(context),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 32.h)),
            SliverToBoxAdapter(child: _buildDeviceInformation()),
            SliverToBoxAdapter(child: SizedBox(height: 32.h)),
          ],
        ),
      ),
    );
  }

  Widget _buildTopHeader(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 0.h),
      child: Row(
        children: [
          const Image(
            image: AssetImage('assets/icons/home_logo.jpg'),
            width: 40,
            height: 40,
            fit: BoxFit.cover,
            
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'RKS EVENTS',
                  style: TextStyle(
                    fontFamily: 'Playfair_display',
                    fontWeight: FontWeight.bold,
                    color: AppColors.darkWine,
                    fontSize: 16.sp,
                    letterSpacing: 1,
                  ),
                ),
                Text(
                  'HAUTE CELEBRATION',
                  style: TextStyle(
                    fontFamily: 'Playfair_display',
                    fontWeight: FontWeight.bold,
                    color: AppColors.gold,
                    fontSize: 12.sp,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
          ),
          CircleAvatar(
            radius: 22.r,
            backgroundColor: AppColors.darkWine,
            child: IconButton(
              onPressed: () {
                // Navigate to profile or login.
              },
              icon: const Icon(Icons.person_outline, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildTopSignInLogin(BuildContext context) {
  return Container(
    color: AppColors.background,
    padding: EdgeInsets.symmetric(vertical: 10.h),
    child: Padding(
      padding: EdgeInsets.fromLTRB(20.w, 0.h, 20.w, 0.h),
      child: Row(
        children: [
          const Image(
            image: AssetImage('assets/icons/home_logo.jpg'),
            width: 40,
            height: 40,
            fit: BoxFit.cover,
          ),

          SizedBox(width: 8.w),

          Expanded(
            child: Text(
              'RKS CURATIONS',
              style: TextStyle(
                fontFamily: 'Playfair_display',
                fontWeight: FontWeight.bold,
                color: AppColors.gold,
                fontSize: 12.sp,
                letterSpacing: 1.2,
              ),
            ),
          ),

          TextButton(
            onPressed: () {},
            child: Text(
              'SIGN IN',
              style: TextStyle(
                color: AppColors.gold,
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          TextButton(
            onPressed: () {},
            child: Text(
              'LOGIN',
              style: TextStyle(
                color: AppColors.darkWine,
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

  Widget _buildChatBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 12,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 18.r,
              backgroundColor: AppColors.lightGold,
              child: const Icon(
                Icons.chat_bubble_outline,
                color: AppColors.darkWine,
                size: 19,
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Haute Concierge Online',
                    style: TextStyle(
                      fontFamily: 'Plus_Jakarta_Sans',
                      fontSize: 14.sp,
                      color: AppColors.textDark,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Private royal advisor reserved for you',
                    style: TextStyle(fontSize: 10.sp, color: AppColors.gold),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: AppColors.darkWine,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Text(
                'CONNECT',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoyalSuiteTitle() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          Text(
            '—  THE ROYAL SUITE  —',
            style: TextStyle(
              fontFamily: 'Plus_Jakarta_Sans', 
              color: AppColors.gold,
              fontSize: 11.sp,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Everything For Your\nCelebration',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Playfair_Display',
              color: AppColors.darkWine,
              fontSize: 28.sp,
              height: 1.1,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Five refined dimensions of bespoke craftsmanship curated exclusively for royal weddings.',
            maxLines: 3,
            
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.textMuted,
              fontSize: 14.sp,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDeviceInformation() {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            state.deviceDescription,
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.textMuted, fontSize: 11.sp),
          ),
        );
      },
    );
  }
}
