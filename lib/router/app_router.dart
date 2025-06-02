import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sneakx/domain/providers/auth_provider.dart';
import 'package:sneakx/domain/providers/router_provider.dart';
import 'package:sneakx/presentation/view/auth/sign_in_screen.dart';
import 'package:sneakx/presentation/view/auth/sign_up_screen.dart';
import 'package:sneakx/presentation/view/home/home_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final auth = ref.watch(authProvider);
  final user = auth.value;
  final refreshNotifier = ref.watch(routerRefreshProvider);

  return GoRouter(
    initialLocation: '/',
    refreshListenable: refreshNotifier,
    redirect: (context, state) {
      final isLoggingIn = state.uri.toString() == '/signIn';
      if (user == null && !isLoggingIn) return '/signUp';
      if (user != null && isLoggingIn) return '/';
      return null;
    },
    routes: [
      GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
      GoRoute(
        path: '/signIn',
        builder: (context, state) => const SigninScreen(),
      ),
      GoRoute(
        path: '/signUp',
        builder: (context, state) => const SignUpScreen(),
      ),
    ],
  );
});
