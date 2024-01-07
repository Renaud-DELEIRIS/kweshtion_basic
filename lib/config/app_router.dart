import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kweshtion_basic/views/page/auth/auth_root.page.dart';
import 'package:kweshtion_basic/views/page/auth/login.page.dart';
import 'package:kweshtion_basic/views/page/auth/register.page.dart';
import 'package:kweshtion_basic/views/page/bottom_bar.page.dart';
import 'package:kweshtion_basic/views/page/history/history_root.page.dart';
import 'package:kweshtion_basic/views/page/home/home_root.page.dart';
import 'package:kweshtion_basic/views/page/search/create_category.page.dart';
import 'package:kweshtion_basic/views/page/history/history.page.dart';
import 'package:kweshtion_basic/views/page/home/home.page.dart';
import 'package:kweshtion_basic/views/page/profile.page.dart';
import 'package:kweshtion_basic/views/page/search/search.page.dart';
import 'package:kweshtion_basic/views/page/search/search_root.page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: BottomBarRoute.page,
          initial: true,
          children: [
            AutoRoute(
              page: HomeRootRoute.page,
              initial: true,
              path: 'home',
              children: [
                AutoRoute(
                  page: HomeRoute.page,
                  initial: true,
                  path: "",
                ),
              ],
            ),
            AutoRoute(
              page: HistoryRootRoute.page,
              path: 'history',
              children: [
                AutoRoute(
                  page: HistoryRoute.page,
                  initial: true,
                  path: "",
                ),
                AutoRoute(
                  page: HomeRoute.page,
                  path: "kwesh",
                ),
              ],
            ),
            AutoRoute(
              page: SearchRootRoute.page,
              path: 'search',
              children: [
                AutoRoute(
                  page: SearchRoute.page,
                  path: "",
                  initial: true,
                ),
                AutoRoute(
                  page: CreateCategoryRoute.page,
                  path: "create",
                ),
                AutoRoute(
                  page: HomeRoute.page,
                  path: "kwesh",
                ),
              ],
            ),
            AutoRoute(
              page: LoginRoute.page,
              path: "login",
            ),
            AutoRoute(
              page: ProfileRoute.page,
              path: "profile",
            ),
          ],
        ),
        AutoRoute(
          page: AuthRootRoute.page,
          path: "/auth",
          children: [
            AutoRoute(
              page: LoginRoute.page,
              path: "login",
              initial: true,
            ),
            AutoRoute(
              page: RegisterRoute.page,
              path: "register",
            )
          ],
        ),
      ];
}
