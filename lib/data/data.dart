///测试demo数据,图片失效可自行替换,数据量可自行增加,结构不可更改
import 'package:flutter_test_demo/cache.dart';

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
    'isCollect': false,
  },
  {
    'id': 4,
    'name': '水蜜桃甜品',
    'price': 60.0,
    'url': 'https://bing.com/th?id=AMMS_059deac34eff2a4a54364819f2906c76',
    'mealType': '当日午餐',
    'isCollect': false,
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
    'isCollect': false,
  },
  {
    'id': 7,
    'name': '水蜜桃甜品',
    'price': 60.0,
    'url': 'https://bing.com/th?id=AMMS_059deac34eff2a4a54364819f2906c76',
    'mealType': '当日午餐',
    'isCollect': false,
  },
  {
    'id': 8,
    'name': '日本和牛牛排',
    'price': 235.0,
    'url':
        'https://th.bing.com/th/id/R.6638265c4d7687749632bbe2dd4c6824?rik=Lw7%2bcHrWnUZkEg&riu=http%3a%2f%2fimg13.360buyimg.com%2fn12%2fjfs%2ft1%2f27289%2f30%2f11938%2f355820%2f5c933588Ef00e0eaf%2f77f9c8539ab40c2a.jpg&ehk=3gvR3Fss0VCIZ048AbE5DIiQzU0tsK99nMvMABA54pM%3d&risl=&pid=ImgRaw&r=0',
    'mealType': '次日午餐',
    'isCollect': false,
  },
  {
    'id': 9,
    'name': '水蜜桃甜品',
    'price': 60.0,
    'url':
        'https://th.bing.com/th/id/R.9717261124030c07b0e2925f62f72647?rik=Xe3LVIQpvtvt7A&riu=http%3a%2f%2f5b0988e595225.cdn.sohucs.com%2fimages%2f20190522%2fed431cc9fd3341f9b04b95287ef2b7c1.jpeg&ehk=k1rKEiSau1jDG9GuivBilvjMKzhK03zU%2fOaLbwNznD0%3d&risl=&pid=ImgRaw&r=0',
    'mealType': '当日午餐',
    'isCollect': false,
  },
  {
    'id': 10,
    'name': '水蜜桃甜品',
    'price': 60.0,
    'url': 'https://bing.com/th?id=AMMS_059deac34eff2a4a54364819f2906c76',
    'mealType': '当日午餐',
    'isCollect': false,
  },
  {
    'id': 11,
    'name': '日本和牛牛排',
    'price': 235.0,
    'url':
        'https://th.bing.com/th/id/R.6638265c4d7687749632bbe2dd4c6824?rik=Lw7%2bcHrWnUZkEg&riu=http%3a%2f%2fimg13.360buyimg.com%2fn12%2fjfs%2ft1%2f27289%2f30%2f11938%2f355820%2f5c933588Ef00e0eaf%2f77f9c8539ab40c2a.jpg&ehk=3gvR3Fss0VCIZ048AbE5DIiQzU0tsK99nMvMABA54pM%3d&risl=&pid=ImgRaw&r=0',
    'mealType': '次日午餐',
    'isCollect': false,
  },
  {
    'id': 12,
    'name': '水蜜桃甜品',
    'price': 60.0,
    'url':
        'https://th.bing.com/th/id/R.9717261124030c07b0e2925f62f72647?rik=Xe3LVIQpvtvt7A&riu=http%3a%2f%2f5b0988e595225.cdn.sohucs.com%2fimages%2f20190522%2fed431cc9fd3341f9b04b95287ef2b7c1.jpeg&ehk=k1rKEiSau1jDG9GuivBilvjMKzhK03zU%2fOaLbwNznD0%3d&risl=&pid=ImgRaw&r=0',
    'mealType': '当日午餐',
    'isCollect': false,
  },
  {
    'id': 13,
    'name': '水蜜桃甜品',
    'price': 60.0,
    'url': 'https://bing.com/th?id=AMMS_059deac34eff2a4a54364819f2906c76',
    'mealType': '当日午餐',
    'isCollect': false,
  },
  {
    'id': 14,
    'name': '日本和牛牛排',
    'price': 235.0,
    'url':
        'https://th.bing.com/th/id/R.6638265c4d7687749632bbe2dd4c6824?rik=Lw7%2bcHrWnUZkEg&riu=http%3a%2f%2fimg13.360buyimg.com%2fn12%2fjfs%2ft1%2f27289%2f30%2f11938%2f355820%2f5c933588Ef00e0eaf%2f77f9c8539ab40c2a.jpg&ehk=3gvR3Fss0VCIZ048AbE5DIiQzU0tsK99nMvMABA54pM%3d&risl=&pid=ImgRaw&r=0',
    'mealType': '次日午餐',
    'isCollect': false,
  },
  {
    'id': 15,
    'name': '水蜜桃甜品',
    'price': 60.0,
    'url':
        'https://th.bing.com/th/id/R.9717261124030c07b0e2925f62f72647?rik=Xe3LVIQpvtvt7A&riu=http%3a%2f%2f5b0988e595225.cdn.sohucs.com%2fimages%2f20190522%2fed431cc9fd3341f9b04b95287ef2b7c1.jpeg&ehk=k1rKEiSau1jDG9GuivBilvjMKzhK03zU%2fOaLbwNznD0%3d&risl=&pid=ImgRaw&r=0',
    'mealType': '当日午餐',
    'isCollect': false,
  },
  {
    'id': 16,
    'name': '水蜜桃甜品',
    'price': 60.0,
    'url':
        'https://th.bing.com/th/id/R.9717261124030c07b0e2925f62f72647?rik=Xe3LVIQpvtvt7A&riu=http%3a%2f%2f5b0988e595225.cdn.sohucs.com%2fimages%2f20190522%2fed431cc9fd3341f9b04b95287ef2b7c1.jpeg&ehk=k1rKEiSau1jDG9GuivBilvjMKzhK03zU%2fOaLbwNznD0%3d&risl=&pid=ImgRaw&r=0',
    'mealType': '当日午餐',
    'isCollect': false,
  },
  {
    'id': 17,
    'name': '水蜜桃甜品',
    'price': 60.0,
    'url':
        'https://th.bing.com/th/id/R.9717261124030c07b0e2925f62f72647?rik=Xe3LVIQpvtvt7A&riu=http%3a%2f%2f5b0988e595225.cdn.sohucs.com%2fimages%2f20190522%2fed431cc9fd3341f9b04b95287ef2b7c1.jpeg&ehk=k1rKEiSau1jDG9GuivBilvjMKzhK03zU%2fOaLbwNznD0%3d&risl=&pid=ImgRaw&r=0',
    'mealType': '当日午餐',
    'isCollect': false,
  },
  {
    'id': 18,
    'name': '水蜜桃甜品',
    'price': 60.0,
    'url':
        'https://th.bing.com/th/id/R.9717261124030c07b0e2925f62f72647?rik=Xe3LVIQpvtvt7A&riu=http%3a%2f%2f5b0988e595225.cdn.sohucs.com%2fimages%2f20190522%2fed431cc9fd3341f9b04b95287ef2b7c1.jpeg&ehk=k1rKEiSau1jDG9GuivBilvjMKzhK03zU%2fOaLbwNznD0%3d&risl=&pid=ImgRaw&r=0',
    'mealType': '当日午餐',
    'isCollect': false,
  },
  {
    'id': 19,
    'name': '水蜜桃甜品',
    'price': 60.0,
    'url':
        'https://th.bing.com/th/id/R.9717261124030c07b0e2925f62f72647?rik=Xe3LVIQpvtvt7A&riu=http%3a%2f%2f5b0988e595225.cdn.sohucs.com%2fimages%2f20190522%2fed431cc9fd3341f9b04b95287ef2b7c1.jpeg&ehk=k1rKEiSau1jDG9GuivBilvjMKzhK03zU%2fOaLbwNznD0%3d&risl=&pid=ImgRaw&r=0',
    'mealType': '当日午餐',
    'isCollect': false,
  },
  {
    'id': 20,
    'name': '水蜜桃甜品',
    'price': 60.0,
    'url':
        'https://th.bing.com/th/id/R.9717261124030c07b0e2925f62f72647?rik=Xe3LVIQpvtvt7A&riu=http%3a%2f%2f5b0988e595225.cdn.sohucs.com%2fimages%2f20190522%2fed431cc9fd3341f9b04b95287ef2b7c1.jpeg&ehk=k1rKEiSau1jDG9GuivBilvjMKzhK03zU%2fOaLbwNznD0%3d&risl=&pid=ImgRaw&r=0',
    'mealType': '当日午餐',
    'isCollect': false,
  },
];

class DataModel {
  int id;
  String name;
  double price;
  String url;
  String mealType;
  bool isCollect;

  DataModel({
    required this.id,
    required this.name,
    required this.price,
    required this.url,
    required this.mealType,
    required this.isCollect,
  });

  Future<void> setIsCollect(bool value) async {
    isCollect = value;
    AppCache.setCollectState(id, value);
  }
}

class CardItemList {
  List<DataModel> cardItemList = cardItemData
      .map((item) => DataModel(
            id: item["id"] as int,
            name: item["name"] as String,
            price: item["price"] as double,
            url: item["url"] as String,
            mealType: item["mealType"] as String,
            isCollect: item["isCollect"] as bool,
          ))
      .toList();

  DataModel getCardItemFromCardId(int id) {
    final index = cardItemList.indexWhere((element) => element.id == id);
    return cardItemList[index];
  }
}
