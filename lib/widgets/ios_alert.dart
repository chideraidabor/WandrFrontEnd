import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future iosAlert({
  BuildContext context,
  String content,
  Function action,
}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) => CupertinoAlertDialog(
      content: new Text(
        content,
        style: TextStyle(fontFamily: 'Poppins'),
      ),
      actions: action == null
          ? <Widget>[
              FlatButton(
                child: Text(
                  action == null ? "ok" : "Yes",
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ]
          : <Widget>[
              FlatButton(
                child: Text(
                  "No",
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text(
                  action == null ? "ok" : "Yes",
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  action();
                },
              ),
            ],
    ),
  );
}
