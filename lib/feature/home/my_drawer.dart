import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocardo/core/service/config/config_service.dart';
import 'package:vocardo/core/widget/app_version_widget.dart';
import 'package:vocardo/feature/config/config.dart';

class MyDrawer extends ConsumerWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = TextStyle(
      fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize ?? 24.0,
      color: Theme.of(context).colorScheme.onPrimary,
    );

    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Vocardo',
                  style: TextStyle(
                    fontSize:
                        Theme.of(context).textTheme.headlineLarge?.fontSize ??
                            24.0,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'v.',
                      style: textStyle,
                    ),
                    AppVersion(
                      style: textStyle,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              ref.watch(configServiceProvider).when(data: (config) {
                return ListTile(
                  title: const Text('Settings'),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ConfigPage(config: config),
                    ));
                  },
                );
              }, error: (_, __) {
                return const SizedBox.shrink();
              }, loading: () {
                return const SizedBox.shrink();
              }),
            ],
          )
        ],
      ),
    );
  }
}
