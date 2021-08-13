import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:muba/generated/l10n.dart';
import 'package:path_provider/path_provider.dart';

class CustomDialog extends StatefulWidget {
  final String unduhFile;
  final String title;
  final String url;
  const CustomDialog(
      {Key? key,
      required this.unduhFile,
      required this.title,
      required this.url})
      : super(key: key);

  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  var imageUrl =
      "https://www.itl.cat/pngfile/big/10-100326_desktop-wallpaper-hd-full-screen-free-download-full.jpg";
  bool downloading = true;
  String downloadingStr = "No data";
  String savePath = "";

  @override
  void initState() {
    super.initState();
    EasyLoading.instance
      ..indicatorType = EasyLoadingIndicatorType.ring
      ..userInteractions = false
      ..backgroundColor = Colors.transparent
      ..indicatorColor = Color(0x0FF27405E)
      ..textColor = Color(0x0FF27405E);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        height: 268,
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  height: 49,
                  decoration: BoxDecoration(
                      color: Color(0xFF27405E),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      boxShadow: [BoxShadow(color: Colors.black54)]),
                  child: Center(
                    child: Text(
                      widget.title,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                SizedBox(
                  height: 29,
                ),
                Text(
                  S.of(context).dialogContent,
                  style: TextStyle(color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  '"${widget.unduhFile}"',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                  width: 2,
                  color: Color(0xFF27405E),
                )),
              ),
              child: Row(
                children: [
                  InkWell(
                    child: Container(
                      width: 150,
                      height: 53,
                      decoration: BoxDecoration(
                          color: Color(0xFF27405E),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10))),
                      child: Center(
                        child: Text(
                          S.of(context).dialogConfirm,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    onTap: () {
                      EasyLoading.show(status: S.of(context).pleaseWait);
                      downloadFile(widget.url).whenComplete(() async {
                        await EasyLoading.dismiss();
                        Navigator.of(context).pop();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Color(0x0FF27405E),
                            content: Text(S.of(context).downloaded),
                            action: SnackBarAction(
                              label: 'OK',
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            )));
                      }).onError((error, stackTrace) {
                        EasyLoading.dismiss();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Error"),
                            action: SnackBarAction(
                              label: 'OK',
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            )));
                      });
                    },
                  ),
                  InkWell(
                    child: Container(
                        width: 150,
                        height: 53,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10))),
                        child: Center(
                          child: Text(
                            S.of(context).dialogCancel,
                            style: TextStyle(
                                color: Color(0xFF27405E),
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        )),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future downloadFile(var imageUrl) async {
    try {
      Dio dio = Dio();

      String fileName = imageUrl.substring(imageUrl.lastIndexOf("/") + 1);
      print(imageUrl);
      savePath = await getFilePath(fileName);
      await dio.download(imageUrl, savePath, onReceiveProgress: (rec, total) {
        setState(() {
          downloading = true;
          // download = (rec / total) * 100;
          downloadingStr = "Downloading Image : $rec";
        });
      });
      setState(() {
        downloading = false;
        downloadingStr = "Completed";
        print(downloadingStr);
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future<String> getFilePath(uniqueFileName) async {
    String path = '';

    Directory dir = await getApplicationDocumentsDirectory();

    path = '${dir.path}/$uniqueFileName';

    return path;
  }
}
// Future<String> downloadFile(String url, String fileName, String dir) async {
//   HttpClient httpClient = new HttpClient();
//   File file;
//   String filePath = '';
//   String myUrl = '';
//
//   try {
//     myUrl = url + '/' + fileName;
//     var request = await httpClient.getUrl(Uri.parse(myUrl));
//     var response = await request.close();
//     if (response.statusCode == 200) {
//       print("${response.statusCode} h");
//       var bytes = await consolidateHttpClientResponseBytes(response);
//       filePath = '$dir/$fileName';
//       file = File(filePath);
//       print(file);
//       await file.writeAsBytes(bytes).whenComplete(() => print("done"));
//     } else
//       print("${response.statusCode} h");
//     filePath = 'Error code: ' + response.statusCode.toString();
//   } catch (ex) {
//     filePath = 'Can not fetch url';
//   }
//   return filePath;
// }
