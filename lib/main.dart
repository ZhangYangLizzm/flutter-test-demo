import 'package:flutter/material.dart';
import 'package:flutter_test_demo/card_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_test_demo/top.dart';

import 'data/data.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class AppState extends ChangeNotifier {
  // WordPair current = WordPair.random();

  // List<WordPair> favorites = <WordPair>[];

  // void toggleFavorite() {
  //   if (favorites.contains(current)) {
  //     favorites.remove(current);
  //   } else {
  //     favorites.add(current);
  //   }
  //   notifyListeners();
  // }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Test Demo')),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SizedBox(
              height: 50,
              child: TopMenu(),
            ),
            // BigCard(),
            RefreshListView(),
          ],
        ));
  }
}
