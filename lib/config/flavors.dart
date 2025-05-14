enum AppFlavor {
  bloc,
  provider,
  getx,
  riverpod,
  cubit,
}

class FlavorConfig {
  static AppFlavor? appFlavor;

  static String get name => appFlavor.toString().split('.').last;
}
