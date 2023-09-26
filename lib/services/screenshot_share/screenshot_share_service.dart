import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class ScreenshotShareService {
  final _screenshotController = ScreenshotController();

  ScreenshotController get screenshotController => _screenshotController;

  Future<void> saveImage() async {
    final bytes = await _screenshotController.capture();
    await [Permission.storage].request();
    if (bytes != null) {
      final time = DateTime.now().toIso8601String().replaceAll('.', '_').replaceAll(':', '_');
      final name = 'screenshot_$time';
      try {
        await ImageGallerySaver.saveImage(bytes, name: name);
      } catch (e) {
        log('While downloading image: $e');
      }
    }
  }

  Future<void> saveAndShare() async {
    final bytes = await _screenshotController.capture();
    final time = DateTime.now().toIso8601String().replaceAll('.', '_').replaceAll(':', '_');
    final name = 'screenshot_$time.png';
    await Share.shareXFiles(
      [
        XFile.fromData(
          bytes!,
          name: name,
          mimeType: 'image/png',
        ),
      ],
    );
  }

  Future<void> shareFromWidget(Widget widget) async {
    final bytes = await _screenshotController.captureFromWidget(widget);
    final time = DateTime.now().toIso8601String().replaceAll('.', '_').replaceAll(':', '_');
    final name = 'screenshot_$time.png';
    await Share.shareXFiles(
      [
        XFile.fromData(
          bytes,
          name: name,
          mimeType: 'image/png',
        ),
      ],
    );
  }
}
