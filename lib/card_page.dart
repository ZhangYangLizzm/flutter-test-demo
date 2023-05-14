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
                cardItemData: current,
              )));
        } else {
          cardItemList.add(Row(
            children: temp,
          ));
          temp = [];
          cardItemList.add(Expanded(
            flex: 1,
            child: CardItem(
              cardItemData: current,
              descriptionDirection: 'vertical',
            ),
          ));
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
  final String descriptionDirection;
  final DataModel cardItemData;
  const CardItem(
      {super.key,
      required this.cardItemData,
      required this.descriptionDirection});
  @override
  State<CardItem> createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  late bool localCollectState;
  @override
  void initState() {
    super.initState();
    localCollectState = widget.cardItemData.isCollect;
    getCollectState();
  }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   getCollectState();
  // }

  void getCollectState() async {
    final value = await AppCache.getCollectState(widget.cardItemData.id);
    if (value != null) {
      setState(() {
        localCollectState = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Flex newWidet;
    if (widget.descriptionDirection == 'horizontal') {
      newWidet = Column(children: [
        SizedBox(
          height: 100,
          child: Image.network(
            widget.cardItemData.url,
            fit: BoxFit.fitWidth,
          ),
        ),
        CardDescription(
            cardItemData: widget.cardItemData, isCollect: localCollectState)
      ]);
    } else {
      newWidet = Row(children: [
        Expanded(
          flex: 1,
          child: SizedBox(
            height: 100,
            child: Image.network(
              widget.cardItemData.url,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        CardDescription(
            cardItemData: widget.cardItemData, isCollect: localCollectState)
      ]);
    }
    return InkWell(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: newWidet,
        ),
      ),
      onTap: () => {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Detail(
              cardId: widget.cardItemData.id,
              imageSrc: widget.cardItemData.url,
              price: widget.cardItemData.price,
              name: widget.cardItemData.name,
            ),
          ),
        )
      },
    );
  }
}

class CardDescription extends StatelessWidget {
  final DataModel cardItemData;
  final bool isCollect;
  const CardDescription({
    super.key,
    required this.cardItemData,
    required this.isCollect,
  });

  @override
  Widget build(BuildContext context) {
    final title = cardItemData.name;
    final price = cardItemData.price;
    final mealType = cardItemData.mealType;
    String collectText = '收藏至礼品库';
    if (isCollect) {
      collectText = '已收藏';
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title),
            const SizedBox(width: 8),
            Text(
              '￥$price',
              style: const TextStyle(color: Colors.red),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MealTypeButton(title: '当日午餐', isSelected: mealType == '当日午餐'),
            MealTypeButton(title: '次日午餐', isSelected: mealType == '次日午餐'),
            MealTypeButton(title: '次日晚餐', isSelected: mealType == '次日晚餐'),
          ],
        ),
        Text(collectText),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: const Text('用礼金兑换')),
            const SizedBox(width: 8),
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
      decoration: BoxDecoration(
        color: isSelected
            ? Theme.of(context).colorScheme.secondary
            : Theme.of(context).primaryColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.labelLarge,
      ),
    );
  }
}
