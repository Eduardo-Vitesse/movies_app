import 'package:provider/provider.dart';

import '../factories/api_repository_factory.dart';

class MoviesAppInitialBindings {
  static final MoviesAppInitialBindings _singleton =
      MoviesAppInitialBindings._internal();

  factory MoviesAppInitialBindings() {
    return _singleton;
  }

  MoviesAppInitialBindings._internal();

  static List<Provider> dependencies() {
    return [makeApiRepository];
  }
}
