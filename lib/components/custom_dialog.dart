import 'package:flutter/material.dart';
import 'package:muba/generated/l10n.dart';

class CustomDialog extends StatefulWidget {
  final String unduhFile;
  final String title;
  const CustomDialog({Key? key, required this.unduhFile, required this.title})
      : super(key: key);

  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
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
                    onTap: () {},
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
