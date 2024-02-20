import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocardo/core/service/config/config_service.dart';
import 'package:vocardo/feature/study_set/provider/study_set_list_provider.dart';
import 'package:vocardo/core/widget/app_version_widget.dart';
import 'package:vocardo/feature/config/config.dart';
import 'package:vocardo/feature/study_set/edit_study_set.dart';
import 'package:vocardo/feature/study_set/study_set_list.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vocardo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.system,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const MyDrawer(),
        appBar: AppBar(
          title: Consumer(
            builder: (context, ref, child) {
              final studySets = ref.watch(studySetListProvider);
              const empty = Text("Welcome to Vocardo");
              return studySets.when(
                  data: (sets) =>
                      sets.isEmpty ? empty : const Text("Start learning!"),
                  error: (error, stackTrace) =>
                      Text("failed to load data: $error"),
                  loading: () => const CircularProgressIndicator());
            },
          ),
        ),
        body: const StudySetListPage(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const EditStudySet(),
            ));
          },
          tooltip: 'Add Set',
          child: const Icon(Icons.add),
        ));
  }
}

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
