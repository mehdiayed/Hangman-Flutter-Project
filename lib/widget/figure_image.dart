import 'package:flutter/cupertino.dart';

Widget figureImage(bool visibile, String path) {
  return Visibility(
    visible: visibile,
    child: Container(
      width: 250,
      height: 250,
      child: Image.asset(path),
    ),
  );
}
