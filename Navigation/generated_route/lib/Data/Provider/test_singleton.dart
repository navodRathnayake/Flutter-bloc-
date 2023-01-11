library test_singleton;

class Singleton {
  static late final Singleton? _instance;

  Singleton._init();

  static Singleton get instance => _instance ??= Singleton._init();
}
