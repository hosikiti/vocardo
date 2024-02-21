import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocardo/feature/home/home.dart';

void main() async {
  runApp(const ProviderScope(child: Home()));
}
