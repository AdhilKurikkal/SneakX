import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sneakx/data/models/cart_model.dart';
import 'package:sneakx/data/models/product_model.dart';

class CartController extends StateNotifier<List<CartItem>> {
  CartController() : super([]);

  // add item to cart
  void addToCart(ShoeModel shoe, String size) {
    final index = state.indexWhere(
      (item) => item.shoe.id == shoe.id && item.size == size,
    );

    if (index == -1) {
      state = [...state, CartItem(shoe: shoe, size: size)];
    } else {
      state[index].quantity++;
      state = [...state];
    }
  }

  //icrement quantity

  void incrementQunty(int index) {
    state[index].quantity++;
    state = [...state];
  }

  //decrement
  void decrementQunty(int index) {
    if (state[index].quantity > 1) {
      state[index].quantity--;
      state = [...state];
    } else {
      state.removeAt(index);
      state = [...state];
    }
  }

  //
  int get totalPrice => state.fold(0, (sum, item) => sum + item.totalPrice);
}
