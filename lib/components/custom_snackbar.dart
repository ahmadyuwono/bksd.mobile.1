import 'package:flutter/material.dart';
import 'package:muba/generated/l10n.dart';

class CustomSnackBar extends StatelessWidget {
  const CustomSnackBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SnackBar(
        content: Text(S.of(context).passChanged),
        action: SnackBarAction(
          label: 'OK',
          onPressed: () {
            Navigator.pop(context);
          },
        ));
  }
}
