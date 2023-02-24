///测试demo数据,图片失效可自行替换,数据量可自行增加,结构不可更改
import 'package:shared_preferences/shared_preferences.dart';

const cardItemData = [
  {
    'id': 1,
    'name': '牛油鲜果沙拉',
    'price': 45.0,
    'url': 'https://bing.com/th?id=AMMS_059deac34eff2a4a54364819f2906c76',
    'mealType': '当日午餐',
    'isCollect': false,
  },
  {
    'id': 2,
    'name': '日本和牛牛排',
    'price': 235.0,
    'url':
        'https://th.bing.com/th/id/R.6638265c4d7687749632bbe2dd4c6824?rik=Lw7%2bcHrWnUZkEg&riu=http%3a%2f%2fimg13.360buyimg.com%2fn12%2fjfs%2ft1%2f27289%2f30%2f11938%2f355820%2f5c933588Ef00e0eaf%2f77f9c8539ab40c2a.jpg&ehk=3gvR3Fss0VCIZ048AbE5DIiQzU0tsK99nMvMABA54pM%3d&risl=&pid=ImgRaw&r=0',
    'mealType': '次日午餐',
    'isCollect': false,
  },
  {
    'id': 3,
    'name': '水蜜桃甜品',
    'price': 60.0,
    'url':
        'https://th.bing.com/th/id/R.9717261124030c07b0e2925f62f72647?rik=Xe3LVIQpvtvt7A&riu=http%3a%2f%2f5b0988e595225.cdn.sohucs.com%2fimages%2f20190522%2fed431cc9fd3341f9b04b95287ef2b7c1.jpeg&ehk=k1rKEiSau1jDG9GuivBilvjMKzhK03zU%2fOaLbwNznD0%3d&risl=&pid=ImgRaw&r=0',
    'mealType': '当日午餐',
    'isCollect': true,
  },
  {
    'id': 4,
    'name': '水蜜桃甜品',
    'price': 60.0,
    'url': 'https://bing.com/th?id=AMMS_059deac34eff2a4a54364819f2906c76',
    'mealType': '当日午餐',
    'isCollect': true,
  },
  {
    'id': 5,
    'name': '日本和牛牛排',
    'price': 235.0,
    'url':
        'https://th.bing.com/th/id/R.6638265c4d7687749632bbe2dd4c6824?rik=Lw7%2bcHrWnUZkEg&riu=http%3a%2f%2fimg13.360buyimg.com%2fn12%2fjfs%2ft1%2f27289%2f30%2f11938%2f355820%2f5c933588Ef00e0eaf%2f77f9c8539ab40c2a.jpg&ehk=3gvR3Fss0VCIZ048AbE5DIiQzU0tsK99nMvMABA54pM%3d&risl=&pid=ImgRaw&r=0',
    'mealType': '次日午餐',
    'isCollect': false,
  },
  {
    'id': 6,
    'name': '水蜜桃甜品',
    'price': 60.0,
    'url':
        'https://th.bing.com/th/id/R.9717261124030c07b0e2925f62f72647?rik=Xe3LVIQpvtvt7A&riu=http%3a%2f%2f5b0988e595225.cdn.sohucs.com%2fimages%2f20190522%2fed431cc9fd3341f9b04b95287ef2b7c1.jpeg&ehk=k1rKEiSau1jDG9GuivBilvjMKzhK03zU%2fOaLbwNznD0%3d&risl=&pid=ImgRaw&r=0',
    'mealType': '当日午餐',
    'isCollect': true,
  },
];

class DataModel {
  late int id = -1;
  late String name = "";
  late double price = 9999;
  late String url = "";
  late String mealType = "";
  late bool isCollect = false;
  DataModel(Map<String, Object> item) {
    id = item["id"] as int;
    name = item["name"] as String;
    price = item["price"] as double;
    url = item["url"] as String;
    mealType = item["mealType"] as String;
    isCollect = item["isCollect"] as bool;
  }

  setMealType(value) {
    mealType = value;
  }

  setIsCollect(value) async {
    isCollect = !isCollect;
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("isCollect_$id", false);
  }
}

class CardItemList {
  List<DataModel> cardItemList = [];
  CardItemList() {
    for (int i = 0; i < cardItemData.length; i++) {
      cardItemList.add(DataModel(cardItemData[i]));
    }
  }

  getCardItemList() {
    return cardItemList;
  }
}
