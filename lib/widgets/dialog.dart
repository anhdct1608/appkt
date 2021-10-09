import 'package:flutter/material.dart';

enum DialogAction { yes, abort }

class Dialogs {
  static Future<DialogAction> yesAbortDialog(
      BuildContext context,
      String title,
      String body,
      ) async {
    final action = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Text(title),
          content: Text(body),
          actions: <Widget>[
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 20, left: 115),
                  width: 60,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red
                  ),
                  child: FlatButton(
                    onPressed: () => Navigator.of(context).pop(DialogAction.yes),
                    child: const Text(
                      'Yes',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 60,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black12
                  ),
                  child: FlatButton(
                    onPressed: () => Navigator.of(context).pop(DialogAction.abort),
                    child: const Text('No'),
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
    return (action != null) ? action : DialogAction.abort;
  }
}