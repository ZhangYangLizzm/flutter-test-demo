import 'package:flutter/material.dart';
import 'package:flutter_test_demo/data/data.dart';
import 'package:flutter_test_demo/main.dart';
import 'package:flutter_test_demo/page/detail.dart';
import 'package:provider/provider.dart';

class RefreshListView extends StatelessWidget {
  const RefreshListView({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: () async {
          // Replace this delay with the code to be executed during refresh
          // and return a Future when code finishs execution.
          return Future<void>.delayed(const Duration(seconds: 3));
        },
        notificationPredicate: defaultScrollNotificationPredicate,
        child: const BigCard());
  }
}

class BigCard extends StatefulWidget {
  const BigCard({super.key});

  @override
  State<BigCard> createState() => _BigCardState();
}

class _BigCardState extends State<BigCard> {
  num itemCount = 10;
  final ScrollController _controller = ScrollController();
  @override
  // 初始化State
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        // _loadMoreData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // var appState = context.watch<AppState>();

    return Consumer<AppState>(builder: (context, item, child) {
      List<CardItem> cardItemList = [];
      for (int i = 1; i <= item.cardItemList.length; i++) {
        DataModel current = item.cardItemList[i - 1];

        cardItemList.add(CardItem(
          title: current.name,
          imageSrc: current.url,
          descriptionDirection: 'vertical',
          price: current.price,
        ));
      }
      return ListView(
        controller: ScrollController(),
        shrinkWrap: true, // 该属性表示是否根据子组件的总长度来设置ListView的长度，默认值为false
        scrollDirection: Axis.vertical,
        children: cardItemList,
      );
    });
  }
}

class CardItem extends StatelessWidget {
  final String title;
  final String imageSrc;
  final double price;
  final int id = 1;
  final String descriptionDirection;
  const CardItem(
      {super.key,
      required this.title,
      required this.imageSrc,
      required this.descriptionDirection,
      required this.price});

  @override
  Widget build(BuildContext context) {
    Flex item;
    if (descriptionDirection == 'horizontal') {
      item = Column(children: [
        SizedBox(
          width: 195,
          height: 100,
          child: Image.network(
            imageSrc,
            fit: BoxFit.cover,
          ),
        ),
        CardDescription(title: title, price: price)
      ]);
    } else {
      item = Row(mainAxisSize: MainAxisSize.min, children: [
        SizedBox(
          width: 223,
          height: 100,
          child: Image.network(
            imageSrc,
            fit: BoxFit.fitWidth,
          ),
        ),
        CardDescription(title: title, price: price)
      ]);
    }
    return InkWell(
      child: Card(child: item),
      onTap: () => {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Detail(
                cardId: id, imageSrc: imageSrc, price: price, name: title),
          ),
        )
      },
    );
  }
}

class CardDescription extends StatelessWidget {
  final String title;
  final double price;
  const CardDescription({super.key, required this.title, required this.price});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(title),
            Text(
              '  ￥$price',
              style: const TextStyle(color: Colors.red),
            ),
          ],
        ),
        Row(
          children: const [
            Text('当日午餐'),
            Text('次日午餐'),
            Text('次日晚餐'),
          ],
        ),
        const Text('收藏至礼品库'),
        Row(
          children: [
            ElevatedButton(onPressed: () {}, child: const Text('用礼金兑换')),
            ElevatedButton(onPressed: () {}, child: const Text('送给TA')),
          ],
        )
      ],
    );
  }
}



// Consumer<AppState>(builder: (context, item, child) {
//           List<CardItem> cardItemList = [];
//           for (int i = 1; i <= item.cardItemList.length; i++) {
//             DataModel current = item.cardItemList[i - 1];

//             cardItemList.add(CardItem(
//               title: current.name,
//               imageSrc: current.url,
//               descriptionDirection: 'vertical',
//               price: current.price,
//             ));
//           }
//           return cardItemList;
//         })