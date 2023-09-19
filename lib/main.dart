import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'firebase_options.dart';
import 'providers/locale_provider.dart';
import 'providers/services_providers.dart';
import 'router/app_router.dart';
import 'services/device_info/device_info_service.dart';
import 'services/storage/hive_storage_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  final hiveStorageService = HiveStorageService();
  await hiveStorageService.init();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);

  final deviceInfoService = DeviceInfoService();
  await deviceInfoService.initProperInfo();

  runApp(
    ProviderScope(
      overrides: [
        storageServiceProvider.overrideWithValue(hiveStorageService),
        deviceInfoServiceProvider.overrideWithValue(deviceInfoService),
      ],
      child: EasyLocalization(
        supportedLocales: const [Locale('en')], //const [Locale('en'), Locale('ru')],
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
  Widget build(BuildContext context) => Consumer(
        builder: (context, ref, child) {
          router ??= AppRouter(ref);

          return MaterialApp.router(
            onGenerateTitle: (_) => 'appName'.tr(),
            debugShowCheckedModeBanner: false,
            routerDelegate: router!.appRouter.routerDelegate,
            routeInformationParser: router!.appRouter.routeInformationParser,
            routeInformationProvider: router!.appRouter.routeInformationProvider,
            theme: ThemeData(useMaterial3: true),
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: ref.watch(localeProvider).toLocale(),
          );
        },
      );
}
