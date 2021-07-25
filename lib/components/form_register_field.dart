import 'package:flutter/material.dart';

class FieldFormReg extends StatelessWidget {
  final String hintForm;
  final bool isPassword;
  const FieldFormReg({
    Key? key,
    required this.hintForm,
    required this.isPassword,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: TextFormField(
          decoration: InputDecoration(
            suffixIcon: isPassword == true
                ? Icon(
                    Icons.check,
                    color: Colors.green,
                  )
                : null,
            hintText: hintForm,
            hintStyle: TextStyle(fontSize: 24),
            contentPadding: const EdgeInsets.only(left: 20),
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ),
    );
  }
}
