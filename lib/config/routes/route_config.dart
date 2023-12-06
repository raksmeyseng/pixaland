import 'package:go_router/go_router.dart';
import 'package:pixaland/config/routes/app_route.dart';
import 'package:pixaland/config/routes/application.dart';
import 'package:pixaland/core/enum/app_health_enum.dart';
import 'package:pixaland/core/enum/base_status_enum.dart';

class RouteConfig {
  static GoRouter configureRouter() {
    return GoRouter(
      routes: AppRoute.configs,
      initialLocation: '/homefeed',
      // errorPageBuilder: notFoundBuilder,
      redirect: (context, state) {
        if (state.subloc.isEmpty) {
          return null;
        }

        // put this because, developer option & under-maintenance should be accessible in any condition
        if (state.subloc == '/under-maintenance') {
          return null;
        }

        final appState = Application.appBloc.state;
        final appLoaded = appState.status == BaseStatusEnum.success;

        // Check if system under maintenance
        if (state.subloc != '/under-maintenance' &&
            appState.health == AppHealthEnum.underMaintenance) {
          return '/under-maintenance';
        }

        // If app is not loaded yet, go to splash screen first
        if (!appLoaded && state.subloc != '/') {
          return '/?from=${state.subloc}';
        }
        if (state.subloc == '/' && !appLoaded) {
          return null;
        }

        // Go straight to the page
        return null;
      },

      // changes on the listenable will cause the router to refresh it's route
      // refreshListenable: GoRouterRefreshStream(Application.authBloc.stream),

      // log diagnostic info for your routes
      debugLogDiagnostics: true,
    );
  }
}
