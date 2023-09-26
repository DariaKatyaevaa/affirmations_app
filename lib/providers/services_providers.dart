import 'package:affirmations_app/services/audio_player/audio_player_service.dart';
import 'package:affirmations_app/services/auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:affirmations_app/services/api/dio_service.dart';
import 'package:affirmations_app/services/device_info/device_info_service.dart';
import 'package:affirmations_app/services/storage/hive_storage_service.dart';
import 'package:affirmations_app/services/storage/storage_service.dart';
import 'package:affirmations_app/services/screenshot_share/screenshot_share_service.dart';

final storageServiceProvider = Provider<StorageService>((_) => HiveStorageService());

final dioServiceProvider = Provider<DioService>((_) => DioService(_));

final deviceInfoServiceProvider = Provider<DeviceInfoService>((_) => DeviceInfoService());

final audioPlayerServiceProvider = Provider<AudioPlayerService>((_) => AudioPlayerService());

final authServiceProvider = Provider<FirebaseAuthService>((_) => FirebaseAuthService(FirebaseAuth.instance, _));

final screenshotShareServiceProvider = Provider<ScreenshotShareService>((_) => ScreenshotShareService());
