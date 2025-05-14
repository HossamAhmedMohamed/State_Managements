import 'config/flavors.dart';
import 'main_provider.dart' as provider;
import 'main_riverpod.dart' as riverpod;
import 'main_getx.dart' as getx;
import 'main_cubit.dart' as cubit;

void main() {
  const currentFlavor = AppFlavor.cubit;

  switch (currentFlavor) {
    case AppFlavor.riverpod:
      riverpod.main();
      break;
    case AppFlavor.provider:
      provider.main();
      break;
    case AppFlavor.getx:
      getx.main();
      break;
    case AppFlavor.cubit:
      cubit.main();
      break;
    default:
      throw Exception("Flavor not implemented");
  }
}
