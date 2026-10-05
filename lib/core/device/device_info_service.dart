import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';

class DeviceInfoService {
  final DeviceInfoPlugin _deviceInfoPlugin = DeviceInfoPlugin();

  Future<String> getDeviceDescription() async {
    try {
      if (kIsWeb) {
        final webInfo = await _deviceInfoPlugin.webBrowserInfo;

        return 'Web browser: ${webInfo.browserName.name}';
      }

      if (defaultTargetPlatform == TargetPlatform.android) {
        final androidInfo = await _deviceInfoPlugin.androidInfo;

        return 'Android ${androidInfo.version.release} - '
            '${androidInfo.manufacturer} ${androidInfo.model}';
      }

      return 'Unsupported platform';
    } catch (error) {
      return 'Device information unavailable';
    }
  }
}