import 'package:cajero_automatico_app/screens/home/home_screen.dart';
import 'package:cajero_automatico_app/screens/retiro/retiro_screen.dart';
import 'package:cajero_automatico_app/screens/transferencias/transferencias_screen.dart';

typedef T Constructor<T>();

final Map<String, Constructor<Object>> _constructors =
    <String, Constructor<Object>>{};

void register<T>(Constructor<T> constructor) {
  _constructors[T.toString()] = constructor;
}

class ClassBuilder {
  static void registerClasses() {
    register<HomeScreen>(() => HomeScreen());
    register<TransferenciasScreen>(() => TransferenciasScreen());
    register<RetiroScreen>(() => RetiroScreen());
  }

  static dynamic fromString(String type) {
    return _constructors[type]();
  }
}
