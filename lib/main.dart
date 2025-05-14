import 'config/flavors.dart';
import 'main_provider.dart' as provider;
import 'main_riverpod.dart' as riverpod;
import 'main_getx.dart' as getx;
import 'main_cubit.dart' as cubit;
import 'main_bloc.dart' as bloc;

void main() {

  /* Very Important for Success login
  {
    "email": "hossaaamahmed6@gmail.com",
    "password": "hossam1234567"
}
  */

  
  const currentFlavor = AppFlavor.bloc;

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
    case AppFlavor.bloc:
      bloc.main();
      break;
  }
}
