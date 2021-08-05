import 'package:flutter/material.dart';

class FieldFormReg extends StatefulWidget {
  final String hintForm;
  final bool isPassword;
  final Function(String) onFilled;
  const FieldFormReg({
    Key? key,
    required this.hintForm,
    required this.isPassword,
    required this.onFilled,
  }) : super(key: key);

  @override
  _FieldFormRegState createState() => _FieldFormRegState();
}

class _FieldFormRegState extends State<FieldFormReg> {
  TextEditingController _textEditingController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(() {});
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: TextFormField(
          keyboardType: widget.hintForm == 'NIK' ? TextInputType.number : null,
          obscureText: widget.isPassword,
          controller: _textEditingController,
          onChanged: (value) {
            setState(() {
              widget.onFilled(value);
            });
          },
          decoration: InputDecoration(
            suffixIcon: widget.isPassword == true &&
                    _textEditingController.text.length >= 8
                ? Icon(
                    Icons.check,
                    color: Colors.green,
                  )
                : null,
            hintText: widget.hintForm,
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
