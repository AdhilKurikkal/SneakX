import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sneakx/application/controllers/auth_controller.dart';
import 'package:sneakx/data/models/user_model.dart';

final authProvider = AsyncNotifierProvider<AuthController, UserModel?>(() {
  return AuthController();
});
