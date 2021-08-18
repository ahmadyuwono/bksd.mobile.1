import 'package:flutter/material.dart';
import 'package:muba/generated/l10n.dart';

class CustomAlert extends StatefulWidget {
  final String title;
  const CustomAlert({Key? key, required this.title}) : super(key: key);

  @override
  _CustomAlertState createState() => _CustomAlertState();
}

class _CustomAlertState extends State<CustomAlert> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0xFF27405E),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: Container(
          child: Text(
        widget.title,
        style: TextStyle(color: Colors.white),
      )),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.close,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
