import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_test_demo/card_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_test_demo/top.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data/data.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => AppState(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const HomePage(),
        ));
  }
}

class AppState extends ChangeNotifier {
  List<DataModel> cardItemList = CardItemList().getCardItemList();

  void toggleFavorite(int cardId) {
    var index = cardItemList.indexWhere((element) => element.id == cardId);
    var item = cardItemList[index];
    item.setIsCollect(!item.isCollect);
    notifyListeners();
  }

  IconData getIcon(int cardId) {
    var index = cardItemList.indexWhere((element) => element.id == cardId);
    var item = cardItemList[index];
    IconData icon;
    if (item.isCollect) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }
    return icon;
  }

  UnmodifiableListView<DataModel> get itemlist =>
      UnmodifiableListView(cardItemList);
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
            SafeArea(
                child: SizedBox(
              height: 50,
              child: TopMenu(),
            )),
            // RefreshListView(),
            Expanded(child: RefreshListView())
          ],
        ));
  }
}
