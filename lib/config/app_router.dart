import 'package:auto_route/auto_route.dart';
import 'package:kweshtion_basic/views/page/history.page.dart';
import 'package:kweshtion_basic/views/page/home.page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true, path: '/'),
        AutoRoute(page: HistoryRoute.page, path: '/history'),
      ];
}
