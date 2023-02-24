import 'package:shared_preferences/shared_preferences.dart';

class AppCache {
  final SharedPreferences sharedPreferences;

  AppCache._({required this.sharedPreferences});

  factory AppCache.create({
    required SharedPreferences sharedPreferences,
  }) =>
      AppCache._(
        sharedPreferences: sharedPreferences,
      );

  //  缓存类采取单例模式
  static AppCache? _instance;

  //  一定要在main里面初始化
  static Future<void> init() async {
    _instance ??= AppCache.create(
      sharedPreferences: await SharedPreferences.getInstance(),
    );
  }

  // 简化获取工具类的缓存实例，以便在下方封装一些方法
  static SharedPreferences get _pre => _instance!.sharedPreferences;

  static getCollectState(int id) {
    _pre.getBool("isCollect_$id");
  }

  static setCollectState(int id, bool value) {
    _pre.setBool("isCollect_$id", value);
  }
}
