import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Toast extends StatelessWidget{
  String text;
  String status;
  FToast fToast;
  Toast({ this.text, this.status});


  @override
  Widget build(BuildContext context) {
   return Container(
     padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
     decoration: BoxDecoration(
       borderRadius: BorderRadius.circular(25.0),
       color: (status=="succsess" )? (Colors.greenAccent) : (Colors.red),
     ),
     child: Row(
       mainAxisSize: MainAxisSize.min,
       children: [
         Icon(Icons.check),
         SizedBox(
           width: 12.0,
         ),
         Text(text),
       ],
     ),
   );
  }

}