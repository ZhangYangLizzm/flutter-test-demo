import 'package:flutter/material.dart';
import 'package:flutter_test_demo/data/data.dart';
import 'package:flutter_test_demo/main.dart';
import 'package:flutter_test_demo/page/detail.dart';
import 'package:provider/provider.dart';

import 'cache.dart';

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
  final ScrollController _controller = ScrollController();

  // 初始化State
  @override
  void initState() {
    super.initState();
    _controller.addListener(_onScroll);
  }

  void _onScroll() {
    if (_controller.position.pixels == _controller.position.maxScrollExtent) {
      _loadMoreData();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _loadMoreData() {
    final appState = context.read<AppState>();
    appState.loadMore();
  }
  // void _loadMoreData() {
  //   setState(() {
  //     var appState = Provider.of<AppState>(context, listen: false);
  //     appState.loadMore();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(builder: (context, appState, child) {
      List<Widget> cardItemList = [];
      List<Widget> temp = [];
      for (int index = 1; index <= appState.cardItemList.length; index++) {
        DataModel current = appState.cardItemList[index - 1];
        if (index % 3 != 0) {
          temp.add(Expanded(
              flex: 1,
              child: CardItem(
                  descriptionDirection: 'horizontal',
                  title: current.name,
                  imageSrc: current.url,
                  price: current.price,
                  mealType: current.mealType,
                  cardId: current.id,
                  isCollect: current.isCollect)));
        } else {
          cardItemList.add(Row(
            children: temp,
          ));
          temp = [];
          cardItemList.add(CardItem(
              cardId: current.id,
              title: current.name,
              imageSrc: current.url,
              descriptionDirection: 'vertical',
              price: current.price,
              mealType: current.mealType,
              isCollect: current.isCollect));
        }
      }
      if (temp.isNotEmpty) {
        cardItemList.add(Row(
          children: temp,
        ));
      }
      return ListView(
        controller: _controller,
        // shrinkWrap: true, // 该属性表示是否根据子组件的总长度来设置ListView的长度，默认值为false
        scrollDirection: Axis.vertical,
        children: cardItemList,
      );
    });
  }
}

class CardItem extends StatefulWidget {
  final String title;
  final String imageSrc;
  final double price;
  final int cardId;
  final String descriptionDirection;
  final String mealType;
  final bool isCollect;
  const CardItem(
      {super.key,
      required this.title,
      required this.imageSrc,
      required this.descriptionDirection,
      required this.price,
      required this.mealType,
      required this.cardId,
      required this.isCollect});
  @override
  State<CardItem> createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  bool? localCollectState;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getCollectState();
  }

  void getCollectState() {
    setState(() {
      localCollectState = AppCache.getCollectState(widget.cardId);
    });
  }

  @override
  Widget build(BuildContext context) {
    Flex appState;
    if (widget.descriptionDirection == 'horizontal') {
      appState = Column(children: [
        SizedBox(
          height: 100,
          child: Image.network(
            widget.imageSrc,
            fit: BoxFit.fitWidth,
          ),
        ),
        CardDescription(
            title: widget.title,
            price: widget.price,
            mealType: widget.mealType,
            isCollect: localCollectState ?? widget.isCollect)
      ]);
    } else {
      appState = Row(children: [
        SizedBox(
          width: 215,
          height: 100,
          child: Image.network(
            widget.imageSrc,
            fit: BoxFit.cover,
          ),
        ),
        CardDescription(
            title: widget.title,
            price: widget.price,
            mealType: widget.mealType,
            isCollect: localCollectState ?? widget.isCollect)
      ]);
    }
    return InkWell(
      child: Card(child: appState),
      onTap: () => {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Detail(
              cardId: widget.cardId,
              imageSrc: widget.imageSrc,
              price: widget.price,
              name: widget.title,
            ),
          ),
        )
      },
    );
  }
}

class CardDescription extends StatelessWidget {
  final String title;
  final double price;
  final String mealType;
  final bool isCollect;
  const CardDescription({
    super.key,
    required this.title,
    required this.price,
    required this.mealType,
    required this.isCollect,
  });
  @override
  Widget build(BuildContext context) {
    String collectText = '收藏至礼品库';
    if (isCollect) {
      collectText = '已收藏';
    }
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
          children: [
            MealTypeButton(title: '当日午餐', isSelected: mealType == '当日午餐'),
            const SizedBox(width: 10),
            MealTypeButton(title: '次日午餐', isSelected: mealType == '次日午餐'),
            const SizedBox(width: 10),
            MealTypeButton(title: '次日晚餐', isSelected: mealType == '次日晚餐'),
          ],
        ),
        Text(collectText),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(onPressed: () {}, child: const Text('用礼金兑换')),
            ElevatedButton(onPressed: () {}, child: const Text('送给TA')),
          ],
        )
      ],
    );
  }
}

class MealTypeButton extends StatelessWidget {
  final String title;
  final bool isSelected;

  const MealTypeButton({
    Key? key,
    required this.title,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(128, 158, 158, 158),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.pink : Colors.white,
        ),
      ),
    );
  }
}
