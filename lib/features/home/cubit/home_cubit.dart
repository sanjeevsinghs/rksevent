import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/device/device_info_service.dart';

class HomeState {
  final bool isLoading;
  final String deviceDescription;
  final int selectedCategory;

  const HomeState({
    this.isLoading = false,
    this.deviceDescription = '',
    this.selectedCategory = 0,
  });

  HomeState copyWith({
    bool? isLoading,
    String? deviceDescription,
    int? selectedCategory,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      deviceDescription: deviceDescription ?? this.deviceDescription,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }
}

class HomeCubit extends Cubit<HomeState> {
  final DeviceInfoService deviceInfoService;

  HomeCubit(this.deviceInfoService) : super(const HomeState());

  Future<void> loadDeviceInfo() async {
    emit(state.copyWith(isLoading: true));

    final description = await deviceInfoService.getDeviceDescription();

    emit(
      state.copyWith(
        isLoading: false,
        deviceDescription: description,
      ),
    );
  }

  void selectCategory(int index) {
    emit(state.copyWith(selectedCategory: index));
  }
}