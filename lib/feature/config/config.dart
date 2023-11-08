import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocardo/core/model/config.dart';
import 'package:vocardo/core/service/config/config_service.dart';

class ConfigPage extends ConsumerStatefulWidget {
  const ConfigPage({Key? key}) : super(key: key);
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ConfigPageState();
}

class _ConfigPageState extends ConsumerState<ConfigPage> {
  late bool showAnswerRandomly;

  @override
  void initState() {
    final config = ref.read(configServiceProvider).valueOrNull ?? defaultConfig;
    showAnswerRandomly = config.showAnswerRandomly;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: ListView(children: [
        ListTile(
          title: const Text("Show the answer randomly"),
          trailing: Switch.adaptive(
              value: showAnswerRandomly,
              onChanged: (value) {
                setState(() {
                  showAnswerRandomly = value;
                });
              }),
        ),
      ]),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Expanded(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel")),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: FilledButton(
                onPressed: () async {
                  final config = ref.read(configServiceProvider).valueOrNull ??
                      defaultConfig;
                  config.showAnswerRandomly = showAnswerRandomly;
                  await ref
                      .read(configServiceProvider.notifier)
                      .saveConfig(config);
                  if (!mounted) {
                    return;
                  }
                  Navigator.pop(context);
                },
                child: const Text("Save")),
          )
        ]),
      ),
    );
  }
}
