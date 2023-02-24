import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_test_demo/main.dart';

class Detail extends StatelessWidget {
  final String name;
  final String imageSrc;
  final double price;
  final int cardId;

  const Detail({
    super.key,
    required this.cardId,
    required this.name,
    required this.imageSrc,
    required this.price,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('详情')),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text('当日午餐'),
                  Consumer<AppState>(builder: (context, item, child) {
                    return ElevatedButton.icon(
                      icon: Icon(item.getIcon(cardId)),
                      label: const Text('收藏'),
                      onPressed: () {
                        item.toggleFavorite(cardId);
                      },
                    );
                  })
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: Image.network(imageSrc),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('单价： ￥$price'),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text('配送范围 : 10千米'),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text('当日午餐'),
                      const Text('次日午餐'),
                      const Text('次日晚餐')
                    ],
                  ),
                ],
              ),
              SizedBox(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        '美食介绍:',
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 20, color: Colors.orange),
                      ),
                      Card(
                          child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          "精选日本仙台和牛，烧制三分熟切片，淋秘制酱汁，配以新泻县鱼沼产越光米，鲜香嫩滑回味留甘限量供应。",
                          style: TextStyle(fontSize: 16),
                        ),
                      )),
                    ]),
              ),
              SizedBox(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '产品图片:',
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 20, color: Colors.orange),
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12.0)),
                              border: Border.all(width: 3, color: Colors.black),
                            ),
                            child: Image.network(
                              imageSrc,
                              width: 100,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12.0)),
                              border: Border.all(width: 3, color: Colors.black),
                            ),
                            child: Image.network(
                              imageSrc,
                              width: 100,
                            ),
                          ),
                        ],
                      )
                    ]),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () => {Navigator.of(context).pop()},
                      child: const Text('退出')),
                  ElevatedButton(onPressed: () => {}, child: const Text('查看商家'))
                ],
              )
            ],
          ),
        ));
  }
}
