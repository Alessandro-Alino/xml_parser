import 'package:flutter/material.dart';

enum Method {
  GET(color: Color.fromRGBO(69, 156, 103, 1.0)),
  POST(color: Color.fromRGBO(174, 124, 9,1.0)),
  PUT(color: Color.fromRGBO(55, 120, 198,1.0)),
  PATCH(color: Color.fromRGBO(145, 111, 183,1.0)),
  DELETE(color: Color.fromRGBO(165, 66, 57,1.0)),
  OPTIONS(color: Color.fromRGBO(172, 52, 122,1.0)),
  HEAD(color: Color.fromRGBO(31, 141, 73,1.0)),
  TRACE(color: Color.fromRGBO(118, 180, 234,1.0)),
  CONNECT(color: Color.fromRGBO(174, 147, 197,1.0));

  const Method({required this.color});

  final Color color;
}

class XMLModel {
  final String? api;
  final Method? method;

  XMLModel({
    required this.api,
    required this.method,
  });

  // CopyWith method
  XMLModel copyWith({
    String? api,
    Method? method,
  }) =>
      XMLModel(
        api: api ?? this.api,
        method: method ?? this.method,
      );
}
