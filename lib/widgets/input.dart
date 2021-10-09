import 'package:flutter/material.dart';
import '../constants/Theme.dart';

class Input extends StatelessWidget {
  final String placeholder;
  final Widget suffixIcon;
  final Widget prefixIcon;
  final VoidCallback onTap;
  //final Function(String? text)? validator;
  final void Function(String text) onChanged;
  final TextEditingController controller;
  final bool autofocus;
  final Color borderColor;

  Input({this.placeholder,
    this.suffixIcon,
    this.prefixIcon,
    this.onTap,
    this.onChanged,
    //this.validator,
    this.autofocus = false,
    this.borderColor = ArgonColors.border,
    this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        cursorHeight: 23,
        onTap: onTap,
        onChanged: onChanged,
        controller: controller,
        //validator: validator!,
        autofocus: autofocus,
        cursorColor: Color(0xFFC41A38),
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 1),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
            ),
            contentPadding: EdgeInsets.only(left: 10),
            fillColor: Color(0xFFFBE0E6),
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 1),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
            ),
            hintText: placeholder,
            hintStyle: TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.black26,
            )
        ),
      ),
    );
  }
}

class Search extends StatelessWidget {
  final String placeholder;
  final Widget suffixIcon;
  final Widget prefixIcon;
  final VoidCallback onTap;
  final void Function(String text) onChanged;
  final TextEditingController controller;
  final bool autofocus;
  final Color borderColor;
  final bool filled;
  final Color fillColor;
  final Color textColor;
  final Color enabledBorderColor;
  final Color focusedBorderColor;
  final bool outlineBorder;
  final Color cursorColor;
  final Color hintTextColor;

  Search(
      { this.placeholder,
        this.suffixIcon,
        this.prefixIcon,
        this.onTap,
        this.filled,
        this.fillColor,
        this.textColor = Colors.black,
        this.enabledBorderColor = MaterialColors.muted,
        this.focusedBorderColor = MaterialColors.primary,
        this.cursorColor = MaterialColors.muted,
        this.hintTextColor = MaterialColors.muted,
        this.onChanged,
        this.outlineBorder = false,
        this.autofocus = false,
        this.borderColor = MaterialColors.border,
        this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width / 1.2,
      height: 50,
      padding: EdgeInsets.only(
        top: 3,
        left: 16,
        right: 5,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ArgonColors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black12, blurRadius: 5
            ),
          ]
      ),
      child: TextFormField(
        onTap: onTap,
        onChanged: onChanged,
        controller: controller,
        autofocus: autofocus,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            border: InputBorder.none,
            suffixIcon: suffixIcon,
            hintText: placeholder,
            hintStyle: TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.black26
            )
        ),
      ),
    );
  }
}