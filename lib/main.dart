import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'providers/locale_provider.dart';
import 'providers/providers_logger.dart';
import 'providers/services_providers.dart';
import 'router/app_router.dart';
import 'services/device_info/device_info_service.dart';
import 'services/storage/hive_storage_service.dart';
import 'theme/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Initialize EasyLocalization
  await EasyLocalization.ensureInitialized();

  /// Initialize Hive
  // await Hive.initFlutter();
  // final hiveStorageService = HiveStorageService();
  // await hiveStorageService.openBox('');

  final deviceInfoService = DeviceInfoService();
  await deviceInfoService.initProperInfo();

  /// Initialize Firebase
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  /// Run the `AffirmationsApp` app
  runApp(
    ProviderScope(
      observers: [ProvidersLogger()],
      overrides: [
        //storageServiceProvider.overrideWithValue(hiveStorageService),
        deviceInfoServiceProvider.overrideWithValue(deviceInfoService),
      ],
      child: EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ru')],
        path: 'assets/translations',
        useOnlyLangCode: true,
        fallbackLocale: const Locale('en'),
        child: AffirmationsApp(),
      ),
    ),
  );
}

class AffirmationsApp extends StatelessWidget {
  AffirmationsApp({super.key});

  AppRouter? router;

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
        /// Size of the device the designer uses in their designs on Figma
        designSize: const Size(412, 732),
        builder: (_, __) => Consumer(
          builder: (context, ref, child) {
            router ??= AppRouter(ref);

            return MaterialApp.router(
              onGenerateTitle: (_) => 'appName'.tr(),
              debugShowCheckedModeBanner: false,
              routerDelegate: router!.appRouter.routerDelegate,
              routeInformationParser: router!.appRouter.routeInformationParser,
              routeInformationProvider: router!.appRouter.routeInformationProvider,
              theme: AppThemes.primary(),
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: ref.watch(localeProvider).toLocale(),
            );
          },
        ),
      );
}
