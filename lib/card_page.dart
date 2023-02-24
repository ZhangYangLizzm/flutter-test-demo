import 'package:flutter/material.dart';
import 'package:flutter_test_demo/page/detail.dart';

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
    return ListView(
      controller: ScrollController(),
      shrinkWrap: true, // 该属性表示是否根据子组件的总长度来设置ListView的长度，默认值为false
      scrollDirection: Axis.vertical,
      children: <Widget>[
        Row(
          children: const [
            CardItem(
              price: 45,
              title: '牛油果鲜虾沙拉',
              imageSrc:
                  'https://bing.com/th?id=AMMS_059deac34eff2a4a54364819f2906c76',
              descriptionDirection: 'horizontal',
            ),
            CardItem(
              title: '日本和牛牛排套餐',
              imageSrc:
                  'https://th.bing.com/th/id/R.6638265c4d7687749632bbe2dd4c6824?rik=Lw7%2bcHrWnUZkEg&riu=http%3a%2f%2fimg13.360buyimg.com%2fn12%2fjfs%2ft1%2f27289%2f30%2f11938%2f355820%2f5c933588Ef00e0eaf%2f77f9c8539ab40c2a.jpg&ehk=3gvR3Fss0VCIZ048AbE5DIiQzU0tsK99nMvMABA54pM%3d&risl=&pid=ImgRaw&r=0',
              descriptionDirection: 'horizontal',
              price: 235,
            )
          ],
        ),
        const CardItem(
          title: '水蜜桃甜品',
          imageSrc:
              'https://th.bing.com/th/id/R.9717261124030c07b0e2925f62f72647?rik=Xe3LVIQpvtvt7A&riu=http%3a%2f%2f5b0988e595225.cdn.sohucs.com%2fimages%2f20190522%2fed431cc9fd3341f9b04b95287ef2b7c1.jpeg&ehk=k1rKEiSau1jDG9GuivBilvjMKzhK03zU%2fOaLbwNznD0%3d&risl=&pid=ImgRaw&r=0',
          descriptionDirection: 'vertical',
          price: 235,
        )
      ],
    );
  }
}

class CardItem extends StatelessWidget {
  final String title;
  final String imageSrc;
  final int price;
  final String id = '1';
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
  final int price;
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
