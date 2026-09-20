import 'package:flutter/material.dart';

class AutoModel {
  const AutoModel({
    this.id = 0,
    this.name = '',
    this.other = '',
    this.subName = '',
    this.subOther = '',
    this.extra = '',
    this.subExtra = '',
    this.leading = const SizedBox(width: 0.0),
    this.image = AutoModelImage.empty,
  });

  //!
  final int id;
  final String name;
  final String subName;
  final String other;
  final String subOther;
  final String extra;
  final String subExtra;
  final Widget leading;
  final AutoModelImage image;

  static AutoModel empty = const AutoModel();

  void toPrintStmt() {
    debugPrint(
      'AutoModel(id: $id, name: $name, subName: $subName, other: $other, subOther: $subOther, extra: $extra, subExtra: $subExtra, leading: $leading, image: $image)',
    );
  }
}

class AutoModelImage {
  const AutoModelImage({required this.image});
  final String image;
  static const empty = AutoModelImage(image: '');
}
