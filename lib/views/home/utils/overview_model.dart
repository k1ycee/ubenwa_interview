import 'package:flutter/material.dart';

class OverviewModel {
  final String header;
  final Widget image;
  final String count;
  final Color imageBackgroundColor;
  final Color commentaryColor;
  final String commentary;
  OverviewModel({
    required this.header,
    required this.image,
    required this.count,
    required this.imageBackgroundColor,
    required this.commentaryColor,
    required this.commentary,
  });

  OverviewModel copyWith({
    String? header,
    Widget? image,
    String? count,
    Color? imageBackgroundColor,
    Color? commentaryColor,
    String? commentary,
  }) {
    return OverviewModel(
      header: header ?? this.header,
      image: image ?? this.image,
      count: count ?? this.count,
      imageBackgroundColor: imageBackgroundColor ?? this.imageBackgroundColor,
      commentaryColor: commentaryColor ?? this.commentaryColor,
      commentary: commentary ?? this.commentary,
    );
  }
}
