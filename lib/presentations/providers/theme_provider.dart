import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

// a simple boolean provider to toggle between light and dark mode
final isDarkmodeProvider = StateProvider<bool>((ref) => false);

// Colors list inmutable
final colorListProvider = Provider((ref) => colorList);

// a simple int
final selectedColorProvider = StateProvider<int>((ref) => 3);