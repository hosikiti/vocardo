import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppVersion extends ConsumerWidget {
  final TextStyle? style;

  const AppVersion({Key? key, this.style}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
      future: PackageInfo.fromPlatform(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final packageInfo = snapshot.data as PackageInfo;
          return Text(packageInfo.version, style: style);
        } else {
          return const Text("-");
        }
      },
    );
  }
}
