import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app/app.dart';
import 'core/device/device_info_service.dart';
import 'features/home/cubit/home_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider(
          create: (_) => HomeCubit(
            DeviceInfoService(),
          )..loadDeviceInfo(),
          child: RksEventApp(),
        );
      },
    ),
  );
}