import 'config/flavors.dart';
import 'main_provider.dart' as provider;
import 'main_riverpod.dart' as riverpod;

void main() {
  const currentFlavor = AppFlavor.provider;

  switch (currentFlavor) {
    case AppFlavor.riverpod:
      riverpod.main();
      break;
    case AppFlavor.provider:
      provider.main();
      break;
    default:
      throw Exception("Flavor not implemented");
  }
}
