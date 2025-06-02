import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sneakx/router/router_refresh_notifier.dart';

final routerRefreshProvider = Provider<GoRouterRefreshNotifier>((ref) {
  return GoRouterRefreshNotifier();
});
