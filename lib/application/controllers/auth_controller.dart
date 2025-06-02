import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sneakx/core/services/auth_service.dart';
import 'package:sneakx/data/models/user_model.dart';
import 'package:sneakx/domain/providers/router_provider.dart';
import 'package:sneakx/router/router_refresh_notifier.dart';

class AuthController extends AsyncNotifier<UserModel?> {
  late GoRouterRefreshNotifier refreshNotifier;

  @override
  Future<UserModel?> build() async {
    refreshNotifier = ref.watch(routerRefreshProvider);
    final user = await AuthService.getCurrentUser();
    return user;
  }

  Future<void> signUp(String name, String email, String password) async {
    final user = await AuthService.signUp(name, email, password);
    state = AsyncData(user);
    refreshNotifier.notify();
  }

  Future<void> login(String email, String pass) async {
    final user = await AuthService.login(email, pass);
    state = AsyncData(user);
    refreshNotifier.notify();
  }

  Future<void> logout() async {
    await AuthService.logout();
    state = const AsyncData(null);
    refreshNotifier.notify();
  }
}
