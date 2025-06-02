import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sneakx/application/controllers/cart_controller.dart';
import 'package:sneakx/data/models/cart_model.dart';

final cartProvider = StateNotifierProvider<CartController, List<CartItem>>(
  (ref) => CartController(),
);
