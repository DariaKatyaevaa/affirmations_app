import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';


class DeviceInfoService {
  late final deviceInfoPlugin = DeviceInfoPlugin();

  BaseDeviceInfo? baseDeviceInfo;

  dynamic get deviceInfo => defaultTargetPlatform == TargetPlatform.android
      ? baseDeviceInfo as AndroidDeviceInfo?
      : defaultTargetPlatform == TargetPlatform.iOS
          ? baseDeviceInfo as IosDeviceInfo?
          : baseDeviceInfo as WebBrowserInfo?;

  Future<void> initProperInfo() async {
    baseDeviceInfo = await deviceInfoPlugin.deviceInfo;
  }
}
