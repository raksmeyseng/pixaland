import 'package:go_router/go_router.dart';
import 'package:pixaland/config/routes/application.dart';
import 'package:pixaland/config/routes/route_handler.dart';
import 'package:pixaland/core/enum/base_status_enum.dart';

class AppRoute {
  // Core
  static const String splash = 'splash';
  static const String underMaintenance = 'under-maintenance';

  // General
  static const String homefeed = 'homefeed';
  static const String imageDetails = 'image-details';

  static final List<RouteBase> configs = [
    GoRoute(
      name: splash,
      path: '/',
      pageBuilder: splashscreenBuilder,
      redirect: (context, state) {
        if (Application.appBloc.state.status == BaseStatusEnum.success) {
          return '/homefeed';
        }
        return null;
      },
    ),
    GoRoute(
      name: underMaintenance,
      path: '/under-maintenance',
      pageBuilder: underMaintenanceBuilder,
    ),
    GoRoute(
      name: homefeed,
      path: '/homefeed',
      pageBuilder: homeFeedBuilder,
      routes: [
        GoRoute(
          name: imageDetails,
          path: ':id/details',
          pageBuilder: imageDetailsBuilder,
        ),
      ],
    ),
  ];
}
