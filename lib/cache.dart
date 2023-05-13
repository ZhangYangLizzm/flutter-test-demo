import 'package:shared_preferences/shared_preferences.dart';

class AppCache {
  final SharedPreferences sharedPreferences;

  //  缓存类采取单例模式
  static AppCache? _instance;

  AppCache._({required this.sharedPreferences});

  //  一定要在main里面初始化
  static Future<void> init() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    _instance = AppCache._(sharedPreferences: sharedPreferences);
  }

  // 简化获取工具类的缓存实例，以便在下方封装一些方法
  static SharedPreferences get _pre => _instance!.sharedPreferences;

  static bool? getCollectState(int id) => _pre.getBool("isCollect_$id");

  static void setCollectState(int id, bool value) =>
      _pre.setBool("isCollect_$id", value);
}
