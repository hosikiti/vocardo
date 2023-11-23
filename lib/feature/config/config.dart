import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocardo/core/model/config.dart';
import 'package:vocardo/core/service/config/config_service.dart';

class ConfigPage extends ConsumerStatefulWidget {
  final Config config;

  const ConfigPage({
    Key? key,
    required this.config,
  }) : super(key: key);
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ConfigPageState();
}

class _ConfigPageState extends ConsumerState<ConfigPage> {
  late Config config;

  @override
  void initState() {
    config = widget.config.copyWith();
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
          title: const Text("Show an answer randomly"),
          trailing: Switch.adaptive(
              value: config.showAnswerRandomly,
              onChanged: (value) {
                setState(() {
                  config.showAnswerRandomly = value;
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
