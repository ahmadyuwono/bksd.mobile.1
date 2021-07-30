import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final String hintForm;
  final Function(String) text;
  const PasswordField({Key? key, required this.hintForm, required this.text})
      : super(key: key);

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isHidden = true;
  TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: TextFormField(
          controller: _textEditingController,
          onChanged: (value) {
            setState(() {
              widget.text(value);
            });
          },
          obscureText: isHidden,
          decoration: InputDecoration(
            suffixIcon: InkWell(
              onTap: _showPassword,
              child: isHidden == false
                  ? Icon(
                      Icons.visibility,
                      color: Colors.grey,
                    )
                  : Icon(
                      Icons.visibility_off,
                      color: Colors.grey,
                    ),
            ),
            hintText: widget.hintForm,
            hintStyle: TextStyle(fontSize: 24),
            contentPadding: const EdgeInsets.only(left: 20, right: 20),
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ),
    );
  }

  void _showPassword() {
    setState(() {
      isHidden = !isHidden;
    });
  }
}
