import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocardo/core/model/study_set.dart';
import 'package:vocardo/core/service/card/card_list_provider.dart';
import 'package:vocardo/core/service/card/practice_card_list_provider.dart';
import 'package:vocardo/core/service/study_set/study_set_list_provider.dart';
import 'package:vocardo/core/widget/dialog_widget.dart';
import 'package:vocardo/feature/edit/edit.dart';
import 'package:vocardo/feature/import/import.dart';
import 'package:vocardo/feature/practice/practice.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vocardo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
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
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Consumer(
          builder: (context, ref, child) {
            final studySets = ref.watch(studySetListProvider);
            const empty = Text("Welcome to Vocardo");
            return studySets.when(
                data: (sets) => sets.isEmpty ? empty : Text("${sets.length}"),
                error: (error, stackTrace) =>
                    Text("failed to load data: $error"),
                loading: () => const CircularProgressIndicator());
          },
        ),
      ),
      body: const _Home(),
    );
  }
}

class _Home extends ConsumerWidget {
  const _Home();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(studySetListProvider);

    return data.when(data: (sets) {
      if (sets.isEmpty) {
        return Center(
          child: ElevatedButton.icon(
            onPressed: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) {
                    return const _AddStudySetDialog();
                  });
            },
            label: const Text("CREATE A NEW SET"),
            icon: const Icon(Icons.add),
          ),
        );
      }

      return ListView.builder(
        itemBuilder: (context, index) {
          final set = sets[index];
          return ListTile(
            title: Text(set.name),
            onTap: () {},
          );
        },
        itemCount: sets.length,
      );
    }, error: (error, stackTrace) {
      return Center(
        child: Text("failed to load data: $error"),
      );
    }, loading: () {
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}

class _AddStudySetDialog extends ConsumerStatefulWidget {
  const _AddStudySetDialog();

  @override
  ConsumerState<_AddStudySetDialog> createState() => _AddStudySetDialogState();
}

class _AddStudySetDialogState extends ConsumerState<_AddStudySetDialog> {
  final TextEditingController _setName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text("Create a new set"),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _setName,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Set name',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                final studySets = ref.read(studySetListProvider.notifier);
                final set = StudySet()..name = _setName.text;
                studySets.addStudySet(set);
                Navigator.of(context).pop();
              },
              child: const Text("Create"),
            ),
          )
        ],
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.inversePrimary),
            child: const Text(
              'Vocardo',
              style: TextStyle(
                // color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: const Text("Import Data"),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const ImportPage()));
            },
          ),
        ],
      ),
    );
  }
}
