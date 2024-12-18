import 'package:flutter/material.dart';

Widget background() {
  return const Stack(
    children: [
      Positioned(
          top: 10,
          left: 10,
          child: Text(
            "Live Audio Room",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Color(0xff1B1B1B),
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          )),
      Positioned(
        top: 10 + 20,
        left: 10,
        child: Text(
          "ID: roomID",
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Color(0xff606060),
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      )
    ],
  );
}