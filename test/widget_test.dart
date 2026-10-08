// // This is a basic Flutter widget test.
// //
// // To perform an interaction with a widget in your test, use the WidgetTester
// // utility in the flutter_test package. For example, you can send tap and scroll
// // gestures. You can also use WidgetTester to find child widgets in the widget
// // tree, read text, and verify that the values of widget properties are correct.

// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:rksevent/main.dart';
// // import '../../../features/home/cubit/home_cubit.dart';
// import '../../rksevent/lib/features/home/cubit/home_cubit.dart';



// void main() {
//   testWidgets('Counter increments smoke test', (WidgetTester tester) async {
//     // Build our app and trigger a frame.
//     await tester.pumpWidget(const RksEventApp());

//     // Verify that our counter starts at 0.
//     expect(find.text('0'), findsOneWidget);
//     expect(find.text('1'), findsNothing);

//     // Tap the '+' icon and trigger a frame.
//     await tester.tap(find.byIcon(Icons.add));
//     await tester.pump();

//     // Verify that our counter has incremented.
//     expect(find.text('0'), findsNothing);
//     expect(find.text('1'), findsOneWidget);
//   });
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:rksevent/app/app_start.dart';
import 'package:rksevent/core/device/device_info_service.dart';
import 'package:rksevent/features/home/cubit/home_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  Future<void> pumpApp(WidgetTester tester) async {
    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(390, 844),
        builder: (context, child) {
          return BlocProvider(
            create: (_) => HomeCubit(DeviceInfoService()),
            child: const AppStart(),
          );
        },
      ),
    );
  }

  testWidgets('shows onboarding flow when onboarding is not seen', (
    WidgetTester tester,
  ) async {
    SharedPreferences.setMockInitialValues({});
    await pumpApp(tester);
    await tester.pumpAndSettle();

    expect(find.text('Discover Amazing Events'), findsOneWidget);
    expect(find.text('RKS EVENTS'), findsNothing);
  });

  testWidgets('shows home page when onboarding is already seen', (
    WidgetTester tester,
  ) async {
    SharedPreferences.setMockInitialValues({
      'onbording_seen': true,
    });
    await pumpApp(tester);

    await tester.pumpAndSettle();

    expect(find.text('RKS EVENTS'), findsOneWidget);
    expect(find.text('Discover Amazing Events'), findsNothing);
  });
}
