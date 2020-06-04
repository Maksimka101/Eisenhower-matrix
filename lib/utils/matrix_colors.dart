import 'package:eisenhower_matrix/models/models.dart';
import 'package:flutter/material.dart';

Color getCeilColor(CeilType type) {
  switch (type) {
    case CeilType.UrgentImportant:
      return Colors.red[200];
    case CeilType.UrgentNotImportant:
      return Colors.blue[200];
    case CeilType.NotUrgentImportant:
      return Colors.green[200];
    case CeilType.NotUrgentNotImportant:
      return Colors.grey[300];
  }
  throw Exception('Unknown ceil type');
}
