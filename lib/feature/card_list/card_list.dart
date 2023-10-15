import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocardo/core/service/card/card_list_provider.dart';
import 'package:vocardo/core/service/card/practice_card_list_provider.dart';
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
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
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
    final cardsRef = ref.watch(cardListProvider);
    final noCard =
        cardsRef.valueOrNull == null || cardsRef.valueOrNull!.isEmpty;

    return Scaffold(
      drawer: Drawer(
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
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ImportPage()));
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Consumer(
          builder: (context, ref, child) {
            final cardsRef = ref.watch(cardListProvider);
            const noCards = Text("No cards yet!");
            return cardsRef.when(
                data: (cards) =>
                    cards.isNotEmpty ? Text("${cards.length} cards") : noCards,
                error: (_, __) => noCards,
                loading: () => const CircularProgressIndicator());
          },
        ),
      ),
      body: cardsRef.when(
        data: (cards) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          EditPage(initialItem: cards[index])));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 8,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: const Icon(Icons.circle),
                          title: Text(cards[index].question),
                          titleTextStyle: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                          subtitle: Text(cards[index].answer),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () async {
                                final yes = await showOkCancelDialog(context,
                                    title: "Delete", content: "Are you sure?");
                                if (!yes) return;

                                await ref
                                    .read(cardListProvider.notifier)
                                    .deleteCard(cards[index]);
                              },
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            itemCount: cards.length,
          );
        },
        error: (_, __) {
          return const Text("Error");
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                heroTag: "add",
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const EditPage()));
                },
                tooltip: 'Add a new word',
                child: const Icon(Icons.add),
              ),
              const SizedBox(width: 8),
              FloatingActionButton(
                heroTag: "practice",
                onPressed: noCard
                    ? null
                    : () {
                        ref.read(practiceCardListProvider.notifier).init();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const PracticePage()));
                      },
                disabledElevation: noCard ? 0 : 6,
                foregroundColor: noCard ? Colors.grey : null,
                tooltip: 'Practice',
                child: const Icon(Icons.play_arrow),
              ),
            ]),
      ),
    );
  }
}
