import 'dart:io';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:permission_handler/permission_handler.dart';
import 'package:dio/dio.dart';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';

class DownloadService {
  // var imageUrl =
  //     "https://www.itl.cat/pngfile/big/10-100326_desktop-wallpaper-hd-full-screen-free-download-full.jpg";
  bool downloading = true;
  String downloadingStr = "No data";
  String savePath = "";
  Dio dio = Dio();
  final String _fileUrl =
      "https://muba.socketspace.com/uploads/galeri_foto/375cfbc10fcb4fa8993044ba71f471d7.jpg";
  final String _fileName = "375cfbc10fcb4fa8993044ba71f471d7.jpg";
  FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;
  String _progress = "-";

  Future<String> getFilePath(uniqueFileName) async {
    String path = '';

    Directory dir = await getApplicationDocumentsDirectory();

    path = '${dir.path}/$uniqueFileName';

    return path;
  }

  Future<Directory?> getDownloadDirectory() async {
    if (Platform.isAndroid) {
      return await DownloadsPathProvider.downloadsDirectory;
    }
    return await getApplicationDocumentsDirectory();
  }

  Future<bool> requestPermissions() async {
    // var permission =
    //     await PermissionHandler.checkPermissionStatus(PermissionGroup.storage);

    var permission = await Permission.storage.status;

    if (permission != PermissionStatus.granted) {
      await Permission.storage.request();
      await Permission.storage.request().isGranted;
    }

    return permission == PermissionStatus.granted;
  }

  Future<void> download(final String _fileName, final String _fileUrl) async {
    final dir = await getDownloadDirectory();
    final isPermissionStatusGranted = await requestPermissions();

    if (isPermissionStatusGranted == true) {
      final savePath = path.join(dir!.path, _fileName);
      await startDownload(savePath, _fileUrl);
    } else {
      // handle the scenario when user declines the permissions
      EasyLoading.dismiss();
    }
  }

  Future<void> startDownload(String savePath, final String _fileUrl) async {
    Map<String, dynamic> result = {
      'isSuccess': false,
      'filePath': null,
      'error': null,
    };

    try {
      final response = await dio.download(_fileUrl, savePath,
          onReceiveProgress: onReceiveProgress);
      result['isSuccess'] = response.statusCode == 200;
      result['filePath'] = savePath;
    } catch (ex) {
      result['error'] = ex.toString();
    }
  }

  void onReceiveProgress(int received, int total) {
    if (total != -1) {
      _progress = (received / total * 100).toStringAsFixed(0) + "%";
    }
  }
}
