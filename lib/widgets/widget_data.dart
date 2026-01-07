import 'package:flutter/material.dart';

class WidgetData {
  final String title;
  final Widget widget;
  final String sourceCode;
  final String docUrl;
  final String? description;

  const WidgetData({
    required this.title,
    required this.widget,
    required this.sourceCode,
    required this.docUrl,
    this.description,
  });
}
