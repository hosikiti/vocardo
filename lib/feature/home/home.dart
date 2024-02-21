import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocardo/feature/home/my_drawer.dart';
import 'package:vocardo/feature/study_set/provider/study_set_list_provider.dart';
import 'package:vocardo/feature/study_set/edit_study_set.dart';
import 'package:vocardo/feature/study_set/study_set_list.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

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
      home: const MyHome(),
    );
  }
}

class MyHome extends ConsumerWidget {
  const MyHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        floatingActionButton: const MyFab());
  }
}

class MyFab extends StatelessWidget {
  const MyFab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const EditStudySet(),
        ));
      },
      tooltip: 'Add Set',
      child: const Icon(Icons.add),
    );
  }
}
