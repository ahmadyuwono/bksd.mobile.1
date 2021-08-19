import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:muba/generated/l10n.dart';
import 'package:muba/services/download_service.dart';
import 'package:open_file/open_file.dart';

class CustomDialog extends StatefulWidget {
  final String unduhFile;
  final String title;
  final String url;
  final String fileName;
  const CustomDialog(
      {Key? key,
      required this.unduhFile,
      required this.title,
      required this.url,
      required this.fileName})
      : super(key: key);

  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  String statusMessage = "";
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

  Future _onSelectNotification(String? json) async {
    final obj = jsonDecode(json!);

    if (obj['isSuccess']) {
      OpenFile.open(obj['filePath']);
    } else {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Error'),
          content: Text('${obj['error']}'),
        ),
      );
    }
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
                    onTap: () async {
                      EasyLoading.show(status: S.of(context).pleaseWait);
                      await DownloadService().requestPermissions();
                      DownloadService()
                          .download(widget.fileName, widget.url)
                          .then((value) {
                        statusMessage = value;
                      }).whenComplete(() {
                        EasyLoading.dismiss();
                        if (statusMessage == "OK")
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
                            backgroundColor: Color(0x0FF27405E),
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
}
