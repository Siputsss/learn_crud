part of '_index.dart';

final nav = NavigationBuilder.create(
  initialLocation: _pv.rxUser.st == null ? Routes.login : Routes.productList,
  routes: RouteMap.data,
);
