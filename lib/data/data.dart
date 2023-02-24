///测试demo数据,图片失效可自行替换,数据量可自行增加,结构不可更改

const cardItemData = [
  {
    'id': 1,
    'name': '牛油鲜果沙拉',
    'pirce': 45.0,
    'url':
        'https://lmdevpub.oss.wiqun.com/tester/148/mindstreettester/wiqun/3.food/273doujiao2.jpg',
    'mealType': '当日午餐',
    'isCollect': false,
  },
  {
    'id': 2,
    'name': '日本和牛牛排',
    'pirce': 235.0,
    'url':
        'https://lmdevpub.oss.wiqun.com/tester/148/mindstreettester/wiqun/3.food/274yangzhouchaofan1.jpg',
    'mealType': '次日午餐',
    'isCollect': false,
  },
  {
    'id': 3,
    'name': '水蜜桃甜品',
    'pirce': 60.0,
    'url':
        'https://lmdevpub.oss.wiqun.com/tester/148/mindstreettester/wiqun/2.fruit/202pinguo3.jpg',
    'mealType': '当日午餐',
    'isCollect': true,
  }
];

class DataModel {
  late int id = -1;
  late String name = "";
  late int price = 9999;
  late String url = "";
  late String mealType = "";
  late bool isCollect = false;
  DataModel(item) {
    id = item.id;
    name = item.name;
    price = item.price;
    url = item.url;
    mealType = item.mealType;
    isCollect = item.isCollect;
  }
}

class CardItemList {
  late List<DataModel> cardItemList;
  CardItemList() {
    for (int i = 0; i < cardItemData.length; i++) {
      cardItemList.add(DataModel(cardItemData[i]));
    }
  }
}
