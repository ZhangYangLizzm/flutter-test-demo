import 'package:flutter/material.dart';
import 'package:flutter_test_demo/card_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_test_demo/topmenu.dart';
import 'cache.dart';
import 'data/data.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppCache.init();
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
            primaryColor: Colors.blue,
            textTheme: const TextTheme(
              labelLarge: TextStyle(color: Colors.white),
            ),
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
                .copyWith(secondary: Colors.blueAccent),
          ),
          home: const HomePage(),
        ));
  }
}

class AppState extends ChangeNotifier {
  List<DataModel> cardItemList = CardItemList().cardItemList;

  void toggleFavorite(int cardId) {
    final index = cardItemList.indexWhere((element) => element.id == cardId);
    if (index != -1) {
      final item = cardItemList[index];
      item.setIsCollect(!item.isCollect);
      notifyListeners();
    }
  }

  IconData getIcon(int cardId) {
    final index = cardItemList.indexWhere((element) => element.id == cardId);
    if (index != -1) {
      final item = cardItemList[index];
      if (item.isCollect) {
        return Icons.favorite;
      } else {
        return Icons.favorite_border;
      }
    }
    return Icons.favorite_border;
  }

  loadMore() {
    final newList = List<DataModel>.from(cardItemList);
    newList.addAll(cardItemList);
    cardItemList = newList;
    notifyListeners();
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Demo'),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            // TODO: 添加菜单点击事件
          },
        ),
      ),
      body: Container(
        color: Colors.grey[100],
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                height: 50,
                child: const TopMenu(),
              ),
            ),
            const Flexible(
              flex: 9,
              child: RefreshListView(),
            ),
          ],
        ),
      ),
    );
  }
}
