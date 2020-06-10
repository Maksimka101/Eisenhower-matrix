import 'package:eisenhower_matrix/models/models.dart';
import 'package:flutter/material.dart';

Color getCeilColor(CeilType type) {
  switch (type) {
    case CeilType.UrgentImportant:
      return Colors.red[100];
    case CeilType.UrgentNotImportant:
      return Colors.blue[100];
    case CeilType.NotUrgentImportant:
      return Colors.green[100];
    case CeilType.NotUrgentNotImportant:
      return Colors.grey[200];
  }
  throw Exception('Unknown ceil type');
}

Color getCeilTitleColor(CeilType type) {
  switch (type) {
    case CeilType.UrgentImportant:
      return Colors.redAccent[200];
    case CeilType.UrgentNotImportant:
      return Colors.blue[300];
    case CeilType.NotUrgentImportant:
      return Colors.green[300];
    case CeilType.NotUrgentNotImportant:
      return Colors.grey[400];
  }
  throw Exception('Unknown ceil type');
}
